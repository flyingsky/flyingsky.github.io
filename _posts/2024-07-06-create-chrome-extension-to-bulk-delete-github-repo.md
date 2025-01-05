---
layout: post
date: 2024-07-06 10:02:38 -0700
title: Create Chrome Extension to Bulk Delete GitHub Repos
categories: home
---

I noticed I have many test repos in GitHub but forgot to delete them. The GitHub only provides UX to delete repo one by one. Why not have a Chrome extension to automatic the deletion process to save the time?

Actually I did some Chrome extension development a little bit, but always forgot it after my work. This time I will write down everything and publish the extension to Chrome Store.

### Chrome Extension Basic

The latest Chrome extension is v3 because the newest manifest file is v3. The manifest is the json description and setting file for the Chrome extension, which defines the extension name, version, permission, content, actions and service worker, etc. You can find our example manifest.json from [github](https://github.com/flyingsky/github-bulk-delete/blob/main/public/manifest.json). It also listed the icons used by your extension.

A Chrome extension usually has 3 parts in the most cases:

- serviceWorker.js: the script runs all the time during the chrome extension lifecycle.
- contentScript.js: the script injected in the web page to update the web page DOM tree.
- popup.js: the script used by the popup window.

![Chrome extension architecture](/assets/2024-07-06-3.png){:width="50%"}

This is Chrome extension Manifest V2 architecture, but V3 is very similar. I didn't find the new architecture, but the basic idea is the same. The only difference is the background.js is replaced by the [serviceWorker](https://developer.chrome.com/docs/extensions/develop/concepts/service-workers). They communicate via [messages](https://developer.chrome.com/docs/extensions/develop/concepts/messaging) or [storage](https://developer.chrome.com/docs/extensions/develop/concepts/storage-and-cookies), which are the same.

In our example, to bulk delete github repostiories we need to do:

1. Add checkbox next to each repo name in the repository list.

   We inject the contentScript.js to the repository list page, so it could add the checkbox next to each repo, see the screenshot like below.

   ![Updated Repository Page](/assets/2024-07-06-4.png){:width="50%"}

2. Add delete button to trigger the bulk delete

   We still use the contentScript.js to add the "Delete" button like the above screenshot. But once it's clicked, we have to go to the repository settings page and find the delete related button and simulate a serias of actions to finish one repository delete. Once it's done, we have to do the same actiosn for the next repository. To achieve that, we have to use the service worker that has longer life and could control the whole process.

This extension doesn't need popup dialog, so we skip it. To learn more, you could check the Chrome Extension Manifest V3 [Get Started](https://developer.chrome.com/docs/extensions/get-started).

### How to develop

Finally we could start the development after some basic introduction. You can find all the source code from the [github](https://github.com/flyingsky/github-bulk-delete).

We use nodejs tool [chrome-extension-cli](https://github.com/dutiyesh/chrome-extension-cli) to generate the boilerplate code. You can find more details from its github page to learn how to use it.

Based on previous discussion, you can see our [contentScript.js](https://github.com/flyingsky/github-bulk-delete/blob/main/src/contentScript.js) add the checkboxes and delete button. Once the delete button is clicked, we use `chrome.runtime.sendMessage` to notify the service worker to delete the selected repositories.

In the [background.js](https://github.com/flyingsky/github-bulk-delete/blob/main/src/background.js) uses `chrome.runtime.onMessage.addListener` to listen the delete request, which has a list of repositories to be deleted. It loops the list of repos and uses `chrome.scripting.executeScript` to run a serias of DOM actions to simulate the manual work. Once the repo is deleted, we have to wait for 2000ms because the web page will redirect to the repository list page by default. If we go to the next repository settings directly, that navigation will be overridden by the repository list redirection.

### How to debug

You could debug the contentScript.js, serviceWorker.js and popup.js. Basically:

- The contentScript.js is loaded in the target url, so you can right click the web page to open the dev tools and find the contentScript.js. Add any breakpoint then refresh the page, it will pause at your breakpoint. See below screenshot:

![Add breakpoint to the contentScript.js](/assets/2024-07-06-1.png){:width="50%"}

- The serviceWork.js is run in the background, you can find it from the chrome extension itself. Go to the chrome://extensions, load unpacked extension from your local file. Then you can see the "service work" link in your extension. Click it to open the service work related js and debug it like normal script. See below screenshot

![Add breakpoint to the service worker.js](/assets/2024-07-06-2.png){:width="50%"}

- Popup.js is the popup dialog for the extension icon. Click the extension icon to open the popup dialog then right click to select the developer tool, then you could debug it like normal js.

See more details from [the official chrome extension dev tutorial](https://developer.chrome.com/docs/extensions/get-started/tutorial/debug).

### How to publish

Once you finish the development, you could run `npm run repack` to clean the build and pack the extension. Before that you may want to have your own extension icon. I use Facebook Messenger AI chatbot to generate the icon like [this](https://github.com/flyingsky/github-bulk-delete/blob/main/public/icons/icon_128.png). Actually I tried Genmini but it doesn't work as well as Messenger. Anyway the point is you could use LLM to generate icon now!

Go to https://chrome.google.com/webstore/devconsole to upload your packed extension. To publish it you need to pay $5 before. Once you submit it, it requires ~1 day to be approved. That's it! Check our extension, [GitHub Bulk Delete](https://chromewebstore.google.com/detail/github-bulk-delete/npleadnddajjokllpjmpkekijopogeci) and give 5 stars to support my work. Thanks!

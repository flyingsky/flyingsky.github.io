---
layout: post
date: 2016-06-28 13:13:53 -0700
title: how to use phonegap to do auto subscription
---

Phonegap was once popular solution to build ios app with web skills. But now there are more better choices, such as [React Native](https://facebook.github.io/react-native/) or [NativeScript](https://www.nativescript.org/), but I think Phonegap's advantage is a lot of plugins. In the past half year, I spent a lot time to use [cordova-plugin-purchase](https://github.com/j3k0/cordova-plugin-purchase) to support auto subscription, though this plugin has some problem and author doesn't provide server receipt validation code or even explanation, but it seems it is still the best purchase plugin. After a lot struggling, finally I figure it how to do it.

## How to subscribe
Actually it works well when you need get the purchased item information from apple store and subscribe. The detail you can find from the doc from [here](https://github.com/j3k0/cordova-plugin-purchase/blob/master/doc/ios.md) and [here](https://github.com/j3k0/cordova-plugin-purchase/blob/master/doc/api.md).

You need to set store.validator to your server receipt validation url or function to call server validation. In my code I set it a function like below:

```JavaScript

    store.validator = function(product, callback) {
      validateReceipt(product, callback);
    };

    /**
     *
     * @param {Object} product
     * @param {function(success, data)} callback
     * @param {Boolean} callback.success
     * @param {Object|String} callback.data - it's object if success, else it's string for error message
     * @private
     */
    function validateReceipt(product, callback) {
      // Obviously you need use your own callAjax function and url endpoint here
      callAjax('receipt-validate', product).then(function(response) {
        var result = response.data;
        callback(result && result.ok, result.data);   // ok is required field in response, which is true of false.
      }, function(err) {
        callback(false, err);
      });
    }

    // Also you need register your listeners on the product you're interested
    function registerProduct(product) {
      store.when(product.id).approved(function(p) {
        console.log("verify subscription");
        p.verify(); // this invoke to call server verify
      });

      store.when(product.id).verified(function(p) {
        p.finish(); // whole purchase finished
      });

      store.when(product.id).unverified(function(p) {
        console.log("subscription unverified");
        // TODO: fail to verify, alert error here
      });

      store.when(product.id).updated(function(p) {
        if (p.owned) {
          console.log('You are a lucky subscriber!');
          // TODO: let user know purchase is done!
        } else {
          console.log('You are not subscribed');
        }
      });
    }
```

## Server validation
The most important thing to notice is that your app send the whole product information to server side, your server side should get the "data.transaction.appStoreReceipt" and send it to apple store to do validate. You can find more information from [apple doc](https://developer.apple.com/library/ios/releasenotes/General/ValidateAppStoreReceipt/Chapters/ValidateRemotely.html#//apple_ref/doc/uid/TP40010573-CH104-SW1).

I believe you will be confused by that doc, because it's not clear. In conclusion:
1. You can always use same token sent to apple store to validate if you subscribe one app with same account. That is the appStoreReceipt in transaction of our request data. This property is set by cordova-plugin-purchase plugin. If you read the source code, you can see it gets the value with the same code from apple doc mentioned before.
2. Base on step #1, you need save that token in your server database, so you can reuse it in future validation.
3. When you send that token to apple store, you can get response from apple store, see more from above apple doc link. The most important field is status and latest_receipt_info. Field 'status' show if the token is valid, if it's valid, you need check the latest_receipt_info, which contains history receipt information. You need loop them and find the "expiration_date" or "expires_date_ms" to make sure this utc time is after your current time. If yes, it's valid, else it's expired. Second if you find field "cancellation_date", it means this subscription is cancelled.

Yes, that's the whole server side process. Note you need save the original permanent token in your db. In my server side, I use php and use [php plugin](https://github.com/aporat/store-receipt-validator) to send and parse apple store request and response.


## How to validate receipt after auto renewal
I'm confused by the cordova-plugin-purchase to do validation after first purchase, because the product.owned is not trustable, sometimes the subscription is expired the value is still true. Sometimes the user still valid, the value is false. Also if your server side use the error code based on it's source code, like 6778003 as expired error code, the plugin will retry many times and your app will hang there for a long time, even crash.

The easy way to do the validation is invoking server validation manually by yourself. Notice we already save the token for the user, in another word we can have one userid and token pair are saved in db, so client just send userid to server side, server side can get the saved token from db and send request to apple store to check. That's it.

So don't use the suck plugin's validation again here!!!


## How to do restore in another app
Actually if user install same app on another device, you need restore. It seems the phonegap plugin support it, but i don't know how to use it. I always think it's so complex. Fortunately in my case, I don't need it. Because user need login in my app, so I can get the userId after login, same as above step, based on the userId, I can do receipt check. Hope this can solve your problem. Before I use product.transaction.transactionReceipt, not product.transaction.appStoreReceipt, which is only valid for the first period, after that, it's always invalid. Occasionally I find I can use the permanent product.transaction.appStoreReceipt, then the problem is solved.

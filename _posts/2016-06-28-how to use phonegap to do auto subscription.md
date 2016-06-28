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



## How to validate receipt after auto renewal



## How to do restore in another app

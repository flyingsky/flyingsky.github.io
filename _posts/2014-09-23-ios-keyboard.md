---
layout: post
categories: home
---

On iOS we may need relayout our app when keyboard was shown. To handle it, we can observer below four notifications to know when the keyboard is shown or hidden.

    UIKeyboardWillShowNotification
    UIKeyboardDidShowNotification
    UIKeyboardWillHideNotification
    UIKeyboardDidHideNotification


  
But we should know the keyboard related notifications are not always posted. `UIKeyboardWillShowNotification/UIKeyboardDidShowNotification` only be posted when the keyboard is changed, including the keyboard visibility and keyboard size change. For example:

1. Keyboard is displayed and before is not visible, you can get `UIKeyboardWillShowNotification/UIKeyboardDidShowNotification`
2. Keyboard size is changed, UITextField doesn't have customized toolbar on keyboard, but UITextView has one, so change focus between UITextField and UITextView, you can get `UIKeyboardWillShowNotification/UIKeyboardDidShowNotification`
3. Otherwise, you cannot get `UIKeyboardWillShowNotification/UIKeyboardDidShowNotification`. For example you change focus between UITextField, or UITextView. Because the keyboard size is not changed.

Further step, the keyboard So if you change the focus from one `UITextField/UITextView` to another one, you cannot get he `UIKeyboardWillShowNotification/UIKeyboardDidShowNotification`. To support the focus changes between text view, we should track the text view.

## Solution

### Case 1: Recieve keyboard notification

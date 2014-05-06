# Basic
On iOS we may need relayout our app when keyboard was shown. To handle it, we can observer below four notifications to know when the keyboard is shown or hidden.

  UIKeyboardWillShowNotification
  UIKeyboardDidShowNotification
  UIKeyboardWillHideNotification
  UIKeyboardDidHideNotification
  
But we should know the keyboard related notification is not always posted, it's just posted when the keyboard from visible to unvisible or rese vise. So if you change the focus from one UITextField/UITextView to another one, you cannot get he UIKeyboardWillShowNotification/UIKeyboardDidShowNotification.

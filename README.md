# KAlertBox
İOS Beautiful Animated Alert Box

![alt tag](https://cloud.githubusercontent.com/assets/16580898/20465823/77ba858c-af6f-11e6-8dfe-f26fd4da7986.png)

![alt tag](https://cloud.githubusercontent.com/assets/16580898/20465832/9c6ae9ee-af6f-11e6-9aec-33dcded3f2be.png)

Default Alert Box init

```Swift
 abox = KAlertBox(to: self.view, status: .success, title: "Title", subtitle: "Subtitle", animationPosition: .bottom, alertStyle: .action)
 abox.setup()
 abox.addAction()
```
or set action handle code

```Swift
abox.addAction { 
            // code
        }
```
You should change design

![alt tag](https://cloud.githubusercontent.com/assets/16580898/20465836/a9539f20-af6f-11e6-9c6f-7234e9d80b13.png)

Select your need init
```Swift
KAlertBox(to: self.view, status: .success, title: "", subtitle: "", animationPosition: .left, alertStyle: .action)
KAlertBox(to: self.view, status: .warning, title: "", subtitle: "", animationPosition: .right, buttonActionTitle: "", buttonActionColor: UIColor.red)
KAlertBox(to: self.view, status: .error, title: "", subtitle: "", animationPosition: .bottom, buttonActionTitle: "", buttonCancelTitle: "")
KAlertBox(to: self.view, status: .success, title: "", subtitle: "", animationPosition: .none, buttonActionTitle: "", buttonCancelTitle: "", buttonActionColor: UIColor.black, buttonCancelColor: UIColor.white)
```
Select Diffrent Animation types

```Swift
    .top
    .bottom
    .left
    .right
    .none
```

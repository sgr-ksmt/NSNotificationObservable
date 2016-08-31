# NSNotificationObservable
Easy to use `NSNotification` from ENum (String raw)

Available Swift2.2 and **Swift3.0** !

```swift
enum UserNotification: String, NSNotificationObservable {
    case DidLogIn
    case DidLogOut
    case DidReload
}

UserNotification.DidLogIn.addObserver(self, selector: #selector(self.userDidLogIn(_:)))
UserNotification.DidLogIn.post(user, userInfo)
UserNotification.DidLogIn.removeObserver(self)

// using block
let observer = UserNotification.DidLogIn.addObserver() { notification in
    // ... do something
}
```

## blog
- http://techblog.timers-inc.com/entry/2016/07/25/120630

### MultiUser handling for swift

MultiUser is **created and maintaned with ❥** by Sascha Muellner.

---

[![Travis CI](https://travis-ci.org/smuellner/MultiUser-for-swift.svg?branch=master)](https://travis-ci.org/smuellner/MultiUser-for-swift)
[![Maintainability](https://api.codeclimate.com/v1/badges/960d3ef98a6e144689c5/maintainability)](https://codeclimate.com/github/smuellner/MultiUser-for-Swift/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/960d3ef98a6e144689c5/test_coverage)](https://codeclimate.com/github/smuellner/MultiUser-for-Swift/test_coverage)
[![Platforms](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20Linux-lightgrey.svg)](https://smuellner.github.io/MultiUser-for-swift)
[![Version](https://img.shields.io/cocoapods/v/MultiUser.svg?style=flat)](https://github.com/smuellner/MultiUser-for-swift/releases/latest)
[![License](https://img.shields.io/cocoapods/l/MultiUser.svg?style=flat)](https://cocoapods.org/pods/MultiUser)
[![Swift Version](https://img.shields.io/badge/swift-5.1-orange.svg?style=flat)](https://developer.apple.com/swift)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-orange.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
[![README](https://img.shields.io/badge/-README-lightgrey)](https://smuellner.github.io/MultiUser-for-Swift)


## Requirements

The latest version of MultiUser requires:

- Swift 5+
- iOS 13+
- Xcode 11+

## Installation

### Swift Package Manager
Using SPM add the following to your dependencies

``` 'MultiUser', 'master', 'https://github.com/smuellner/MultiUser-for-swift.git' ```

### CocoaPods
Using CocoaPods add the following to your Podfile:

```pod 'MultiUser-for-Swift', '~> 1.0.1'```

### What?
This is a **Swift** package with support for iOS/macOS/tvOS/watchOS that allows to store user releated data for multiple users of an application.

### How to use?

#### Service

The **UserService** cares for the whole user handling and implements the **UserServiceProtocol**.
To allow for access throughout your application place the **UserService** in a shared instance like the Application Delegate or use a dependency injection framework like **Swinject**.

```swift

// AppDelegate.swift

let userService = UserService()





```


#### User

Retrieve a list of all users:

```swift

let userService = UserService()

print(userService.allUsers)
//

```


Create a user

```swift

let user = userService.createUser()
user.username = ""
user.firstname = ""
user.lastname = ""

userService.saveUser(user)

```

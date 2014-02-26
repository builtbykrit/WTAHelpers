About WTAHelpers
================

WTAHelpers is a collection of useful categories for iOS development that will help you make your life easier.

## About the Helpers
- `WTAAutoLayoutHelpers` - Categories on `UIView` and `NSLayoutConstraint` for creating common auto layout constraints.
- `WTAFrameHelpers` - A category on `UIView` for common getting and setting methods on frames.
- `WTANibLoading` - A category on `UIView` for instantiating instances from nibs easier.
- `WTAReusableIdentifier` - Categories on reusable cells and view's in `UICollectionView` and `UITableView` for creating reusable identifiers.
- `WTAColorImage` - A category on `UIImage` for creating UIImages with a solid color as its contents.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is the dependency manager for Objective-C projects. It has thousands of libraries and can help you scale your projects elegantly.

Currently WTAHelpers is not in a CocoaPods spec repository because it is still undergoing rapid development.

Including all of the helpers in your Podfile:

```ruby
pod 'WTAHelpers', :git => 'git@github.com:willowtreeapps/WTAHelpers.git', :tag => '0.0.1'
```

Including specific subspecs in your Podfile:

```ruby
pod "WTAHelpers/WTAFrameHelpers", :git => 'git@github.com:willowtreeapps/WTAHelpers.git', :tag => '0.0.1'
pod "WTAHelpers/WTAAutoLayoutHelpers", :git => 'git@github.com:willowtreeapps/WTAHelpers.git', :tag => '0.0.1'
```

## Usage

### Importing the Helpers

If you are using a lot of the helpers, you can import all of them at once with:

`#import <WTAHelpers/WTAHelpers.h>` 

Otherwise import each helper separately:

```objective-c
#import <WTAHelpers/UIView+WTAAutoLayoutHelpers.h>
#import <WTAHelpers/UIView+WTAFrameHelpers.h>
```

### WTAAutoLayoutHelpers
### WTAFrameHelpers
### WTANibLoading
### WTAReusableIdentifier
### WTAColorImage

## License

AFNetworking is available under the MIT license. See the LICENSE file for more info.
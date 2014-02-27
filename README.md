#About WTAHelpers

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

Import all of them at once with:

`#import <WTAHelpers/WTAHelpers.h>` 

Or import each helper separately:

```objective-c
#import <WTAHelpers/UIView+WTAAutoLayoutHelpers.h>
#import <WTAHelpers/UIView+WTAFrameHelpers.h>
```

### WTAAutoLayoutHelpers

`WTAAutoLayoutHelpers` is an attempt to make auto layout through code easier and clear. The category methods found in `UIView+WTAAutoLayoutHelpers.h` and `NSLayoutConstraint+WTAAutoLayoutHelpers.h` provide convenience methods for adding and creating constraints.

#### Adding constraints
Here is an example that creates a constraint that places a view 5px from the top of its superview and adds the constraint to the view's superview.

Note that some constraints are added to the view's superview. So you will need to make sure the view is added as a subview before using this helper.

```objective-c
[view wta_addTopConstraintToSuperviewOffset:5.0];
```

#### Creating constraints
If you don't want the view's constraint added immediately, you can create the constraint with the `NSLayoutConstraint` category methods. The following two lines are equal to the line in the previous example.
```objective-c
NSLayoutConstraint *constraint = [NSLayoutConstraint wta_topConstraintWithView:view toView:[view superview] offset:5.0];
[[view superview] addConstraint:constraint]
```
---

### WTAFrameHelpers
### WTANibLoading
### WTAReusableIdentifier
### WTAColorImage

## License

AFNetworking is available under the MIT license. See the LICENSE file for more info.
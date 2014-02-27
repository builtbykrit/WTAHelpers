#About WTAHelpers

WTAHelpers is a collection of useful categories for iOS development that will help you make your life easier.

## About the Helpers
- `WTAAutoLayoutHelpers` - Categories on `UIView` and `NSLayoutConstraint` for creating common Auto Layout constraints.
- `WTAFrameHelpers` - A category on `UIView` for common getting and setting methods on frames.
- `WTANibLoading` - A category on `UIView` to easily create an instance from a nib.
- `WTAReusableIdentifier` - Categories on reusable cells and view's in `UICollectionView` and `UITableView` for creating reusable identifiers.
- `WTAColorImage` - A category on `UIImage` for creating images with a solid color as its contents.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is the dependency manager for Objective-C projects. It has thousands of libraries and can help you scale your projects elegantly.

Currently WTAHelpers is not in tbe CocoaPods spec repository because it is still undergoing rapid development.

#### Including all of the helpers in your Podfile:

```ruby
pod 'WTAHelpers', :git => 'git@github.com:willowtreeapps/WTAHelpers.git', :tag => '0.0.1'
```

#### Including individual subspecs in your Podfile:

```ruby
pod "WTAHelpers/WTAFrameHelpers", :git => 'git@github.com:willowtreeapps/WTAHelpers.git', :tag => '0.0.1'
pod "WTAHelpers/WTAAutoLayoutHelpers", :git => 'git@github.com:willowtreeapps/WTAHelpers.git', :tag => '0.0.1'
```

## Usage

### Importing the Helpers

Import all of them at once with:

```objective-c
#import <WTAHelpers/WTAHelpers.h>
```

Or import each helper separately:

```objective-c
#import <WTAHelpers/UIView+WTAAutoLayoutHelpers.h>
#import <WTAHelpers/UIView+WTAFrameHelpers.h>
```

## WTAAutoLayoutHelpers

`WTAAutoLayoutHelpers` is an attempt to make Auto Layout through code less painful. The category methods found in `UIView+WTAAutoLayoutHelpers.h` and `NSLayoutConstraint+WTAAutoLayoutHelpers.h` provide convenience methods for adding and creating common constraints.

### Adding constraints
Here is an example that creates a constraint that places a view 5px from the top of its superview and adds the constraint to the view's superview.

Note that some constraints are added to the view's superview. So you will need to make sure the view is added as a subview before using this helper.

```objective-c
[view wta_addTopConstraintToSuperviewOffset:5.0];
```

### Creating constraints
If you don't want the view's constraint added immediately, you can create the constraint with the `NSLayoutConstraint` category methods. The following two lines are equal to the line in the previous example.
```objective-c
NSLayoutConstraint *constraint = [NSLayoutConstraint wta_topConstraintWithView:view toView:[view superview] offset:5.0];
[[view superview] addConstraint:constraint]
```

### Instantiating a View for Auto Layout
Commonly enough, we run into a problem with Auto Layout and realize its because we didn't set `translatesAutoresizingMasksIntoConstraints` to `NO`. This constructor will hopefully help you with that. Or at least remind you that you need to set it.
```
UIView *view = [UIView wta_autolayoutView];
```

### Common Constraints

- Setting edge constraints from a view to its superview (e.g. `wta_addLeadingConstraintToSuperviewOffset:`).
- Aligning edges for sibling views (e.g. `wta_addLeadingConstraintToView:offset:`).
- Placing sibling views adjacent to one eachother (e.g. `wta_addConstraintPlacingViewRightOfView:separation:`).
- Centering views in their superview (e.g. `wta_addCenteringConstraintToSuperviewOffset:`).
- Setting the size of a view with constraints (e.g. `wta_addHeightConstraint:`).


## WTAFrameHelpers
## WTANibLoading
## WTAReusableIdentifier
## WTAColorImage

## License

WTAHelpers is available under the MIT license.
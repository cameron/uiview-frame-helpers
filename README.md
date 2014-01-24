Drowning in layout code? Use these helpers to reduce layout code by up to 75% in common cases. See the .h file for the complete interface.

### Setting X and Y
```Objective-C
// Then
CGRect frame = myView.frame;
frame.origin.x = ...
frame.origin.y = ...
myView.frame = frame;

// Now
[myView setX:myXVal andY:myYVal];
```

### Adjusting X and Y
```Objective-C
// Then
CGRect frame = myView.frame;
frame.origin.x = frame.origin.x + xDelta;
frame.origin.y = frame.origin.y + yDelta;
myView.frame = frame;

// Now
[myView adjustX:xDelta andY:yDelta];
```

### Positioning relative to another view, or the superview 
```Objective-C
// Then
CGRect frame = myView.frame;
frame.origin.x = myOtherView.origin.x + myOtherView.size.width + kMyPaddingConst;
frame.origin.y = myOtherView.origin.y;
myView.frame = frame;

// Now
[myView insideTopEdgeOfSuperviewBy:0];
[myView outsideRightEdgeOf:myOtherView by:kMyPaddingConst];
```

### Chaining

```Objective-C
[[myView insideTopEdgeOfSuperviewBy:0] outsideRightEdgeOf:myOtherView by:kMyPaddingConst];
```


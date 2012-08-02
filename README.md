Drowning in layout code? Use these helpers to reduce layout code by up to 75% in common cases. See the .h file for the complete interface.

### Then

    CGRect frame = myView.frame;
    frame.origin.x = ...
    frame.origin.y = ...
    myView.frame = frame;

### Now

    [myView setX:myXVal andY:myYVal];

### Then

    CGRect frame = myView.frame;
    frame.origin.x = frame.origin.x + xDelta;
    frame.origin.y = frame.origin.y + yDelta;
    myView.frame = frame;

### Now

    [myView adjustX:xDelta andY:yDelta];

### Then

    CGRect frame = myView.frame;
    frame.origin.x = myOtherView.origin.x + myOtherView.size.width + kMyPaddingConst;
    frame.origin.y = myOtherView.origin.y;
    myView.frame = frame;

### Now

    [myView insideTopEdgeOfSuperviewBy:0];
    [myView outsideRightEdgeOf:myOtherView by:kMyPaddingConst];

# Notes

If you are using the relative positioning helpers, e.g. insideSomeEdgeOfSuperviewBy: or outsideOtherEdgeOf:by:, make sure to call them after you've added the receiver to its superview.

The more-generic inside/outsideOf:by: methods do not depend on the view hierarchy's configuration.
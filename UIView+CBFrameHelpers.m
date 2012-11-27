// Copyright (c) 2012 Cameron Boehmer

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.

#import "UIView+CBFrameHelpers.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (FrameHelpers)


- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}


- (id)setX:(CGFloat)x
{
    [self setX:x andY:self.frame.origin.y];
    return self;
}

- (id)setY:(CGFloat)y
{
    [self setX:self.frame.origin.x andY:y];
    return self;
}

- (id)setX:(CGFloat)x andY:(CGFloat)y
{
    CGRect f = self.frame;
    self.frame = CGRectMake(x, y, 
                            f.size.width, f.size.height);
    return self;
}

// The setters below exist because the setters above return a reference
// to self, which is something setters of @properties are not allowed to do,
// and the compiler otherwise complains.

- (void)_setX:(CGFloat)x
{
    [self setX:x];
}

- (void)_setY:(CGFloat)y
{
    [self setY:y];
}

- (id)setXAndYFromPoint:(CGPoint)point
{
    [self setX:point.x andY:point.y];
    return self;
}

- (id)adjustX:(CGFloat)xd
{
    [self adjustX:xd andY:0];
    return self;
}

- (id)adjustY:(CGFloat)yd
{
    [self adjustX:0 andY:yd];
    return self;
}

- (id)adjustX:(CGFloat)xd andY:(CGFloat)yd
{
    [self setX:self.frame.origin.x + xd
          andY:self.frame.origin.y + yd];
    return self;
}

- (id)scaleProportionallyByPercent:(CGFloat)factor
{
    [self setW:self.frame.size.width * factor andH:self.frame.size.height * factor];
    return self;
}

- (id)scaleProportionallyToWidth:(CGFloat)w
{
    CGFloat newH = (w / self.frame.size.width) * self.frame.size.height;
    [self setW:w andH:newH];
    return self;
}

- (id)scaleProportionallyToHeight:(CGFloat)h
{
    CGFloat newW = (h / self.frame.size.height) * self.frame.size.width;
    [self setW:newW andH:h];
    return self;
}

- (id)centerXWith:(UIView *)v
{
    CGPoint c = [self.superview convertPoint:v.center fromView:v.superview];
    c.y = self.center.y;
    self.center = c;
    return self;
}

- (id)centerYWith:(UIView *)v
{
    CGPoint c = [self.superview convertPoint:v.center fromView:v.superview];
    c.x = self.center.x;
    self.center = c;
    return self;
}

- (id)centerWith:(UIView *)v
{
    CGPoint c = [self.superview convertPoint:v.center fromView:v.superview];
    self.center = c;
    return self;
}

- (id)centerInRect:(CGRect)r
{
    CGFloat centerX = CGRectGetMidX(r) - r.origin.x;
    CGFloat centerY = CGRectGetMidY(r) - r.origin.y;
    self.center = CGPointMake(centerX, centerY);
    return self;
}

- (id)centerXInRect:(CGRect)r
{
    CGFloat centerX = CGRectGetMidX(r);
    CGRect f = self.frame;
    f.origin.x = (centerX - (f.size.width / 2)) - r.origin.x;
    self.frame = f;
    return self;
}

- (id)centerYInRect:(CGRect)r{
    CGFloat centerY = CGRectGetMidY(r);
    CGRect f = self.frame;
    f.origin.y = (centerY - (f.size.height / 2)) - r.origin.y;
    self.frame = f;
    return self;
}

- (id)insideTopEdgeBy:(CGFloat)spacing{
    [self insideTopEdgeOf:self.superview by:spacing];
    return self;
}

- (id)insideRightEdgeBy:(CGFloat)spacing{
    [self insideRightEdgeOf:self.superview by:spacing];
    return self;
}

- (id)insideBottomEdgeBy:(CGFloat)spacing{
    [self insideBottomEdgeOf:self.superview by:spacing];
    return self;
}

- (id)insideLeftEdgeBy:(CGFloat)spacing{
    [self insideLeftEdgeOf:self.superview by:spacing];
    return self;
}

- (id)insideTopEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(0, spacing);
    [self setY:[self.superview convertPoint:inTargetSpace fromView:v].y];
    return self;
}

- (id)insideRightEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(v.frame.size.width - spacing - self.frame.size.width,0);
    [self setX:[self.superview convertPoint:inTargetSpace fromView:v].x];
    return self;
}
- (id)insideBottomEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(0, v.frame.size.height - spacing - self.frame.size.height);
    [self setY:[self.superview convertPoint:inTargetSpace fromView:v].y];
    return self;
}
- (id)insideLeftEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(spacing, 0);
    [self setX:[self.superview convertPoint:inTargetSpace fromView:v].x];
    return self;
}

- (id)outsideTopEdgeBy:(CGFloat)spacing{
    [self outsideTopEdgeOf:self.superview by:spacing];
    return self;
}

- (id)outsideRightEdgeBy:(CGFloat)spacing{
    [self outsideRightEdgeOf:self.superview by:spacing];
    return self;
}

- (id)outsideBottomEdgeBy:(CGFloat)spacing{
    [self outsideBottomEdgeOf:self.superview by:spacing];
    return self;
}

- (id)outsideLeftEdgeBy:(CGFloat)spacing{
    [self outsideLeftEdgeOf:self.superview by:spacing];
    return self;
}

- (id)outsideTopEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(0, -(spacing + self.frame.size.height));
    [self setY:[self.superview convertPoint:inTargetSpace fromView:v].y];
    return self;
}

- (id)outsideRightEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(v.frame.size.width + spacing,0);
    [self setX:[self.superview convertPoint:inTargetSpace fromView:v].x];
    return self;
}

- (id)outsideBottomEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(0, v.frame.size.height + spacing);
    [self setY:[self.superview convertPoint:inTargetSpace fromView:v].y];
    return self;
}

- (id)outsideLeftEdgeOf:(UIView *)v by:(CGFloat)spacing{
    CGPoint inTargetSpace =  CGPointMake(-(spacing + self.frame.size.width), 0);
    [self setX:[self.superview convertPoint:inTargetSpace fromView:v].x];
    return self;
}

- (id)setW:(CGFloat) w{
    [self setW:w andH:self.frame.size.height];
    return self;
}

- (id)setH:(CGFloat) h{
    [self setW:self.frame.size.width andH:h];
    return self;
}

- (id)setW:(CGFloat)w andH:(CGFloat)h{
    CGRect f = self.frame;
    self.frame = CGRectMake(f.origin.x, f.origin.y,
                            w, h);
    return self;
}

- (id)adjustW:(CGFloat)wd{
    [self adjustW:wd andH:0];
    return self;
}

- (id)adjustH:(CGFloat)hd{
    [self adjustW:0 andH:hd];
    return self;
}

- (id)adjustW:(CGFloat)wd andH:(CGFloat)hd{
    CGRect f = self.frame;
    self.frame = CGRectMake(f.origin.x, f.origin.y, 
                            f.size.width + wd, f.size.height + hd);
    return self;
}

- (id)setSizeFromSize:(CGSize)size
{
    CGRect f = self.frame;
    f.size = size;
    self.frame = f;
    return self;
}

- (id)setSizeFromView:(UIView *)v
{
    CGRect f = self.frame;
    f.size = v.frame.size;
    self.frame = f;
    return self;
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)aspectRatio
{
    return self.frame.size.width / self.frame.size.height;
}

- (id) debug{
    [self waldo];
    return self;
}

- (id)waldo{
    NSLog(@"waldo debugging view: %@", self);

    if(self.superview == nil){
        NSLog(@"\thas no superview");
    }
   
    if(self.hidden){
        NSLog(@"\tis hidden -- setting hidden = YES ");
        self.hidden = NO;
    }

    if(self.alpha == 0){
        NSLog(@"\alpha is 0 --  setting alpha to 1");
        self.alpha = 1;
    }

    if(self.frame.size.width == 0 || self.frame.size.height == 0){
        NSLog(@"\tframe size was 0/0! fuck that! setting frame to 1000/1000");
        [self setW:1000 andH:1000];
    }
    
    if(![self isInside:self.superview]){
        NSLog(@"\tpositioned outside my parent's frame! he/she clips to bounds? %d", self.superview.clipsToBounds);
    }
    
    if(!self.window){
        NSLog(@"\tdoes not have a window (try calling waldo after all animations and transitions have completed to make sure this isn't about to happen)");
    } else if(![self isInside:self.window]){
        NSLog(@"\tis outside window");
    }

    CGPoint point = [self.superview convertPoint:self.frame.origin toView:self.window];
    UIView *obscurringView = [self.window hitTest:point
                                        withEvent:nil];
    if(obscurringView != self && obscurringView != nil){
        NSLog(@"\tpossibly obscurred by: %@", obscurringView);
    }

    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    return self;
}

- (BOOL)isInside:(UIView *)view{
    CGPoint p = [self.superview convertPoint:self.frame.origin toView:view];
    return (p.y < view.frame.size.height &&
            p.y < 0) ||
        (p.x > 0 &&
         p.x < view.frame.size.width);
    
}

- (id)removeSubviews
{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        [subview removeFromSuperview];
    }];
    return self;
}

- (NSMutableArray *)accessibilityLabels
{
    __block NSMutableArray *labels = [NSMutableArray array];
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *sub, NSUInteger idx, BOOL *stop) {
        [labels addObjectsFromArray:[sub accessibilityLabels]];
    }];
    if (self.accessibilityLabel) {
        [labels addObject:self.accessibilityLabel];
    };
    return labels;
}


@end

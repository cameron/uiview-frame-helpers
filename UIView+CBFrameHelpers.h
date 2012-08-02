//Copyright (c) 2012 Cameron Boehmer

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

#import <UIKit/UIKit.h>

@interface UIView (FrameHelpers)

// x & y
@property (nonatomic, assign, setter=_setX:) CGFloat x;
@property (nonatomic, assign, setter=_setY:) CGFloat y;
- (id)setX:(CGFloat)x;
- (id)setY:(CGFloat)y;
- (id)setX:(CGFloat)x andY:(CGFloat)y;
- (id)setXAndYFromPoint:(CGPoint)point;
- (id)adjustX:(CGFloat)xd;
- (id)adjustY:(CGFloat)yd;
- (id)adjustX:(CGFloat)xd andY:(CGFloat)yd;
- (id)centerXWith:(UIView *)v;
- (id)centerYWith:(UIView *)v;
- (id)centerWith:(UIView *)v;
- (id)centerInRect:(CGRect)r;
- (id)centerXInRect:(CGRect)r;
- (id)centerYInRect:(CGRect)r;
- (id)insideTopEdgeBy:(CGFloat)spacing;
- (id)insideRightEdgeBy:(CGFloat)spacing;
- (id)insideBottomEdgeBy:(CGFloat)spacing;
- (id)insideLeftEdgeBy:(CGFloat)spacing;
- (id)insideTopEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)insideRightEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)insideBottomEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)insideLeftEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideTopEdgeBy:(CGFloat)spacing;
- (id)outsideRightEdgeBy:(CGFloat)spacing;
- (id)outsideBottomEdgeBy:(CGFloat)spacing;
- (id)outsideLeftEdgeBy:(CGFloat)spacing;
- (id)outsideTopEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideRightEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideBottomEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (id)outsideLeftEdgeOf:(UIView *)v by:(CGFloat)spacing;
- (CGFloat)maxX;
- (CGFloat)maxY;

// width & height
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;
- (id)setW:(CGFloat)w;
- (id)setH:(CGFloat)h;
- (id)setW:(CGFloat)w andH:(CGFloat)h;
- (id)adjustW:(CGFloat)wd;
- (id)adjustH:(CGFloat)hd;
- (id)adjustW:(CGFloat)wd andH:(CGFloat)hd;
- (id)setSizeFromSize:(CGSize)size;
- (id)setSizeFromView:(UIView *)v;
- (id)scaleProportionallyByPercent:(CGFloat)factor;
- (id)scaleProportionallyToWidth:(CGFloat)w;
- (id)scaleProportionallyToHeight:(CGFloat)h;
- (CGFloat)aspectRatio;

- (BOOL)isInside:(UIView *)view;
- (id)debug;
- (id)removeSubviews;
- (NSMutableArray *)accessibilityLabels;

@end


#import "CBViewHelpersDemoViewController.h"
#import "UIView+CBFrameHelpers.h"


@implementation CBViewHelpersDemoViewController

- (void)loadView
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    UIView *bg = [[self addViewWithRandomBGColor] setSizeFromView:[[UIApplication sharedApplication] keyWindow]];
    [bg adjustW:-50 andH:-50];
    [bg centerWith:self.view];
    
    UIView *v = [[self addViewWithRandomBGColor] setW:75 andH:75];
    [v centerWith:self.view];
    
    UIView *v2 = [[self addViewWithRandomBGColor] setSizeFromView:v];
    [v2 scaleProportionallyByPercent:1 / 1.7];
    [[v2 centerWith:v] outsideBottomEdgeOf:v by:v2.height / 1.7];
    
    UIView *v3 = [[self addViewWithRandomBGColor] setSizeFromView:v2];
    [v3 scaleProportionallyByPercent:1 / 1.7];
    [[v3 centerWith:v2] outsideBottomEdgeOf:v2 by:v3.height / 1.7];
    
    v = [[self addViewWithRandomBGColor] setSizeFromView:v3];
    [[v insideTopEdgeOf:bg by:v.height / 1.7] insideLeftEdgeOf:bg by:v.height / 1.7];
}

- (UIView *)addViewWithRandomBGColor{
    UIView *v = [[[UIView alloc] init] autorelease];
    v.backgroundColor = [UIColor colorWithRed:(float)random() / RAND_MAX green:(float)random() / RAND_MAX blue:(float)random() / RAND_MAX alpha:1];
    [self.view addSubview:v];
    return v;
}


@end

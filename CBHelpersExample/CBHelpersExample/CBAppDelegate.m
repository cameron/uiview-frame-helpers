//
//  CBAppDelegate.m
//  CBHelpersExample
//
//  Created by Cameron Boehmer on 6/19/12.
//

#import "CBAppDelegate.h"
#import "CBViewHelpersDemoViewController.h"

@implementation CBAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[[CBViewHelpersDemoViewController alloc] init] autorelease];
    return YES;
}


@end

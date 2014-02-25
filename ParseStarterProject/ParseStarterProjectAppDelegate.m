
#import <Parse/Parse.h>
#import "ParseStarterProjectAppDelegate.h"
#import "MyTableController.h"

@implementation ParseStarterProjectAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
    [Parse setApplicationId:@""
                  clientKey:@""];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.

    MyTableController *controller = [[MyTableController alloc] init];
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.window makeKeyAndVisible];   
    
  
    return YES;
}

@end

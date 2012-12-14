//
//  AppDelegate.m
//  Minesweeper2
//

#import "AppDelegate.h"
#import "MinesweeperDifficultyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MinesweeperDifficultyViewController *difficultyVC = [[MinesweeperDifficultyViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:difficultyVC];
    [self.window setRootViewController:navigationController];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

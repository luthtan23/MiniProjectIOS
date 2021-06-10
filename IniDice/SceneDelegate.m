//
//  SceneDelegate.m
//  IniDice
//
//  Created by iei19100004 on 24/05/21.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "SimpleTabBarViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
//    ViewController *resultController = [[ViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:resultController];
//    [nav setModalPresentationStyle:UIModalPresentationFullScreen];
//    self.window.rootViewController = nav;
//    [self.window makeKeyAndVisible];
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    SimpleTabBarViewController *simpleTabBar = [[SimpleTabBarViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:simpleTabBar];
    [nav setNavigationBarHidden:YES animated:YES];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor systemBackgroundColor];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
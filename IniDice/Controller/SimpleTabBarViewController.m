//
//  SimpleTabBarViewController.m
//  IniDice
//
//  Created by iei19100004 on 28/05/21.
//

#import "SimpleTabBarViewController.h"
#import "ViewController.h"
#import "CatatanViewController.h"

@interface SimpleTabBarViewController ()

@end

@implementation SimpleTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    ViewController *firstController = [[ViewController alloc] init];
    CatatanViewController *secondController = [[CatatanViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstController];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondController];
    
    firstNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Dice" image:[UIImage systemImageNamed:@"rectangle.grid.3x2"] tag:0];
    secondNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Member" image:[UIImage systemImageNamed:@"person.2"] tag:1];
    
    self.viewControllers = [NSArray arrayWithObjects:firstNav, secondNav, nil];
    
    self.tabBar.items[0].title = @"Dice";

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

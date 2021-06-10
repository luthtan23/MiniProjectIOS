//
//  ViewController.m
//  IniDice
//
//  Created by iei19100004 on 24/05/21.
//

#import "ViewController.h"
#include <stdlib.h>
#import "ResultViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSTimer *_labelTimer;
UIButton *button;
UIView *picker;

@synthesize dice1, dice2, textDice1, textDice2, textTotal, textTitleTotal;

int result1, result2, resTotal = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Dice Generator Mantap";
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    [self setInitComponent];
    
    
    if ( UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
        [self setConstraintsIpad];
    } else {
        [self setConstraintsIphone];
    }   

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_labelTimer invalidate];
    _labelTimer = nil;
}

- (void)dealloc {
    [_labelTimer invalidate];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

//add manual navBar
//-(void) setNavBar{
//    UINavigationBar* navbarDefault = [[UINavigationBar alloc] init];
//    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Dice Generator Mantap"];
//    [navbarDefault setItems:@[navItem]];
//    [navbarDefault setTintColor:[UIColor whiteColor]];
//    [navbarDefault setBarTintColor:[UIColor whiteColor]];
//    [self.view addSubview:navbarDefault];
//
//    navbarDefault.translatesAutoresizingMaskIntoConstraints = NO;
//
//    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
//    [navbarDefault.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
//    [navbarDefault.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
//    [navbarDefault.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
//    [navbarDefault.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
//
//
//}

-(void) setInitComponent{
    picker = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    textTotal = [[UILabel alloc] init];
    textDice1 = [[UILabel alloc] init];
    textDice2 = [[UILabel alloc] init];
    textTitleTotal = [[UILabel alloc] init];
    dice1 = [[UIImageView alloc] init];
    dice2 = [[UIImageView alloc] init];
    dice1.image = [UIImage imageNamed:@"DiceOne"];
    dice2.image = [UIImage imageNamed:@"DiceOne"];
    textTotal.text = @"0";
    textDice1.text = @"-";
    textDice2.text = @"-";
    textTitleTotal.text = @"Total Result";
    [textDice1 setFont:[UIFont fontWithName:@"Arial" size:30.0f]];
    [textDice2 setFont:[UIFont fontWithName:@"Arial" size:30.0f]];
    [textTotal setFont:[UIFont fontWithName:@"Arial" size:32.0f]];
    [textTitleTotal setFont:[UIFont fontWithName:@"Arial" size:40.0f]];
    textDice1.textColor = [UIColor blackColor];
    textDice2.textColor = [UIColor blackColor];
    textTotal.textColor = [UIColor blackColor];
    textTitleTotal.textColor = [UIColor blackColor];
    [self setStatusButton:NO];
    [self.view addSubview: picker];
    [self.view addSubview:textDice1];
    [self.view addSubview:textDice2];
    [self.view addSubview:textTotal];
    [self.view addSubview:textTitleTotal];
    [self.view addSubview:dice1];
    [self.view addSubview:dice2];
    [self.view addSubview:button];
}


-(void) setConstraintsIphone {
    dice1.translatesAutoresizingMaskIntoConstraints = NO;
    [dice1.topAnchor constraintEqualToAnchor:picker.topAnchor].active = YES;
    [dice1.bottomAnchor constraintEqualToAnchor:picker.bottomAnchor constant:-picker.bounds.size.height/1.5].active = YES;
    [dice1.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor constant:50].active = YES;
    [dice1.trailingAnchor constraintEqualToAnchor:dice2.leadingAnchor constant:-20].active = YES;
    
    dice2.translatesAutoresizingMaskIntoConstraints = NO;
    [dice2.topAnchor constraintEqualToAnchor:picker.topAnchor].active = YES;
    [dice2.bottomAnchor constraintEqualToAnchor:picker.bottomAnchor constant:-picker.bounds.size.height/1.5].active = YES;
    [dice2.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor constant:(picker.bounds.size.width/2+10)].active = YES;
    [dice2.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor constant:-50].active = YES;
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button.topAnchor constraintEqualToAnchor:dice1.bottomAnchor constant:picker.bounds.size.height/2-80].active = YES;
    [button.bottomAnchor constraintEqualToAnchor:picker.bottomAnchor constant:-80].active = YES;
    [button.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor constant:50].active = YES;
    [button.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor constant:-50].active = YES;
    
    textDice1.translatesAutoresizingMaskIntoConstraints = NO;
    [textDice1.topAnchor constraintEqualToAnchor:dice1.bottomAnchor constant:20].active = YES;
    [textDice1.leadingAnchor constraintEqualToAnchor:dice1.leadingAnchor].active = YES;
    [textDice1.trailingAnchor constraintEqualToAnchor:dice1.trailingAnchor].active = YES;
    [textDice1 setTextAlignment:NSTextAlignmentCenter];
    
    textDice2.translatesAutoresizingMaskIntoConstraints = NO;
    [textDice2.topAnchor constraintEqualToAnchor:dice2.bottomAnchor constant:20].active = YES;
    [textDice2.leadingAnchor constraintEqualToAnchor:dice2.leadingAnchor].active = YES;
    [textDice2.trailingAnchor constraintEqualToAnchor:dice2.trailingAnchor].active = YES;
    [textDice2 setTextAlignment:NSTextAlignmentCenter];
    
    textTitleTotal.translatesAutoresizingMaskIntoConstraints = NO;
    [textTitleTotal.topAnchor constraintEqualToAnchor:picker.bottomAnchor].active = YES;
    [textTitleTotal.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor].active = YES;
    [textTitleTotal.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor].active = YES;
    [textTitleTotal setTextAlignment:NSTextAlignmentCenter];
    
    textTotal.translatesAutoresizingMaskIntoConstraints = NO;
    [textTotal.topAnchor constraintEqualToAnchor:textTitleTotal.bottomAnchor constant:10].active = YES;
    [textTotal.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor].active = YES;
    [textTotal.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor].active = YES;
    [textTotal setTextAlignment:NSTextAlignmentCenter];
}

-(void) setConstraintsIpad {
    dice1.translatesAutoresizingMaskIntoConstraints = NO;
    [dice1.topAnchor constraintEqualToAnchor:picker.topAnchor].active = YES;
    [dice1.bottomAnchor constraintEqualToAnchor:picker.bottomAnchor constant:-picker.bounds.size.height/2].active = YES;
    [dice1.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor constant:50].active = YES;
    [dice1.trailingAnchor constraintEqualToAnchor:dice2.leadingAnchor constant:-20].active = YES;
    
    dice2.translatesAutoresizingMaskIntoConstraints = NO;
    [dice2.topAnchor constraintEqualToAnchor:picker.topAnchor].active = YES;
    [dice2.bottomAnchor constraintEqualToAnchor:picker.bottomAnchor constant:-picker.bounds.size.height/2].active = YES;
    [dice2.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor constant:(picker.bounds.size.width/2+10)].active = YES;
    [dice2.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor constant:-50].active = YES;
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button.topAnchor constraintEqualToAnchor:dice1.bottomAnchor constant:picker.bounds.size.height/2-120].active = YES;
    [button.bottomAnchor constraintEqualToAnchor:picker.bottomAnchor constant:-60].active = YES;
    [button.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor constant:50].active = YES;
    [button.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor constant:-50].active = YES;
    
    textDice1.translatesAutoresizingMaskIntoConstraints = NO;
    [textDice1.topAnchor constraintEqualToAnchor:dice1.bottomAnchor constant:20].active = YES;
    [textDice1.leadingAnchor constraintEqualToAnchor:dice1.leadingAnchor].active = YES;
    [textDice1.trailingAnchor constraintEqualToAnchor:dice1.trailingAnchor].active = YES;
    [textDice1 setTextAlignment:NSTextAlignmentCenter];
    
    textDice2.translatesAutoresizingMaskIntoConstraints = NO;
    [textDice2.topAnchor constraintEqualToAnchor:dice2.bottomAnchor constant:20].active = YES;
    [textDice2.leadingAnchor constraintEqualToAnchor:dice2.leadingAnchor].active = YES;
    [textDice2.trailingAnchor constraintEqualToAnchor:dice2.trailingAnchor].active = YES;
    [textDice2 setTextAlignment:NSTextAlignmentCenter];
    
    textTitleTotal.translatesAutoresizingMaskIntoConstraints = NO;
    [textTitleTotal.topAnchor constraintEqualToAnchor:picker.bottomAnchor].active = YES;
    [textTitleTotal.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor].active = YES;
    [textTitleTotal.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor].active = YES;
    [textTitleTotal setTextAlignment:NSTextAlignmentCenter];
    
    textTotal.translatesAutoresizingMaskIntoConstraints = NO;
    [textTotal.topAnchor constraintEqualToAnchor:textTitleTotal.bottomAnchor constant:10].active = YES;
    [textTotal.leadingAnchor constraintEqualToAnchor:picker.leadingAnchor].active = YES;
    [textTotal.trailingAnchor constraintEqualToAnchor:picker.trailingAnchor].active = YES;
    [textTotal setTextAlignment:NSTextAlignmentCenter];
}




- (void)buttonAction:(UIButton *) sender{
    [self setStatusButton:YES];
    _labelTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer *timer) {
        result1 = arc4random_uniform(6) + 1;
        result2 = arc4random_uniform(6) + 1;
        [self setRandomComponen];
        }];
    
    NSTimeInterval delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_labelTimer invalidate];
        resTotal = result1 + result2;
        
        ResultViewController *resultController = [[ResultViewController alloc] init];
        resultController.result = resTotal;

        [self.navigationController pushViewController:resultController animated:YES];
        
        self.textTotal.text = [NSString stringWithFormat:@"%d", resTotal];
        [self setStatusButton:NO];
        NSLog(@"Invalidate succes");
    });
    
}

-(void) setStatusButton: (BOOL) status{
    if (status) {
        textTotal.text = @"0";
        button.enabled = NO;
        [button setTitle:@"sek yoo!!" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor grayColor];
    } else {
        button.enabled = YES;
        [button setTitle:@"generetkeun" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor systemPinkColor];
    }
    
}

-(void) setRandomComponen {
    textDice1.text = [NSString stringWithFormat:@"%d", result1];
    textDice2.text = [NSString stringWithFormat:@"%d", result2];
    
    switch (result1) {
        case 1:
            dice1.image = [UIImage imageNamed:@"DiceOne"];
            break;
        case 2:
            dice1.image = [UIImage imageNamed:@"DiceTwo"];
            break;
        case 3:
            dice1.image = [UIImage imageNamed:@"DiceThree"];
            break;
        case 4:
            dice1.image = [UIImage imageNamed:@"DiceFour"];
            break;
        case 5:
            dice1.image = [UIImage imageNamed:@"DiceFive"];
            break;
        case 6:
            dice1.image = [UIImage imageNamed:@"DiceSix"];
            break;
        default:
            break;
    }
    
    switch (result2) {
        case 1:
            dice2.image = [UIImage imageNamed:@"DiceOne"];
            break;
        case 2:
            dice2.image = [UIImage imageNamed:@"DiceTwo"];
            break;
        case 3:
            dice2.image = [UIImage imageNamed:@"DiceThree"];
            break;
        case 4:
            dice2.image = [UIImage imageNamed:@"DiceFour"];
            break;
        case 5:
            dice2.image = [UIImage imageNamed:@"DiceFive"];
            break;
        case 6:
            dice2.image = [UIImage imageNamed:@"DiceSix"];
            break;
        default:
            break;
    }
    
}


@end

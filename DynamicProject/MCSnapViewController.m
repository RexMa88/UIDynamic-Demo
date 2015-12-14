//
//  MCSnapViewController.m
//  DynamicProject
//
//  Created by Rex Ma on 15/12/14.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "MCSnapViewController.h"

@interface MCSnapViewController ()

@property (nonatomic, strong) UIView * ball;

@property (nonatomic, strong) UIDynamicAnimator * animator;

@end

@implementation MCSnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Snap";
    self.view.backgroundColor = [UIColor whiteColor];
    [self tapAction];
    [self customAnimator];
}

- (void)tapAction{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addSnapBehavior)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)customAnimator{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)addSnapBehavior{
    [self.animator removeAllBehaviors];
    [self customBall];
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    [gravityBehavior setAction:^{
        int kWidth  = [UIScreen mainScreen].bounds.size.width;
        int kHeight = [UIScreen mainScreen].bounds.size.height;
        CGFloat valueX = (arc4random() % kWidth);
        CGFloat valueY = (arc4random() % kHeight) + 64;
        UISnapBehavior * snapBehavior = [[UISnapBehavior alloc] initWithItem:self.ball snapToPoint:CGPointMake(valueX, valueY)];
        [self.animator addBehavior:snapBehavior];
    }];
    
    [self.animator addBehavior:gravityBehavior];
}

- (void)customBall{
    self.ball = [[UIView alloc] initWithFrame:CGRectMake(100, 66, 60, 60)];
    self.ball.backgroundColor = [UIColor orangeColor];
    self.ball.layer.masksToBounds = YES;
    self.ball.layer.cornerRadius = 30.0f;
    [self.view addSubview:self.ball];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

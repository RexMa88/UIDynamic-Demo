//
//  MCGravityViewController.m
//  DynamicProject
//
//  Created by Rex Ma on 15/12/13.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "MCGravityViewController.h"

@interface MCGravityViewController ()

@property (nonatomic, strong) UIView * circleView;

@property (nonatomic, strong) UIDynamicAnimator * animator;

@end

@implementation MCGravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Gravity";
//    [self customUI];
    [self customAnimator];
    [self customGesture];
}

#pragma mark - Custom method

- (void)customUI{
    self.circleView = [[UIView alloc] initWithFrame:CGRectMake(100, 66, 50, 50)];
    self.circleView.backgroundColor = [UIColor orangeColor];
    self.circleView.layer.masksToBounds = YES;
    self.circleView.layer.cornerRadius = 25.0f;
    [self.view addSubview:self.circleView];
}

- (void)customAnimator{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)customGesture{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addGravityDynamic)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)addGravityDynamic{
    [self customUI];
    [self.animator removeAllBehaviors];
    UIGravityBehavior * behavior = [[UIGravityBehavior alloc] initWithItems:@[self.circleView]];
    [self.animator addBehavior:behavior];
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

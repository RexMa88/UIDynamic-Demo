//
//  MCCollisionViewController.m
//  DynamicProject
//
//  Created by Rex Ma on 15/12/13.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "MCCollisionViewController.h"

@interface MCCollisionViewController ()

@property (nonatomic, strong) UIView * ballOne;
//UIDynamicAnimator
@property (nonatomic, strong) UIDynamicAnimator * animator;//UIDynamicAnimator;

@end

@implementation MCCollisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Collision";
    self.view.backgroundColor = [UIColor whiteColor];
    [self customAnimator];
    [self tapGesture];
}

#pragma mark - Custom method
- (void)customAnimator{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)addCollisionDynamic{
    [self customBall];
    [self.animator removeAllBehaviors];
    //重力
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.ballOne]];
    [self.animator addBehavior:gravityBehavior];
    //碰撞
    UICollisionBehavior * collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.ballOne]];
    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    [self.animator addBehavior:collisionBehavior];
    //物理元素
    UIDynamicItemBehavior * itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ballOne]];
    itemBehavior.elasticity = 1;//弹力
    [self.animator addBehavior:itemBehavior];
}

- (void)customBall{
    //Ball One
    self.ballOne = [[UIView alloc] initWithFrame:CGRectMake(0, 66, 60, 60)];
    self.ballOne.backgroundColor = [UIColor orangeColor];
    self.ballOne.layer.masksToBounds = YES;
    self.ballOne.layer.cornerRadius = 30.0f;
    //
    [self.view addSubview:self.ballOne];
}

- (void)tapGesture{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addCollisionDynamic)];
    [self.view addGestureRecognizer:tapGesture];
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

//
//  MCAttachmentViewController.m
//  DynamicProject
//
//  Created by Rex Ma on 15/12/14.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "MCAttachmentViewController.h"

@interface MCAttachmentViewController ()

@property (nonatomic, strong) UIDynamicAnimator * animator;

@property (nonatomic, strong) UIView * ball;

@end

@implementation MCAttachmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self customBall];
    self.title = @"Attachment";
    self.view.backgroundColor = [UIColor whiteColor];
    [self customAnimator];
    [self tapGesture];
}

- (void)tapGesture{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addAttachment)];
    [self.view addGestureRecognizer:tap];
}

- (void)customBall{
    self.ball = [[UIView alloc] initWithFrame:CGRectMake(100, 66, 60, 60)];
    self.ball.backgroundColor = [UIColor orangeColor];
    self.ball.layer.masksToBounds = YES;
    self.ball.layer.cornerRadius = 30.0f;
    [self.view addSubview:self.ball];
}

- (void)customAnimator{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)addAttachment{
    [self.animator removeAllBehaviors];
    [self customBall];
    
    UIGravityBehavior * gravity = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    [self.animator addBehavior:gravity];
    
    UIAttachmentBehavior * attachment = [[UIAttachmentBehavior alloc] initWithItem:self.ball attachedToAnchor:CGPointMake(100, 0)];
    CGFloat value = (arc4random() % 350) + 100;
    [attachment setLength:value];//范围
    [attachment setDamping:0.1];//减震
    [attachment setFrequency:5];//频率
    [self.animator addBehavior:attachment];
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

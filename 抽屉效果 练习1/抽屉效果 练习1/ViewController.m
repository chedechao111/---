//
//  ViewController.m
//  抽屉效果 练习1
//
//  Created by 车德超 on 16/4/23.
//  Copyright (c) 2016年 车德超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *orangeView;
@property (nonatomic,strong) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *blueView = [[UIView alloc] initWithFrame:[self initRedFrame]];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    self.blueView.hidden = YES;
    self.blueView = blueView;
    
    UIView *orangeView = [[UIView alloc] initWithFrame:[self initRedFrame]];
    [orangeView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:orangeView];
    self.orangeView.hidden = YES;
    self.orangeView = orangeView;
    
    UIView *redView = [[UIView alloc] initWithFrame:[self initRedFrame]];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    self.redView = redView;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:touch.view];
    
    CGPoint previousPoint = [touch previousLocationInView:touch.view];
    
    CGFloat distance = currentPoint.x - previousPoint.x ;
    
    NSLog(@"%f",distance);
    
    CGRect redFrame = self.redView.frame;
    
    redFrame.origin.x += distance;
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat redFrameHeight = redFrame.size.height;
    
    if (redFrame.origin.x < 0) {
        if (distance < 0) {
            distance *= -1;
        }
        
        redFrameHeight -= distance * 10;
        self.blueView.hidden = NO;
        self.orangeView.hidden = YES;
    }else{
        self.blueView.hidden = YES;
        self.orangeView.hidden = NO;
        redFrameHeight -= distance * 10;
    }
    
    
    CGFloat redFrameY = (screenHeight - redFrameHeight) / 2;
    
    self.redView.frame = CGRectMake(redFrame.origin.x, redFrameY, redFrame.size.width, redFrameHeight);
    
}


-(CGRect)initRedFrame{
    
    CGSize redFrame = [[UIScreen mainScreen] bounds].size;
    
    return CGRectMake(0, 0, redFrame.width, redFrame.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

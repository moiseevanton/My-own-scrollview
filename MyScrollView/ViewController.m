//
//  ViewController.m
//  MyScrollView
//
//  Created by Anton Moiseev on 2016-05-16.
//  Copyright © 2016 Anton Moiseev. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property MyScrollView *scrollView;

@property UIView *theView;

@property CGFloat originX;

@property CGFloat originY;

- (void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView = [[MyScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.scrollView.contentSize = CGSizeMake(800, 1000);
    
    [self.view addSubview:self.scrollView];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    
    [self.scrollView setUserInteractionEnabled:YES];
    [self.scrollView addGestureRecognizer:panGestureRecognizer];
    
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 800, 1000)];
    self.theView = myView;
    [self.scrollView addSubview:self.theView];
    [self.view addSubview:self.scrollView];
    myView.backgroundColor = [UIColor orangeColor];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:redView];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:greenView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:blueView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:yellowView];
    
}

- (void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        self.originX = self.scrollView.bounds.origin.x;
        
        self.originY = self.scrollView.bounds.origin.y;
        
    }
    
    CGPoint location = [panGestureRecognizer translationInView:self.theView];
    
    NSLog(@"%f, %f", self.scrollView.bounds.origin.x, self.scrollView.bounds.origin.y);
    
    CGRect cg = self.scrollView.bounds;
    cg.origin.x = self.originX - location.x;
    cg.origin.y = self.originY - location.y;
    
    if ((self.originX - location.x) < 0) {
        
        cg.origin.x = 0;
        
    }
    
    if (((self.originX - location.x) + self.scrollView.frame.size.width) > self.scrollView.contentSize.width) {
        
        cg.origin.x = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
        
    }
    
    if ((self.originY - location.y) < 0) {
        
        cg.origin.y = 0;
        
    }
    if (((self.originY - location.y) + self.scrollView.frame.size.height) > self.scrollView.contentSize.height) {
        
        cg.origin.y = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
        
    }
    
    self.scrollView.bounds = cg;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

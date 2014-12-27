//
//  ViewController.m
//  SYWaveformPlayer
//
//  Created by Spencer Yen on 12/26/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//

#import "ViewController.h"
#import "SYWaveformPlayerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"I Need A Dollar" withExtension:@"mp3"] options:nil];
    
    SYWaveformPlayerView *playerView = [[SYWaveformPlayerView alloc] initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 30) asset:asset color:[UIColor lightGrayColor] progressColor:[UIColor colorWithRed:1 green:0.2 blue:0.2 alpha:1]];
    [self.view addSubview:playerView];
    
    SYWaveformPlayerView *playerView2 = [[SYWaveformPlayerView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width-70, 50) asset:asset color:[UIColor lightGrayColor] progressColor:[UIColor colorWithRed:0.5 green:0.7 blue:0.2 alpha:1]];
    [self.view addSubview:playerView2];
    
    SYWaveformPlayerView *playerView3 = [[SYWaveformPlayerView alloc] initWithFrame:CGRectMake(0, 260, self.view.frame.size.width-40, 80) asset:asset color:[UIColor lightGrayColor] progressColor:[UIColor colorWithRed:0.5 green:0.4 blue:0.9 alpha:1]];
    [self.view addSubview:playerView3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  SYWaveformPlayerView.m
//  SCWaveformView
//
//  Created by Spencer Yen on 12/26/14.
//  Copyright (c) 2014 Simon CORSIN. All rights reserved.
//

#import "SYWaveformPlayerView.h"

@implementation SYWaveformPlayerView {
    AVAudioPlayer *player;
    SCWaveformView *waveformView;
    UIButton *playPauseButton;
}

- (id)initWithFrame:(CGRect)frame asset:(AVURLAsset *)asset color:(UIColor *)normalColor progressColor:(UIColor *)progressColor {
    if (self = [super initWithFrame:frame]) {
        
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:asset.URL error:nil];
        player.delegate = self;
        
        waveformView = [[SCWaveformView alloc] init];
        waveformView.normalColor = normalColor;
        waveformView.progressColor = progressColor;
        waveformView.alpha = 0.8;
        waveformView.backgroundColor = [UIColor clearColor];
        waveformView.asset = asset;
        [self addSubview:waveformView];
        
        playPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [playPauseButton setImage:[UIImage imageNamed:@"playbutton.png"] forState:UIControlStateNormal];
        [playPauseButton addTarget:self
                   action:@selector(playPauseTapped)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:playPauseButton];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1 target: self
                                                          selector: @selector(updateWaveform:) userInfo: nil repeats: YES];

    }
  
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    playPauseButton.frame = CGRectMake(5, self.frame.size.height/2 - self.frame.size.height/4 , self.frame.size.height/2, self.frame.size.height/2);
    playPauseButton.layer.cornerRadius = self.frame.size.height/4;
    
    waveformView.frame = CGRectMake(self.frame.size.height/2 + 10, 0, self.frame.size.width - (self.frame.size.height/2 + 10), self.frame.size.height);
}

- (void)playPauseTapped{
    if(player.playing){
        [playPauseButton setImage:[UIImage imageNamed:@"playbutton.png"] forState:UIControlStateNormal];
        [player pause];
    } else {
        [playPauseButton setImage:[UIImage imageNamed:@"pausebutton.png"] forState:UIControlStateNormal];
        [player play];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
    [player pause];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches]anyObject];
    CGPoint location = [touch locationInView:touch.view];
    if(location.x/self.frame.size.width > 0) {
        waveformView.progress = location.x/self.frame.size.width;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSTimeInterval newTime = waveformView.progress * player.duration;
    player.currentTime = newTime;
    [playPauseButton setImage:[UIImage imageNamed:@"pausebutton.png"] forState:UIControlStateNormal];
    [player play];
    
}

- (void)updateWaveform:(id)sender {
    
    if(player.playing) {
        waveformView.progress = player.currentTime/player.duration;
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag {
    [playPauseButton setImage:[UIImage imageNamed:@"playbutton.png"] forState:UIControlStateNormal];

}
@end

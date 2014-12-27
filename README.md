SYWaveformPlayer
================

Simple waveform audio player using SCWaveformView

Main features:
  * Shows play progress
  * Easily customizable (color, size, etc.)
  * Scrub audio

<img src="http://i.imgur.com/Ojlz7oP.png" width=300>

This project's waveform uses https://github.com/rFlex/SCWaveformView

Example
-------
    //Create AVURLAsset for waveform creation and audio playback
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"I Need A Dollar" withExtension:@"mp3"] options:nil];
    
    //Initialize view, set AVURLAsset, frame, color
    SYWaveformPlayerView *playerView = [[SYWaveformPlayerView alloc] initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 30) asset:asset color:[UIColor lightGrayColor] progressColor:[UIColor colorWithRed:1 green:0.2 blue:0.2 alpha:1]];
    [self.view addSubview:playerView];

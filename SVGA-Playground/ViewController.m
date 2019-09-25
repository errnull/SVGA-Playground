//
//  ViewController.m
//  SVGA-Playground
//
//  Created by errnull on 2019/9/2.
//

#import "ViewController.h"
#import "SVGA.h"
#import <ZipArchive/ZipArchive.h>

@interface ViewController ()<SVGAPlayerDelegate>

@property (nonatomic, strong) SVGAPlayer *player;
@property (nonatomic, strong) SVGAPlayer *player1;

@property (nonatomic, strong) SVGAPlayer *player2;
@property (nonatomic, strong) SVGAPlayer *player3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZipArchive *zipArchive;
    
    self.player = [[SVGAPlayer alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    self.player.delegate = self;
    self.player.loops = 0;
    [self.view addSubview:self.player];
    
    SVGAParser *parser = [[SVGAParser alloc] init];
    [parser parseWithNamed:@"Walkthrough"
                  inBundle:nil
           completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
               
               self.player.videoItem = videoItem;
               [self.player startAnimation];
               
           } failureBlock:^(NSError * _Nonnull error) {}];
    
    self.player1 = [[SVGAPlayer alloc] initWithFrame:CGRectMake(200, 100, 200, 200)];
    self.player1.delegate = self;
    self.player1.loops = 0;
    [self.view addSubview:self.player1];
    [parser parseWithNamed:@"xxxxx"
                  inBundle:nil
           completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
               
               self.player1.videoItem = videoItem;
               [self.player1 startAnimation];
               
           } failureBlock:^(NSError * _Nonnull error) {}];
    
    self.player2 = [[SVGAPlayer alloc] initWithFrame:CGRectMake(0, 300, 200, 200)];
    self.player2.delegate = self;
    self.player2.loops = 0;
    [self.view addSubview:self.player2];
    [parser parseWithNamed:@"xxxxx"
                  inBundle:nil
           completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
               
               self.player2.videoItem = videoItem;
               [self.player2 startAnimation];
               
           } failureBlock:^(NSError * _Nonnull error) {}];
    
    self.player3 = [[SVGAPlayer alloc] initWithFrame:CGRectMake(200, 300, 200, 200)];
    self.player3.delegate = self;
    self.player3.loops = 0;
    [self.view addSubview:self.player3];
    [parser parseWithNamed:@"xxxx"
                  inBundle:nil
           completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
               
               self.player3.videoItem = videoItem;
               [self.player3 startAnimation];
               
           } failureBlock:^(NSError * _Nonnull error) {}];
}

#pragma mark - SVGAPlayerDelegate
- (void)svgaPlayerDidFinishedAnimation:(SVGAPlayer *)player {
    NSLog(@"Animation did finished");
}

@end

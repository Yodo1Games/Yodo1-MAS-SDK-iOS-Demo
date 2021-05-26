//
//  ViewController.m
//  Yodo1MasSdkDemo
//
//  Created by 周玉震 on 2021/1/10.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Yodo1MasCore/Yodo1Mas.h>
#import <AppLovinSDK/AppLovinSDK.h>

@interface ViewController ()<Yodo1MasRewardAdDelegate, Yodo1MasInterstitialAdDelegate, Yodo1MasBannerAdDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *gdprSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *coppaSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *ccpaSwitch;

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, weak) NSTimer *_timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.label.text = @"sdk init...";
    [_hud showAnimated:YES];
    
    __weak __typeof(self)weakSelf = self;
    [[Yodo1Mas sharedInstance] initWithAppId:@"Your AppKey" successful:^{
        [weakSelf.hud hideAnimated:YES];
        
        weakSelf.hud.mode = MBProgressHUDModeText;
        weakSelf.hud.label.text = @"sdk init successful";
        [weakSelf.hud showAnimated:YES];
        [weakSelf performSelector:@selector(hideHud) withObject:nil afterDelay:0.2];
        [self showBannerWithTimer];
    } fail:^(Yodo1MasError *error) {
        [weakSelf.hud hideAnimated:YES];
        
        weakSelf.hud.mode = MBProgressHUDModeText;
        weakSelf.hud.label.text = error.localizedDescription;
        [weakSelf.hud showAnimated:YES];
        [weakSelf performSelector:@selector(hideHud) withObject:nil afterDelay:0.2];
    }];
    
    _gdprSwitch.on = [Yodo1Mas sharedInstance].isGDPRUserConsent;
    _coppaSwitch.on = [Yodo1Mas sharedInstance].isCOPPAAgeRestricted;
    _ccpaSwitch.on = [Yodo1Mas sharedInstance].isCCPADoNotSell;
    [Yodo1Mas sharedInstance].rewardAdDelegate = self;
    [Yodo1Mas sharedInstance].interstitialAdDelegate = self;
    [Yodo1Mas sharedInstance].bannerAdDelegate = self;
}

- (void)hideHud {
    [_hud hideAnimated:YES];
}

- (IBAction)onRewardClicked:(UIButton *)sender {
    [[Yodo1Mas sharedInstance] showRewardAd];
}

- (IBAction)onInterstitialClicked:(UIButton *)sender {
    [[Yodo1Mas sharedInstance] showInterstitialAd];
}

- (IBAction)onBannerClicked:(UIButton *)sender {
    [[Yodo1Mas sharedInstance] showBannerAd];
}

- (IBAction)onAppLovinMediationDebuggerClicked:(UIButton *)sender {
    [[ALSdk shared] showMediationDebugger];
}

- (IBAction)onGDPRChanged:(UISwitch *)sender {
    [Yodo1Mas sharedInstance].isGDPRUserConsent = sender.isOn;
}

- (IBAction)onCOPPAChanged:(UISwitch *)sender {
    [Yodo1Mas sharedInstance].isCOPPAAgeRestricted = sender.isOn;
}

- (IBAction)onCCPAChanged:(UISwitch *)sender {
    [Yodo1Mas sharedInstance].isCCPADoNotSell = sender.isOn;
}

- (void) showBannerWithTimer {
    self._timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showBanner) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self._timer forMode:NSDefaultRunLoopMode];
}

- (void) invalidateTimer {
    [self._timer invalidate];
    self._timer = nil;
}

- (void) showBanner {
    if ([[Yodo1Mas sharedInstance] isBannerAdLoaded]) {
        [[Yodo1Mas sharedInstance] showBannerAd];
        [self invalidateTimer];
    }
}

#pragma mark - Yodo1MasAdDelegate
- (void)onAdOpened:(Yodo1MasAdEvent *)event {
    
}

- (void)onAdClosed:(Yodo1MasAdEvent *)event {
    
}

- (void)onAdError:(Yodo1MasAdEvent *)event error:(Yodo1MasError *)error {
    _hud.label.text = error.localizedDescription;
    [_hud showAnimated:YES];
    [self performSelector:@selector(hideHud) withObject:nil afterDelay:0.2];
}

#pragma mark - Yodo1MasRewardAdvertDelegate
- (void)onAdRewardEarned:(Yodo1MasAdEvent *)event {
    
}

@end

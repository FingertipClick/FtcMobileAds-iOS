//
//  ViewController.m
//  FtcMobileAdsExample
//
//  Created by KYPoseidonL on 2020/10/16.
//

#import "ViewController.h"
#import <FtcMobileAds/FtcMobileAds.h>

@interface ViewController ()<UITextFieldDelegate, FtcInterstitialDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtAccountID;
@property (weak, nonatomic) IBOutlet UITextField *txtZoneID;
@property (weak, nonatomic) IBOutlet UITextView *txtLog;
@property (weak, nonatomic) IBOutlet UIButton *btnDismiss;
@property (weak, nonatomic) IBOutlet UIButton *btnDisplayInterstitial;
@property (weak, nonatomic) IBOutlet UIView *bannerContainer;

@property(nonatomic, strong) FtcInterstitial *interstitial;
@property(nonatomic, strong) FtcBanner *ftcBanner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.txtAccountID.delegate = self;
    self.txtZoneID.delegate = self;
}

- (IBAction)onGetBannerClick:(id)sender {
    self.txtAccountID.text = @"180130";
    self.txtZoneID.text = @"457319";
    if(![self validateInputs]){
        return;
    }

    self.btnDismiss.hidden = NO;
    PlacementRequestConfig *config = [[PlacementRequestConfig alloc] initWithAccountId:[self.txtAccountID.text integerValue] zoneId:[self.txtZoneID.text integerValue] width:0 height:0 keywords:nil click:nil];
    [FtcMobileAds requestPlacementWithConfig:config success:^(FtcResponseStatus status, NSArray<Placement *> *placements) {
        NSLog(@"requestPlacementWithConfig: status = %d, placements = %@", status, placements);
        if (status == FtcResponseStatusSuccess) {
            self.ftcBanner = [[FtcBanner alloc] initWithPlacement:placements[0] container:self.bannerContainer placementRequestConfig:config];
        }
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
}

- (IBAction)onDismissClick:(id)sender {
    [self.ftcBanner destroy];
    self.btnDismiss.hidden = YES;
}

- (IBAction)onGetInterstitialClick:(id)sender {
    self.txtAccountID.text = @"180130";
//    self.txtZoneID.text = @"457480";
//    self.txtZoneID.text = @"457320";
    self.txtZoneID.text = @"457543";
    if(![self validateInputs]){
        return;
    }
    self.btnDisplayInterstitial.hidden = YES;
    
    PlacementRequestConfig *config = [[PlacementRequestConfig alloc] initWithAccountId:[self.txtAccountID.text integerValue] zoneId:[self.txtZoneID.text integerValue] width:0 height:0 keywords:nil click:nil];
    [FtcMobileAds requestPlacementWithConfig:config success:^(FtcResponseStatus status, NSArray<Placement *> *placements) {
        NSLog(@"requestPlacementWithConfig: status = %d, placements = %@", status, placements);
        if (status == FtcResponseStatusSuccess) {
            self.interstitial = [[FtcInterstitial alloc] initWithPlacement:placements[0] delegate:self];
        }
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
}

- (IBAction)onDisplayInterstitialClick:(id)sender {
    self.btnDisplayInterstitial.hidden = YES;
    [self.interstitial presentFromRootViewController:self];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)validateInputs {
    
    if(self.txtAccountID.text.length < 1){
        [self log:@"Invalid account ID"];
        return NO;
    }
    
    if(self.txtZoneID.text.length < 1){
        [self log:@"Invalid zone ID"];
        return NO;
    }
    return YES;
}

- (void)log:(NSString *)str {
    self.txtLog.text = [NSString stringWithFormat:@"%@\n%@", self.txtLog.text, str];
    NSLog(@"%@", str);
}

#pragma mark - FtcInterstitialDelegate
- (void)interstitialStartLoad:(FtcInterstitial *)interstitial {
    [self log:@"Interstitial :: start load"];
}

- (void)interstitialFailedToLoad:(FtcInterstitial *)interstitial {
    [self log:@"Interstitial :: failed"];
}

- (void)interstitialReady:(FtcInterstitial *)interstitial {
    [self log:@"Interstitial :: ready"];
    self.btnDisplayInterstitial.hidden = NO;
}

- (void)interstitialClosed:(FtcInterstitial *)interstitial {
    [self log:@"Interstitial :: close"];
}
@end

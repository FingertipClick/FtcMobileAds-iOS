//
//  FtcInterstitialDelegate.h
//  FtcMobileAds
//
//  Created by KYPoseidonL on 2020/10/23.
//  Copyright © 2020 KYPoseidonL. All rights reserved.
//

#ifndef FtcInterstitialDelegate_h
#define FtcInterstitialDelegate_h

@class FtcInterstitial;
@protocol FtcInterstitialDelegate <NSObject>

// called when the HTML request starts to load
- (void)interstitialStartLoad:(FtcInterstitial *)interstitial;

// called when the interstitial content is finished loading
- (void)interstitialReady:(FtcInterstitial *)interstitial;

// called when an error occurs loading the interstitial content
- (void)interstitialFailedToLoad:(FtcInterstitial *)interstitial;

// called when the interstitial has close, and disposed of it's views
- (void)interstitialClosed:(FtcInterstitial *)interstitial;

@end

#endif /* FtcInterstitialDelegate_h */

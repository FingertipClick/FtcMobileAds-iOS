//
//  FtcInterstitial.h
//  FtcMobileAds
//
//  Created by KYPoseidonL on 2020/10/21.
//  Copyright © 2020 KYPoseidonL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FtcInterstitialDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class Placement;
@interface FtcInterstitial : NSObject

- (instancetype)initWithPlacement:(Placement *)placement delegate:(id<FtcInterstitialDelegate>)delegate;

- (void)presentFromRootViewController:(UIViewController *)rootVC;



@end



NS_ASSUME_NONNULL_END

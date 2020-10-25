//
//  FtcBanner.h
//  FtcMobileAds
//
//  Created by KYPoseidonL on 2020/10/21.
//  Copyright © 2020 KYPoseidonL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Placement, PlacementRequestConfig;
@interface FtcBanner : NSObject

- (instancetype)initWithPlacement:(Placement *)placement container:(UIView *)container placementRequestConfig:(PlacementRequestConfig *)placementRequestConfig;

- (void)destroy;

@end

NS_ASSUME_NONNULL_END

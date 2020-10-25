//
//  FtcMobileAds.h
//  FtcMobileAds
//
//  Created by KYPoseidonL on 2020/10/21.
//  Copyright © 2020 KYPoseidonL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Placement.h"
#import "PlacementRequestConfig.h"
#import "FtcInterstitial.h"
#import "FtcBanner.h"

//! Project version number for FtcMobileAds.
FOUNDATION_EXPORT double FtcMobileAdsVersionNumber;

//! Project version string for FtcMobileAds.
FOUNDATION_EXPORT const unsigned char FtcMobileAdsVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <FtcMobileAds/PublicHeader.h>



typedef NS_ENUM(NSInteger, FtcResponseStatus) {
    FtcResponseStatusNOADS = 0,
    FtcResponseStatusSuccess = 1
};

@class PlacementRequestConfig;
@class Placement;
@interface FtcMobileAds : NSObject


/// Requests a single placement with explicit success and failure callbacks. Provided for Objective-C compatibility.
/// param config the configuration used for requesting one placement.
///
/// param success a success callback block. The block will be given a <code>String</code> status and a list of <code>Placement</code>s.
///
/// param failure a failure callback block with status code, response body, and error.
///
+ (void)requestPlacementWithConfig:(PlacementRequestConfig *)config success:(void (^)(FtcResponseStatus status, NSArray *placements))success failure:(void (^)(NSError *error))failure;

/// Requests a pixel.
/// param with the <code>URLString</code> for this pixel.
///
+ (void)requestPixelWithURLString:(NSString *)urlString;

@end


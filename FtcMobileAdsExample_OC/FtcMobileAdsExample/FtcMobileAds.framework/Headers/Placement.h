//
//  Placement.h
//  FtcMobileAds
//
//  Created by KYPoseidonL on 2020/10/21.
//  Copyright © 2020 KYPoseidonL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Placement : NSObject

/// The unique ID of the banner returned.
@property (nonatomic, readonly) NSInteger bannerId;
/// A pass-through click redirect URL.
@property (nonatomic, readonly, copy) NSString *redirectUrl;
/// The image banner URL.
@property (nonatomic, readonly, copy) NSString *imageUrl;
/// The width of this placement.
@property (nonatomic, readonly) NSInteger width;
/// The height of this placement.
@property (nonatomic, readonly) NSInteger height;
/// Alternate text for screen readers on the web.
@property (nonatomic, readonly, copy) NSString *altText;
/// An HTML target attribute.
@property (nonatomic, readonly, copy) NSString *target;
/// An optional user-specified tracking pixel URL.
@property (nonatomic, readonly, copy) NSString *trackingPixel;
/// Used to record an impression for this request.
@property (nonatomic, readonly, copy) NSString *accupixelUrl;
/// Contains a zone URL to request a new ad.
@property (nonatomic, readonly, copy) NSString *refreshUrl;
/// The user-specified delay between refresh URL requests.
@property (nonatomic, readonly, copy) NSString *refreshTime;
/// The HTML markup of an ad request.
@property (nonatomic, readonly, copy) NSString *body;

@property (nonatomic, assign) BOOL clicked;

- (instancetype)initWithJsonDictionary:(NSDictionary *)jsonDictionary;

- (BOOL)isValid;

@end

NS_ASSUME_NONNULL_END

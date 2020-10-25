//
//  PlacementRequestConfig.h
//  FtcMobileAds
//
//  Created by KYPoseidonL on 2020/10/21.
//  Copyright © 2020 KYPoseidonL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlacementRequestConfig : NSObject

- (instancetype)initWithAccountId:(NSInteger)accountId zoneId:(NSInteger)zoneId width:(NSInteger)width height:(NSInteger)height keywords:(NSArray<NSString *> *)keywords click:(NSString *)click;

- (NSString *)queryString;

@end

NS_ASSUME_NONNULL_END

//
//  RNAdvertisingId.m
//
//  Created by App Like on 28.09.17.
//

#import "RNAdvertisingId.h"


@implementation RNAdvertisingId

RCT_EXPORT_MODULE();


RCT_EXTERN_METHOD(getAdvertisingId:(RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

+ (void)getAdvertisingId:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    const BOOL isAdvertisingTrackingEnabled = [ASIdentifierManager.shared().isAdvertisingTrackingEnabled];
    
    const NSMutableDictionary *response = [
        @"isLimitAdTrackingEnabled": [!isAdvertisingTrackingEnabled],
        @"advertisingId": @""
    ];

    if (isAdvertisingTrackingEnabled) {
        const NSString *idfa = [ASIdentifierManager.shared().advertisingIdentifier.uuidString];
        response[@"advertisingId"] = idfa;
    }
    
    resolve(response);
}
@end

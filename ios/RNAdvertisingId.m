//
//  RNAdvertisingId.m
//
//  Created by App Like on 28.09.17.
//

#import "RNAdvertisingId.h"
#import <AdSupport/ASIdentifierManager.h>


@implementation RNAdvertisingId

RCT_EXPORT_MODULE();


RCT_EXTERN_METHOD(getAdvertisingId:(RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

+ (void)getAdvertisingId:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    BOOL isAdvertisingTrackingEnabled = [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];

    const NSMutableDictionary *response = [NSMutableDictionary dictionary];
    [response setObject: [NSNumber numberWithBool:!isAdvertisingTrackingEnabled] forKey:@"isLimitAdTrackingEnabled"];
    [response setObject:@"" forKey:@"advertisingId"];

    if (isAdvertisingTrackingEnabled) {
        const NSString *idfa =[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        response[@"advertisingId"] = idfa;
    }

    resolve(response);
}
@end

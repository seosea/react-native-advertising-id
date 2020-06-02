#if __has_include(<React/RCTBridgeModule.h>)
  #import <React/RCTBridgeModule.h>
#else
  #import "RCTBridgeModule.h"
#endif
#import "RCTLog.h"
#import <AdSupport/AdSupport.h>

@interface RNAdvertisingId : NSObject <RCTBridgeModule>
@end

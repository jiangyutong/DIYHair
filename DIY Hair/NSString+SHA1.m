//
//  NSString+SHA1.m
//  Ability
//
//  Created by BlueGrey on 2017/12/25.
//  Copyright © 2017年 blueGrey. All rights reserved.
//

#import "NSString+SHA1.h"
#import <CommonCrypto/CommonCrypto.h>
typedef unsigned char *(*MessageDigestFuncPtr)(const void *data,  CC_LONG len, unsigned char *md);
static NSString *_getMessageDigest(NSString *string, MessageDigestFuncPtr fp, NSUInteger length) {
    const char *cString = [string UTF8String];
    unsigned char *digest = malloc(sizeof(unsigned char) * length);
    fp(cString, (CC_LONG)strlen(cString), digest);
    NSMutableString *hash = [NSMutableString stringWithCapacity:length * 2];
    for (int i = 0; i < length; ++i) {
        [hash appendFormat:@"%02x", digest[i]];
    }
    free(digest);
    return [hash lowercaseString];
}
@implementation NSString (SHA1)
- (NSString *)sha1 {
    return _getMessageDigest(self, CC_SHA1, CC_SHA1_DIGEST_LENGTH);
}
@end


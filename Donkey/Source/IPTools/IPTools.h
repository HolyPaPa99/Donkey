//
//  IPTools.h
//  Test1
//
//  Created by 李烨烽 on 10/10/2022.
//
#import <Foundation/Foundation.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>

@interface IPTools : NSObject

+ (NSString *)getCellularIpv4;
+ (NSString *)getCellularIpv6;
+ (NSString *)getWifiIpv4;
+ (NSString *)getWifiIpv6;
+ (NSDictionary<NSString *, NSString *> *)getIPAddresses;

@end

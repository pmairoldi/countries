//
//  Countries.m
//  MarsRoaming
//
//  Created by Pierre-Marc Airoldi on 2014-09-11.
//  Copyright (c) 2014 PeteAppDesigns. All rights reserved.
//

#import "Countries.h"
#import "Country.h"
#import <UIKit/UIKit.h>

@interface Countries ()

@property (nonatomic, strong) NSArray *countries;

@end

@implementation Countries

-(instancetype)init {
    
    return [self initWithContries:nil];
}

-(instancetype)initWithContries:(NSArray *)countries {

    self = [super init];
    
    if (!self) {
        return nil;
    }

    NSMutableArray *tempCountries = [NSMutableArray arrayWithCapacity:[[NSLocale ISOCountryCodes] count]];
    
    NSArray *isoCodes;
    
    if (countries) {
        isoCodes = countries;
    }
    
    else {
        isoCodes = [NSLocale ISOCountryCodes];
    }
    
//    NSDictionary *countryCallingCodes = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CountryCodes" ofType:@"plist"]];
//    
//    NSData *data = [NSJSONSerialization dataWithJSONObject:countryCallingCodes options:NSJSONWritingPrettyPrinted error:nil];
//    
//    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    
//    [data writeToFile:[docPath stringByAppendingPathComponent:@"countryCodes.json"] atomically:YES];
    
    NSDictionary *countryCallingCodes = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:(NSString *)[[NSBundle mainBundle] pathForResource:@"countryCodes" ofType:@"json"]] options:0 error:nil];

    for (NSString *countryCode in isoCodes) {
        
        NSString *identifier = [NSLocale localeIdentifierFromComponents:[NSDictionary dictionaryWithObject:countryCode forKey:NSLocaleCountryCode]];
        NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:identifier];
        
        Country *country = [Country new];
        country.code = countryCode;
        country.displayName = displayName;
        
        if ([[countryCallingCodes allKeys] containsObject:countryCode]) {
            
            NSString *callingCode = [countryCallingCodes objectForKey:countryCode];
        
            if (callingCode) {
                country.callingCode = callingCode;
            }
        }
        
        if (![UIImage imageNamed:country.code]) {
            
        }
        
        [tempCountries addObject:country];
    }
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES];
    
    _countries = [tempCountries sortedArrayUsingDescriptors:@[descriptor]];
    
    return self;
}

-(NSArray *)array {
    
    return _countries;
}

@end

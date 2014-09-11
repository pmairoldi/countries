//
//  Country.h
//  MarsRoaming
//
//  Created by Pierre-Marc Airoldi on 2014-09-11.
//  Copyright (c) 2014 PeteAppDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *callingCode;

@end

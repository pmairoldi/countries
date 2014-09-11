//
//  Countries.h
//  MarsRoaming
//
//  Created by Pierre-Marc Airoldi on 2014-09-11.
//  Copyright (c) 2014 PeteAppDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"

@interface Countries : NSObject

-(instancetype)initWithContries:(NSArray *)countries;

-(NSArray *)array;

@end

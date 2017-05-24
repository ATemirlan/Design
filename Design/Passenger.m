//
//  Passenger.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/24/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "Passenger.h"

@implementation Passenger

+ (instancetype)initWith:(NSString *)number name:(NSString *)name {
    Passenger *p = [[Passenger alloc] init];
    
    [p setIdNumber:number];
    [p setFullName:name];
    
    return p;
}

@end

//
//  InvalidObject.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/24/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "InvalidObject.h"

@implementation InvalidObject

+ (instancetype)initWith:(NSString *)number
            customerName:(NSString *)customerName
                    type:(NSString *)type
                    info:(NSString *)info
                  status:(NSString *)status {
    InvalidObject *o = [[InvalidObject alloc] init];
    
    [o setNumber:number];
    [o setCustomerName:customerName];
    [o setType:type];
    [o setInfo:info];
    [o setStatus:status];
    
    return o;
}

@end

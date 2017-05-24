//
//  Flight.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "Flight.h"

@implementation Flight

+ (instancetype)initWith:(NSString *)customer
                 dipatch:(NSString *)dispatch
                 arrival:(NSString *)arrival
                    date:(NSString *)date
                  number:(NSString *)number
            dispatchDate:(NSString *)dispatchDate
             arrivalDate:(NSString *)arrivalDate
              flightTime:(NSString *)flightTime
            dispatchZone:(NSString *)dispatchZone
             arrivalZone:(NSString *)arrivalZone; {
    Flight *f = [[Flight alloc] init];
    
    [f setCustomer:customer];
    [f setDispatch:dispatch];
    [f setArrival:arrival];
    [f setDate:date];
    [f setNumber:number];
    [f setDispatchDate:dispatchDate];
    [f setArrivalDate:arrivalDate];
    [f setFlightTime:flightTime];
    [f setDispatchZone:dispatchZone];
    [f setArrivalZone:arrivalZone];
    
    return f;
}

@end

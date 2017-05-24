//
//  Order.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "Order.h"

@implementation Order

+ (instancetype)initWith:(NSString *)number
                    date:(NSString *)date
                  status:(NSString *)status
                  amount:(NSString *)amount
                 flights:(NSArray *)flights
              passengers:(NSArray *)passengers
          invalidObjects:(NSArray *)invalidObjects {
    Order *order = [[Order alloc] init];
    
    [order setNumber:number];
    [order setDate:date];
    [order setStatus:status];
    [order setAmount:amount];
    [order setFlights:flights];
    [order setPassengers:passengers];
    [order setInvalidObjects:invalidObjects];
    
    return order;
}

@end

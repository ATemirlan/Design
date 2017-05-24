//
//  Flight.h
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flight : NSObject

@property (strong, nonatomic) NSString *customer;
@property (strong, nonatomic) NSString *dispatch;
@property (strong, nonatomic) NSString *arrival;
@property (strong, nonatomic) NSString *date;

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *dispatchDate;
@property (strong, nonatomic) NSString *arrivalDate;
@property (strong, nonatomic) NSString *flightTime;
@property (strong, nonatomic) NSString *dispatchZone;
@property (strong, nonatomic) NSString *arrivalZone;

+ (instancetype)initWith:(NSString *)customer
                 dipatch:(NSString *)dispatch
                 arrival:(NSString *)arrival
                    date:(NSString *)date
                  number:(NSString *)number
            dispatchDate:(NSString *)dispatchDate
             arrivalDate:(NSString *)arrivalDate
              flightTime:(NSString *)flightTime
            dispatchZone:(NSString *)dispatchZone
             arrivalZone:(NSString *)arrivalZone;

@end

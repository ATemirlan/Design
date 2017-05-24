//
//  Order.h
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *amount;

@property (strong, nonatomic) NSArray *flights;
@property (strong, nonatomic) NSArray *passengers;
@property (strong, nonatomic) NSArray *invalidObjects;


+ (instancetype)initWith:(NSString *)number
                    date:(NSString *)date
                  status:(NSString *)status
                  amount:(NSString *)amount
                 flights:(NSArray *)flights
              passengers:(NSArray *)passengers
              invalidObjects:(NSArray *)invalidObjects;

@end

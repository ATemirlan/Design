//
//  Passenger.h
//  Design
//
//  Created by Темирлан Алпысбаев on 5/24/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Passenger : NSObject

@property (strong, nonatomic) NSString *idNumber;
@property (strong, nonatomic) NSString *fullName;

+ (instancetype)initWith:(NSString *)number name:(NSString *)name;

@end

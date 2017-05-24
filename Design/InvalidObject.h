//
//  InvalidObject.h
//  Design
//
//  Created by Темирлан Алпысбаев on 5/24/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InvalidObject : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *customerName;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *info;
@property (strong, nonatomic) NSString *status;

+ (instancetype)initWith:(NSString *)number
                 customerName:(NSString *)customerName
                 type:(NSString *)type
                 info:(NSString *)info
                 status:(NSString *)status;

@end

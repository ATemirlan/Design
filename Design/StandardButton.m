//
//  StandardButton.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "StandardButton.h"
#import "UIColor+SystemColor.h"

@implementation StandardButton

- (void)drawRect:(CGRect)rect {
    self.layer.borderWidth = 0.8f;
    self.layer.cornerRadius = 8.0f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.tintColor = [UIColor whiteColor];
}


@end

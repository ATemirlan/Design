//
//  UIColor+SystemColor.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "UIColor+SystemColor.h"

@implementation UIColor (SystemColor)

+ (UIColor *)designBlue {
    return [UIColor colorWithRed:82.0f/255.0f green:143.0f/255.0f blue:200.0f/255.0f alpha:1.0f];
}

+ (UIColor *)designGreen {
    return [UIColor colorWithRed:76.0f/255.0f green:175.0f/255.0f blue:80.0f/255.0f alpha:1.0f];
}

+ (UIColor *)designRed {
    return [UIColor colorWithRed:255.0f/255.0f green:65.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
}

+ (UIColor *)designText {
    return [UIColor colorWithRed:33.0f/255.0f green:44.0f/255.0f blue:91.0f/255.0f alpha:1.0f];
}

+ (UIColor *)designGray {
    return [UIColor colorWithRed:138.0f/255.0f green:143.0f/255.0f blue:162.0f/255.0f alpha:1.0f];
}

@end

//
//  HeaderTableViewCell.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "HeaderTableViewCell.h"
#import "UIColor+SystemColor.h"

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor designBlue];
}

@end

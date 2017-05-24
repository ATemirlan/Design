//
//  OrderTableViewCell.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *contentV;

@end

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
}

- (void)setupView {
    self.contentV.layer.borderWidth = 0.8f;
    self.contentV.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

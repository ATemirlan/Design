//
//  MainTableViewCell.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/22/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeight;

@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)createCellsWith:(NSArray *)data {
    if (!self.isPopulated) {
        const CGFloat rowHeight = 44.0f;
        const CGFloat separatorHeight = 10.0f;
        
        self.containerHeight.constant = data.count * (rowHeight + separatorHeight);
        
        for (int i = 0; i < data.count; i++) {
            UIView *reusableView = [[UIView alloc] initWithFrame:CGRectMake(0, i * (rowHeight + separatorHeight), self.container.frame.size.width, rowHeight)];
            
            UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, separatorHeight / 2, reusableView.frame.size.width, rowHeight / 2)];
            l1.text = @"qwe";
            
            UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(0, separatorHeight / 2 + rowHeight / 2, reusableView.frame.size.width, rowHeight / 2)];
            l2.text = @"asd";
            
            [reusableView addSubview:l1];
            [reusableView addSubview:l2];
            
            [self.container addSubview:reusableView];
        }
    }
}

@end

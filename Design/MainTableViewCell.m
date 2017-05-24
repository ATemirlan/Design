//
//  MainTableViewCell.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/22/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "MainTableViewCell.h"
#import "UIColor+SystemColor.h"

@interface MainTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *contentV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeight;

@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupView];
}

- (void)setupView {
    self.contentV.layer.borderWidth = 1.0f;
    self.contentV.layer.borderColor = [UIColor designGray].CGColor;
}

- (void)createCellsWith:(Order *)order {
    if (!self.isPopulated) {
        const CGFloat rowHeight = 44.0f;
        const CGFloat separatorHeight = 8.0f;
        
        self.containerHeight.constant = order.flights.count * (rowHeight + separatorHeight);
        self.head.text = order.number;
        self.footer.text = order.status;
        self.date.text = order.date;

        if ([order.status isEqualToString:@"Ошибка оформления"]) {
            self.footer.textColor = [UIColor designRed];
        } else if ([order.status isEqualToString:@"Ожидается подтверждение"]) {
            self.footer.textColor = [UIColor designText];
        } else {
            self.footer.textColor = [UIColor designGreen];
        }
        
        for (int i = 0; i < order.flights.count; i++) {
            UIView *reusableView = [[UIView alloc] initWithFrame:CGRectMake(0, i * (rowHeight + separatorHeight), self.container.frame.size.width, rowHeight)];
            Flight *flight = order.flights[i];
            
            [reusableView addSubview:[self labelWith:CGRectMake(0, separatorHeight / 2, reusableView.frame.size.width, rowHeight / 2)
                                                text:flight.customer]];
            [reusableView addSubview:[self labelWith:CGRectMake(0, separatorHeight / 2 + rowHeight / 2, reusableView.frame.size.width, rowHeight / 2)
                                                text:[NSString stringWithFormat:@"%@ - %@ / %@", flight.dispatch, flight.arrival, flight.date]]];
            
            [self.container addSubview:reusableView];
        }
    }
}

- (UILabel *)labelWith:(CGRect)rect text:(NSString *)text {
    UILabel *l1 = [[UILabel alloc] initWithFrame:rect];
    l1.font = [UIFont systemFontOfSize:14.0];
    l1.textColor = [UIColor designText];
    l1.text = text;
    
    return l1;
}

@end

//
//  MainTableViewCell.h
//  Design
//
//  Created by Темирлан Алпысбаев on 5/22/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flight.h"
#import "Order.h"

@interface MainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *head;
@property (weak, nonatomic) IBOutlet UILabel *footer;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UIView *container;

@property (nonatomic) BOOL isPopulated;

- (void)createCellsWith:(Order *)order;

@end

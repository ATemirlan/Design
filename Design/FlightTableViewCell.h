//
//  FlightTableViewCell.h
//  Design
//
//  Created by Темирлан Алпысбаев on 5/24/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlightTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *flightPoints;
@property (weak, nonatomic) IBOutlet UILabel *dispatchTime;
@property (weak, nonatomic) IBOutlet UILabel *arrivalTime;
@property (weak, nonatomic) IBOutlet UILabel *dispatchZone;
@property (weak, nonatomic) IBOutlet UILabel *arrivalZone;

@end

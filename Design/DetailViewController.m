//
//  DetailViewController.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/23/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "DetailViewController.h"
#import "HeaderTableViewCell.h"
#import "PassengersTableViewCell.h"
#import "FlightTableViewCell.h"
#import "BookingTableViewCell.h"
#import "OrderTableViewCell.h"
#import "UIColor+SystemColor.h"
#import <MXParallaxHeader/MXParallaxHeader.h>
#import "Flight.h"
#import "Passenger.h"
#import "InvalidObject.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) UIView *headerView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setups];
    [self setupNavigationBar];
}

- (void)setups {
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.backgroundColor = [UIColor designBlue];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"HeaderCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"BookingTableViewCell" bundle:nil] forCellReuseIdentifier:@"BookingCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PassengersTableViewCell" bundle:nil] forCellReuseIdentifier:@"PassengersCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrderCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FlightTableViewCell" bundle:nil] forCellReuseIdentifier:@"FlightCell"];
}

- (void)setupNavigationBar {
    [self setTitle:[NSString stringWithFormat:@"Детали заказа %@", self.order.number]];
    
    UIBarButtonItem *myBarButtonItem = [[UIBarButtonItem alloc] init];
    myBarButtonItem.title = @"Back";
    [myBarButtonItem setTarget:self];
    [myBarButtonItem setAction:@selector(goBack:)];
    self.navigationItem.leftBarButtonItem = myBarButtonItem;
    self.navigationItem.backBarButtonItem = nil;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (IBAction)goBack:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return self.order.flights.count;
            break;
        case 2:
            return self.order.passengers.count;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return self.order.invalidObjects.count;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *headerCellID = @"HeaderCell";
    static NSString *flightCellID = @"FlightCell";
    static NSString *passengersCellID = @"PassengersCell";
    static NSString *bookingCellID = @"BookingCell";
    static NSString *orderCellID = @"OrderCell";
    
    if (indexPath.section == 0) {
        HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:headerCellID];
        
        if (!cell) cell = [[HeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headerCellID];
        
        return cell;
    } else if (indexPath.section == 1) {
        FlightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:flightCellID];
        
        if (!cell) cell = [[FlightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flightCellID];
        
        Flight *f = self.order.flights[indexPath.row];
        cell.number.text = [NSString stringWithFormat:@"Рейс %@", f.number];
        cell.date.text = f.date;
        cell.flightPoints.text = [NSString stringWithFormat:@"%@ - %@", f.dispatch, f.arrival];
        cell.dispatchTime.text = f.dispatchDate;
        cell.arrivalTime.text = f.arrivalDate;
        cell.dispatchZone.text = f.dispatchZone;
        cell.arrivalZone.text = f.arrivalZone;
        
        return cell;
    } else if (indexPath.section == 2) {
        PassengersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:passengersCellID];
        
        if (!cell) cell = [[PassengersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:passengersCellID];
        
        Passenger *p = self.order.passengers[indexPath.row];
        cell.nameLabel.text = p.fullName;
        cell.numberLabel.text = p.idNumber;
        
        return cell;
    } else if (indexPath.section == 3) {
        BookingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:bookingCellID];
        
        if (!cell) cell = [[BookingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bookingCellID];
        
        cell.bookNumber.text = @"123456";
        
        return cell;
    } else {
        OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:orderCellID];
        
        if (!cell) cell = [[OrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderCellID];

        InvalidObject *io = self.order.invalidObjects[indexPath.row];
        
        cell.dateLabel.text = @"23.10.2016";
        cell.numberLabel.text = io.number;
        cell.nameLabel.text = io.customerName;
        cell.typeLabel.text = io.type;
        cell.periodLabel.text = io.info;
        cell.statusLabel.text = io.status;
        
        if ([io.status isEqualToString:@"Отказано"]) {
            cell.statusLabel.textColor = [UIColor designRed];
        } else {
            cell.statusLabel.textColor = [UIColor designGreen];
        }
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 || indexPath.section == 3) {
        return 44.0;
    }
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    
    return section == 1 ? 44.0f : 36.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] init];
    
    sectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, 36.0f);
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 0, self.view.frame.size.width - 40.0f, 36.0f)];
    sectionView.backgroundColor = [UIColor lightGrayColor];
    l.font = [UIFont systemFontOfSize:14.0f];
    l.textColor = [UIColor whiteColor];
    
    if (section == 1) {
        sectionView.backgroundColor = [UIColor whiteColor];
        l.text = @"Авиабилеты";
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor = [UIColor designText];
    } else if (section == 2) {
        l.text = @"Пассажиры";
    } else if (section == 3) {
        l.text = @"№ Бронирования";
    } else if (section == 4) {
        l.text = @"СПИСОК ВОЗВРАТОВ И ОБМЕНА";
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor = [UIColor designText];
        sectionView.backgroundColor = [UIColor whiteColor];
    }
    
    [sectionView addSubview:l];
    
    return sectionView;
}

@end

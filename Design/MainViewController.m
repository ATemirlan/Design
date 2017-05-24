//
//  MainViewController.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/22/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "DetailViewController.h"
#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "Passenger.h"
#import "InvalidObject.h"

@interface MainViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *orders;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Мои заказы"];
    [self createLocalData];
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"MainCell";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    
    [cell createCellsWith:self.orders[indexPath.row]];
    cell.isPopulated = YES;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc = [[DetailViewController alloc] init];
    vc.order = self.orders[indexPath.row];
    [self showViewController:vc sender:nil];
}

#pragma  mark - Local data

- (void)createLocalData {
    Passenger *p1 = [Passenger initWith:@"12345687" name:@"John Lee"];
    Passenger *p2 = [Passenger initWith:@"87945687" name:@"Johan Bree"];
    
    InvalidObject *io1 = [InvalidObject initWith:@"№ 201245123" customerName:@"LEE" type:@"Страхование жизни" info:@"20.12.2016 - 31.12.2016" status:@"Отказано"];
    InvalidObject *io2 = [InvalidObject initWith:@"№ 201245123" customerName:@"JOHN" type:@"Flight" info:@"Almaty - Astana" status:@"Возврат оформлен"];
    
    Flight *f1 = [Flight initWith:@"LEE" dipatch:@"Almaty" arrival:@"Astana" date:@"30.12.2016" number:@"538" dispatchDate:@"06:05" arrivalDate:@"08:45" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    Flight *f2 = [Flight initWith:@"JOHN" dipatch:@"Astana" arrival:@"Moscow" date:@"31.12.2016" number:@"539" dispatchDate:@"23:05" arrivalDate:@"04:05" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    Flight *f3 = [Flight initWith:@"JOHAN" dipatch:@"Moscow" arrival:@"Almaty" date:@"01.01.2017" number:@"540" dispatchDate:@"09:09" arrivalDate:@"18:45" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    
    Order *o1 = [Order initWith:@"№ 201245123" date:@"23.10.2016" status:@"Оформлен" amount:@"130 000" flights:@[f1, f2, f3] passengers:@[p1, p2] invalidObjects:@[io1, io2]];
    
    Flight *f21 = [Flight initWith:@"DAVIDS" dipatch:@"Almaty" arrival:@"Los Angeles" date:@"21.09.2016" number:@"538" dispatchDate:@"06:05" arrivalDate:@"08:45" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    Flight *f22 = [Flight initWith:@"JOHN" dipatch:@"Los Angeles" arrival:@"Washington" date:@"31.09.2016" number:@"539" dispatchDate:@"23:05" arrivalDate:@"04:05" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    
    Order *o2 = [Order initWith:@"№ 201238923" date:@"23.10.2016" status:@"Ошибка оформления" amount:@"130 000" flights:@[f21, f22] passengers:@[p1, p2] invalidObjects:@[io1, io2]];
    
    Flight *f31 = [Flight initWith:@"LEE" dipatch:@"Boston" arrival:@"Paris" date:@"23.03.2017" number:@"538" dispatchDate:@"06:05" arrivalDate:@"08:45" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    Flight *f32 = [Flight initWith:@"JOHN" dipatch:@"Paris" arrival:@"Lyon" date:@"25.03.2017" number:@"539" dispatchDate:@"23:05" arrivalDate:@"04:05" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    Flight *f33 = [Flight initWith:@"GUILLAUME" dipatch:@"Lyon" arrival:@"Monaco" date:@"26.03.2017" number:@"540" dispatchDate:@"09:09" arrivalDate:@"18:45" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    Flight *f34 = [Flight initWith:@"MENSAH" dipatch:@"Monaco" arrival:@"Rome" date:@"01.04.2017" number:@"540" dispatchDate:@"09:09" arrivalDate:@"18:45" flightTime:@"2ч 40 мин" dispatchZone:@"SEM" arrivalZone:@"UST"];
    
    Order *o3 = [Order initWith:@"№ 201549123" date:@"23.10.2016" status:@"Ожидается подтверждение" amount:@"130 000" flights:@[f31, f32, f33, f34] passengers:@[p1, p2] invalidObjects:@[io1, io2]];

    self.orders = @[o1, o2, o3];
}

@end

//
//  ViewController.m
//  02-展示汽车数据
//
//  Created by xiaomage on 16/1/7.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "XMGCarGroup.h"
#import "XMGCar.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 所有的车数据 */
@property (nonatomic, strong) NSArray *carGroups;
@end

@implementation ViewController

- (NSArray *)carGroups
{
    if (!_carGroups) {
        XMGCarGroup *group0 = [[XMGCarGroup alloc] init];
        group0.header = @"德系品牌";
        group0.footer = @"德系品牌JKJKJKJKJKJK";
        group0.cars = @[
                        [XMGCar carWithName:@"奔驰" icon:@"m_2_100"],
                        [XMGCar carWithName:@"宝马" icon:@"m_3_100"]
                        ];
        
        XMGCarGroup *group1 = [[XMGCarGroup alloc] init];
        group1.header = @"日系品牌";
        group1.footer = @"日系品牌JKJKJKJKJKJK";
        group1.cars = @[
                        [XMGCar carWithName:@"丰田" icon:@"m_7_100"],
                        [XMGCar carWithName:@"马自达" icon:@"m_18_100"],
                        [XMGCar carWithName:@"本田" icon:@"m_26_100"]
                        ];
        
        XMGCarGroup *group2 = [[XMGCarGroup alloc] init];
        group2.header = @"天系品牌";
        group2.footer = @"天系品牌JKJKJKJKJKJK";
        group2.cars = @[
                        [XMGCar carWithName:@"比亚迪" icon:@"m_15_100"]
                        ];
        
        _carGroups = @[group0,group1,group2];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取出第section组的组模型
    XMGCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    // 设置cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 取出indexPath.secton这组的组模型
    XMGCarGroup *group = self.carGroups[indexPath.section];
    
    // 取出indexPath.row对应的车模型
    XMGCar *car = group.cars[indexPath.row];
    
    // 设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
     return cell;
}

/**
 *  告诉tableView每一组的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 取出第section组的组模型
    XMGCarGroup *group = self.carGroups[section];
    return group.header;
}

/**
 *  告诉tableView每一组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 取出第section组的组模型
    XMGCarGroup *group = self.carGroups[section];
    return group.footer;
}













@end

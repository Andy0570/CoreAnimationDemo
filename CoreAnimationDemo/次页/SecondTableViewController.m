//
//  SecondTableViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "SecondTableViewController.h"

// Frameworks
#import <YYKit/NSObject+YYModel.h>

// Controller
#import "HQLPopSpringViewController.h"
#import "PPSpringSizeViewController.h"
#import "PPSpringButtonViewController.h"

#import "PPPictureViewController.h"
#import "PPPictureConstraintViewController.h"

#import "PPDecayViewController.h"

// View
#import "UITableViewCell+ConfigureModel.h"

// Model
#import "HQLTableViewCellGroupedModel.h"
#import "HQLTableViewCellStyleDefaultModel.h"

// Delegate
#import "HQLGroupedArrayDataSource.h"

static NSString * const cellReuseIdentifier = @"UITableViewCellStyleDefault";

@interface SecondTableViewController ()

@property (nonatomic, strong) NSArray *groupedModelsArray;
@property (nonatomic, strong) HQLGroupedArrayDataSource *arrayDataSource;

@end

@implementation SecondTableViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"POP 动画示例";
    [self setupTableView];
}

#pragma mark - Custom Accessors

// 从 mainTableViewTitleModel.plist 文件中读取数据源加载到 NSArray 类型的数组中
- (NSArray *)groupedModelsArray {
    if (!_groupedModelsArray) {
        // mainTableViewTitleModel.plist 文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"secondTableViewTitleModel" ofType:@"plist"];
        // 读取 mainTableViewTitleModel.plist 文件，并存放进 jsonArray 数组
        NSArray *jsonArray = [NSArray arrayWithContentsOfFile:path];
        // 将 jsonArray 数组中的 JSON 数据转换成 HQLTableViewCellGroupedModel 模型
        _groupedModelsArray = [NSArray modelArrayWithClass:[HQLTableViewCellGroupedModel class]
                                                      json:jsonArray];
    }
    return _groupedModelsArray;
}

#pragma mark - Private

- (void)setupTableView {
    // 配置 tableView 数据源
    HQLTableViewCellConfigureBlock configureBlock = ^(UITableViewCell *cell, HQLTableViewCellStyleDefaultModel *model) {
        [cell hql_configureForKeyValueModel:model];
    };
    self.arrayDataSource = [[HQLGroupedArrayDataSource alloc] initWithGroupsArray:self.groupedModelsArray cellReuserIdentifier:cellReuseIdentifier configureBlock:configureBlock];
    self.tableView.dataSource = self.arrayDataSource;
        
    // 隐藏 tableView 底部空白部分线条
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // when selected row of indexPath
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        HQLPopSpringViewController *vc = [[HQLPopSpringViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        PPSpringSizeViewController *vc = [[PPSpringSizeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        PPSpringButtonViewController *vc = [[PPSpringButtonViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 3) {
        PPPictureViewController *vc = [[PPPictureViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        PPPictureConstraintViewController *vc = [[PPPictureConstraintViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 5) {
        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [main instantiateViewControllerWithIdentifier:@"HQLCustomSegueTableViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        PPDecayViewController *vc = [[PPDecayViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end

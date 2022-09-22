//
//  NavOperateViewController.m
//  EasyNavigationDemo
//
//  Created by nf on 2017/9/14.
//  Copyright © 2017年 chenliangloveyou. All rights reserved.
//

#import "NavOperateViewController.h"
#import "EasyNavigation.h"
@interface NavOperateViewController ()

@property (nonatomic,strong)NSArray *dataArray ;

@end

@implementation NavOperateViewController
- (void)dealloc
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationView setTitle:@"随意操作导航条"];
    
    UILabel *label  =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth_N(), 180)];
    label.numberOfLines = 0 ;
    label.backgroundColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter ;
    label.text = @"\n以下操作只会对本导航条起作用。\n如果想改变整个工程中导航条属性，请设置EasyNavigationOptions.h中的属性";
    self.tableView.tableHeaderView = label ;
    self.statusBarStyle = UIStatusBarStyleLightContent ;
//    self.navbigTitleType = NavBigTitleTypeIOS11 ;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellStyleValue1;
    cell.textLabel.textColor = [UIColor blueColor];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            kWeakSelf(self)
            [self.navigationView addLeftButtonWithTitle:@"新增按钮" callback:^(UIView *view) {
                [weakself.navigationController popViewControllerAnimated:YES];

            }];
//            [self.navigationView addLeftButtonWithTitle:@"新增按钮" clickCallBack:^(UIView *view) {
//                [weakself.navigationController popViewControllerAnimated:YES];
//            }];
            
        }break;
        case 1:
        {
            if (self.navigationView.navigationBackButton) {
                [self.navigationView.navigationBackButton removeFromSuperview];
                self.navigationView.navigationBackButton = nil ;
            }
        }break;
        case 2:
        {
            [self.navigationView setTitle:@"我是标题"];
        }break;
        case 3:
        {
            self.navigationView.titleLabel.font = [UIFont boldSystemFontOfSize:22];
            self.navigationView.titleLabel.textColor = [UIColor redColor];
        }break;
        case 4:
        {
           __block UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, -10, ScreenWidth_N()-180, NavigationHeight_N() + 20)];
            view.backgroundColor = [UIColor purpleColor];
            [self.navigationView addSubview:view callback:^(UIView *view) {
                [view removeFromSuperview];
            }];
        }break;
        case 5:
        {
            [self.navigationView.backgroundView setImage:[EasyNavigationUtils createImageWithColor:[UIColor orangeColor]]];
        }break;
        case 6:
        {
            self.navigationView.hidden = YES ;
//            if (self.navigationView) {
//                [self.navigationView removeFromSuperview];
//                self.navigationView = nil ;
//            }
        }break;
        case 7:
        {
            self.navigationView.hidden = NO ;
//            if (!self.navigationView) {
//                EasyNavigationView *nav = [[EasyNavigationView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , NAV_HEIGHT)];
//                [self setNavigationView:nav];
//                [self.view addSubview:nav];
//            }
        }break ;
        default:
            break;
    }
}
- (NSArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = @[
                       @"左边增加一个按钮",
                       @"删除返回按钮",
                       @"增加一个标题",
                       @"改变标题的字体",
                       @"增加一个视图",
                       @"改变导航条背景颜色",
                       @"移除导航条",
                       @"添加导航条"];
    }
    return _dataArray ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

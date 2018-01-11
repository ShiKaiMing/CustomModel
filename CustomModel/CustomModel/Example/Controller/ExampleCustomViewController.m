//
//  ExampleCustomViewController.m
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/11.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "ExampleCustomViewController.h"
#import "ExampleCustomModel.h"
#import "ExampleCustomTableViewCell.h"
@interface ExampleCustomViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ExampleCustomViewController
static NSInteger const kHeightForHeader = 64;
static NSString * const kTableViewCell = @"kTableViewCell";
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 44;
        // 注册cell
        [tableView registerClass:[ExampleCustomTableViewCell class] forCellReuseIdentifier:kTableViewCell];
        //
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self createBack];
    [self loadDataForTableView];
}
#pragma mark-----创建返回
-(void)createBack
{
    UISegmentedControl *segaMnetControl = [[UISegmentedControl alloc]initWithItems:@[@"返回"]];
    segaMnetControl.frame = CGRectMake((WIDTH-200)/2, 26,200,32);
    segaMnetControl.tintColor = kRGBColor(16,123,214);
    [segaMnetControl addTarget:self action:@selector(SegmentControlChange11:) forControlEvents:UIControlEventValueChanged];
    [segaMnetControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:kRGBColor(16,123,214)} forState:UIControlStateNormal];
    segaMnetControl.layer.borderWidth = 1;
    segaMnetControl.layer.cornerRadius = 5;
    segaMnetControl.layer.masksToBounds = YES;
    segaMnetControl.layer.borderColor = kRGBColor(16,123,214).CGColor;
    [segaMnetControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [self.view addSubview:segaMnetControl];
}
#pragma mark-----返回上一个界面
-(void)SegmentControlChange11:(UISegmentedControl *)seg
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --- 数据处理
- (void)loadDataForTableView
{
    WS(weakSelf);
    [ExampleCustomModel requestDataWithType:self.type sucessBlock:^(NSMutableArray *dataArray) {
        if (weakSelf.type == 3) {
            ManModel *model = [[ManModel alloc]init];
            model.NAME = [dataArray firstObject];
            model.SEX = [dataArray firstObject];
            model.HOBBY = [dataArray firstObject];
            [dataArray removeAllObjects];
            [dataArray addObject:model];
        }
        [weakSelf.dataArray removeAllObjects];
        [weakSelf.dataArray addObjectsFromArray:dataArray];
        [weakSelf.tableView reloadData];
        
    } failureBlock:^(NSError *error) {
        SLog(@"%@",error);
    }];
}
#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
    
}
//解决方案3:只要最后一个显示的cell内容不为空，将其子视图删除，成为一个空白的cell，再进行自定义
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        // 通过唯一标识符classicRouteCell创建cell实例
        ExampleCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCell forIndexPath:indexPath];
        //当cell存在且最后一个存在时 将最后的一个cell删除其子视图，成为一个空白的cell，再进行自定义cell
        //这里是使用while语句 或if语句
        if (cell) {
            while ([cell.contentView.subviews lastObject] != nil) {
                [[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.dataArray.count != 0) {
            ManModel *model = self.dataArray[indexPath.row];
            cell.model = model;
        }
        return cell;
    }
    return nil;
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

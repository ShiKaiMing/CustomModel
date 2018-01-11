//
//  ViewController.m
//  CustomModel
//
//  Created by fangd@silviscene.com on 2018/1/10.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "ViewController.h"
#import "ExampleCustomViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UISegmentedControl *segaMnetControl = [[UISegmentedControl alloc]initWithItems:@[@"最外层是字典",@"最外层是数组",@"是字符串"]];
    segaMnetControl.frame = CGRectMake((WIDTH-280)/2, 120,280,32);
    segaMnetControl.tintColor = kRGBColor(16,123,214);
    [segaMnetControl addTarget:self action:@selector(SegmentControlChange:) forControlEvents:UIControlEventValueChanged];
    [segaMnetControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:kRGBColor(16,123,214)} forState:UIControlStateNormal];
    segaMnetControl.layer.borderWidth = 1;
    segaMnetControl.layer.cornerRadius = 5;
    segaMnetControl.layer.masksToBounds = YES;
    segaMnetControl.layer.borderColor = kRGBColor(16,123,214).CGColor;
    [segaMnetControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [self.view addSubview:segaMnetControl];
}

-(void)SegmentControlChange:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == 0) {
        ExampleCustomViewController *VC = [[ExampleCustomViewController alloc]init];
        VC.type = 1;
        [self presentViewController:VC animated:YES completion:nil];
    }
    if (seg.selectedSegmentIndex == 1) {
        ExampleCustomViewController *VC = [[ExampleCustomViewController alloc]init];
        VC.type = 2;
        [self presentViewController:VC animated:YES completion:nil];
    }
    if (seg.selectedSegmentIndex == 2) {
        ExampleCustomViewController *VC = [[ExampleCustomViewController alloc]init];
        VC.type = 3;
        [self presentViewController:VC animated:YES completion:nil];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

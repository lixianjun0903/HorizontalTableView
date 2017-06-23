//
//  ViewController.m
//  HorizontalTableView
//
//  Created by lixianjun on 2017/6/23.
//  Copyright © 2017年 lxj. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalTableView.h"

@interface ViewController ()<HorizontalTableViewDelegate>
{
    HorizontalTableView *_tableView;
}
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTableView];
    [self loadData];
}

-(void)createTableView
{
    _tableView=[[HorizontalTableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}

-(void)loadData
{
    self.dataArray=[NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<1000; i++)
    {
        [self.dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [_tableView refreshData];
}

#pragma mark 相关代理方法
-(NSInteger)numberOfColumnsForTableView:(HorizontalTableView *)tableView
{
    return self.dataArray.count;
}

-(UIView*)tableView:(HorizontalTableView *)tableView viewForIndex:(NSInteger)index
{
    
    UIView *view=[tableView dequeueColumnView];
    if(view==nil)
    {
        view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        label.tag=100;
        [view addSubview:label];
    }
    float a=arc4random()%256/255.0;
    float b=arc4random()%256/255.0;
    float c=arc4random()%256/255.0;
    view.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
    UILabel *label=(UILabel*)[view viewWithTag:100];
    label.text=self.dataArray[index];
    
    return view;
}

-(CGFloat)columnWidthForTableView:(HorizontalTableView *)tableView
{
    return self.view.frame.size.width;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

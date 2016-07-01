//
//  ViewController.m
//  idtest
//
//  Created by foscom on 16/7/1.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "ViewController.h"
#import "IMYAOPDemo.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tabview;
@property (nonatomic, strong) IMYAOPDemo* aopDemo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _tabview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tabview.delegate = self;
    _tabview.dataSource = self;
    [self.view addSubview:_tabview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.aopDemo = [IMYAOPDemo new];
        UITableView* feedsTableView = [self valueForKey:@"tabview"];
        self.aopDemo.aopUtils = feedsTableView.aop_utils;

    });

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

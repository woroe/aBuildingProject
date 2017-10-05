//
//  IndexController.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import "IndexController.h"
#import "tagController.h"
#import "mapController.h"

@interface IndexController ()
@end
@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=BuildString(@"IndexController");
    
    
    UIButton *btnLeft=[UIButton new];
    [btnLeft setBackgroundColor:[UIColor blackColor]];
	[btnLeft setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnLeft setTitle:BuildString(@"mapController") forState:UIControlStateNormal];
     btnLeft.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btnLeft addTarget:self action:@selector(btnLeftClick) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:btnLeft];
    [btnLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.mas_equalTo(30.0);
        make.size.mas_equalTo(CGSizeMake(100.0,50.0));
    }];
    
    UIButton *btnRight=[UIButton new];
    [btnRight setBackgroundColor:[UIColor blackColor]];
    [btnRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnRight setTitle:BuildString(@"tagController") forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btnRight addTarget:self action:@selector(btnRightClick) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:btnRight];
    [btnRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30.0);
        make.trailing.mas_equalTo(-30.0);
        make.size.mas_equalTo(CGSizeMake(100.0,50.0));
    }];
    
}

-(void)btnLeftClick{
    mapController *MC=[mapController new];
    [self.navigationController pushViewController:MC animated:YES];
}
-(void)btnRightClick{
    tagController *TC=[tagController new];
    [self.navigationController pushViewController:TC animated:YES];
}



#pragma mark - 视图即将显示 - 消失、被覆盖或是隐藏 - 内存报警
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}
@end
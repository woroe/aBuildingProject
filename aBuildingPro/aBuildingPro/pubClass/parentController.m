//
//  parentController.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import "parentController.h"

@interface parentController ()
@end
@implementation parentController

- (void)viewDidLoad {
    [super viewDidLoad];
    selfWid=SCREEN_WIDTH;
    selfHig=SCREEN_HEIGHT-64.0;
    self.view.backgroundColor=[UIColor whiteColor];
    
    contentView=[UIView new];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64.0);
        make.size.mas_equalTo(CGSizeMake(selfWid,selfHig));
        make.leading.bottom.trailing.mas_equalTo(self.view);
    }];
    
}



#pragma mark - 视图即将显示 - 消失、被覆盖或是隐藏 - 内存报警
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (BOOL)shouldAutorotate{return NO;}
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}
@end
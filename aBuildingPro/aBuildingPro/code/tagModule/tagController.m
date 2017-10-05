//
//  tagController.m
//  aBuildingPro
//
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//

#import "tagController.h"

@implementation tagController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=BuildString(@"tagController");
    
    
    
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
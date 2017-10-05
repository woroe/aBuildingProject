//
//  AppComeIn.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import "appComeIn.h"
#import "IndexController.h"

@interface appComeIn()
@end

@implementation appComeIn
@synthesize myWindow;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //sleep(2);                                                //让启动画面多显示2秒
    [[UIApplication sharedApplication] setStatusBarHidden:YES];//隐藏状态栏
    
    myWindow= [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    IndexController *MV= [[IndexController alloc]init];
    UINavigationController  *MainNav= [[UINavigationController alloc]initWithRootViewController:MV];
    //MainNav.navigationBarHidden=YES;
    myWindow.rootViewController=MainNav;
    [myWindow makeKeyAndVisible];
    return YES;
}

#pragma mark - 变成横屏 -
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    //    NSArray *arr= [(UINavigationController *)myWindow.rootViewController viewControllers];
    //    if ([[arr lastObject] isKindOfClass:[cutHead_VC class]] || [[arr lastObject] isKindOfClass:[register_VC class]]){
    //        return UIInterfaceOrientationMaskPortrait;
    //    }
    return UIInterfaceOrientationMaskPortrait;
}
- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(NSString *)extensionPointIdentifier{
    return NO; //始终使用系统输入法
}
- (void)applicationWillResignActive:(UIApplication *)application{       //NSLog(@"\n ===> 程序暂行 !");
    //当应用程序发送有关活跃不活跃状态。这可能会发生某些类型的临时中断（例如，传入的电话呼叫或SMS消息），或当用户退出应用程序时，开始过渡到背景状态。
    //使用此方法暂停正在进行的任务，禁用定时器，并踩下油门，OpenGL ES的帧速率。游戏应该使用这种方法来暂停游戏。
}
- (void)applicationDidEnterBackground:(UIApplication *)application{     //NSLog(@"\n ===> 程序进入后台 !");
    //使用这种方法来释放资源共享，保存用户数据，无效计时器，并储存足够的应用程序状态信息，应用程序恢复到其当前状态的情况下被终止后。
    //如果你的应用程序支持后台执行，这种方法被调用，而不是applicationWillTerminate：当用户退出。
}
- (void)applicationWillEnterForeground:(UIApplication *)application{    //NSLog(@"\n ===> 程序进入前台 !");
    //称为过渡的背景为无效状态的一部分，在这里你可以撤消许多进入背景的变化.
}
- (void)applicationDidBecomeActive:(UIApplication *)application{        //NSLog(@"\n ===> 程序重新激活 !");
    //重新启动任何任务，暂停（或尚未开始），而应用程序是无效的。如果应用程序是以前的背景下，选择性地刷新用户界面.
    //每次醒来都需要去判断是否得到device token
}
- (void)applicationWillTerminate:(UIApplication *)application{          //NSLog(@"\n ===> 程序意外暂行 !");
    // 应用程序终止时调用。如果合适的保存数据。
}
/**********记录崩溃信息到后台日志，再次登陆后上传*********/
void UncaughtExceptionHandler(NSException *ex) {
    //    NSString *ErrorMsg=[NSString stringWithFormat:@"\n 闪退中 堆栈数组 :%@\n 异常原因:%@\n 异常名称:%@\n",[ex callStackSymbols],[ex reason],[ex name]];
    //    [pubMethods write_Log:ErrorMsg];NSLog(@"闪退中:%@",ErrorMsg);
    //    [[pubTiShi instance] LHShow:@" 程序出错，请重新启动本程序，以便上传出错原因!"];
}

@end

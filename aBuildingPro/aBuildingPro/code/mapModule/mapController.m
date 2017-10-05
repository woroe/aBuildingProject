//
//  mapController.m
//  Created by hong Li on 2017/10/5.
//  Copyright © 2017年 hong LiaBuilding. All rights reserved.
//
#import "mapController.h"
#import <MapKit/MapKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "mapRedBag.h"

//http://lbs.amap.com/api/ios-sdk/ 高德地图官网
@interface mapController ()<MAMapViewDelegate,AMapSearchDelegate>
@end
@implementation mapController{
    AMapSearchAPI			*search;
    MAMapView 				*_mapView;
    NSMutableArray			*redArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=BuildString(@"mapController");
    [AMapServices sharedServices].apiKey = @"06fac939c85d9cac72622c47005f6de9";
    //开启 HTTPS 功能,  地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    
    //初始化地图
    _mapView = [[MAMapView alloc] initWithFrame:contentView.bounds];
    _mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _mapView.delegate=self;
    //把地图添加至view
    [contentView addSubview:_mapView];
    
    
    //获取天气数据
    search = [[AMapSearchAPI alloc] init];
    search.delegate = self;
    //设置天气查询参数
    AMapWeatherSearchRequest *request = [[AMapWeatherSearchRequest alloc] init];
    request.city = @"110000";
    request.type = AMapWeatherTypeLive; //AMapWeatherTypeLive为实时天气；AMapWeatherTypeForecase为预报天气
    //发起天气查询
	[search AMapWeatherSearch:request];
    
    [self initAnnotations];
}
#pragma mark - 初始化 气泡 坐标
- (void)initAnnotations{
    redArr = [NSMutableArray array];
    
    CLLocationCoordinate2D coordinates[10] = {
        {39.992520, 116.336130},
        {39.992520, 116.336170},
        {39.998293, 116.352343},
        {40.004087, 116.348904},
        {40.001442, 116.353915},
        {39.989105, 116.353915},
        {39.989098, 116.360200},
        {39.998439, 116.360201},
        {39.979590, 116.324219},
        {39.978234, 116.352792}
    };
    
    for (int i = 0; i < 10; ++i){
        MAPointAnnotation *a1 = [[MAPointAnnotation alloc] init];
        a1.coordinate = coordinates[i];
        a1.title      = [NSString stringWithFormat:@"anno: %d", i];
        [redArr addObject:a1];
    }
}
#pragma mark - 返回 自定义气泡
/**
 * @brief 根据anntation生成对应的View 自定义气泡
 * @param mapView 地图View
 * @param annotation 指定的标注
 * @return 生成的标注View
 */
- (MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
        }
        
        annotationView.canShowCallout               = YES;
        annotationView.animatesDrop                 = YES;
        annotationView.draggable                    = YES;
        annotationView.rightCalloutAccessoryView    = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.pinColor                     = [redArr indexOfObject:annotation] % 3;
        
        return annotationView;
    }
    return nil;
}
/*!
 @brief 当选中一个annotation views时调用此接口
 @param mapView 地图View
 @param views 选中的annotation views
 */
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//当查询成功时，会进到 onWeatherSearchDone 回调函数，通过回调函数，可获取查询城市实时的以及未来3天的天气情况
- (void)onWeatherSearchDone:(AMapWeatherSearchRequest *)request response:(AMapWeatherSearchResponse *)response{
    //通过 response.lives 获取城市对应实时天气数据信息，实时天气详细信息参考 AMapLocalWeatherLive 类。
    //通过 response.forecasts 获取城市对应预报天气数据信息，预报天气详细信息参考 AMapLocalWeatherForecast 类。
    //可查询未来3天的预报天气，通过 AMapLocalWeatherForecast.casts 获取预报天气列表
    //解析response获取天气信息
}
//当查询失败时，会进入 didFailWithError 回调函数，通过该回调函数获取产生的失败的原因。
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error{
    NSLog(@"Error: %@", error);
}


#pragma mark - 视图即将显示 - 消失、被覆盖或是隐藏 - 内存报警
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_mapView addAnnotations:redArr];
    [_mapView showAnnotations:redArr edgePadding:UIEdgeInsetsMake(20, 20, 20, 80) animated:YES];
}
- (void)didReceiveMemoryWarning {[super didReceiveMemoryWarning];}
@end
//
//  AppDelegate.m
//  测试刷新冲突
//
//  Created by 郭朝顺 on 2021/9/24.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 保存状态
- (BOOL)application:(UIApplication *)application shouldSaveSecureApplicationState:(NSCoder *)coder {
    NSLog(@"%s",__func__);

    return YES;
}

// 恢复状态
- (BOOL)application:(UIApplication *)application shouldRestoreSecureApplicationState:(NSCoder *)coder {
    NSLog(@"%s",__func__);

    return YES;
}


-(void)application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder{
    NSLog(@"%s",__func__);

    NSString *str = [coder decodeObjectForKey:@"userName"];
    NSLog(@"value is %@",str);


}
-(void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(nonnull NSCoder *)coder{
    NSLog(@"%s",__func__);
    [coder encodeObject:@"jake" forKey:@"userName"];


}

// 低版本使用这个
- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    NSLog(@"%s",__func__);

    return YES;
}


- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(nonnull NSCoder *)coder {
    NSLog(@"%s",__func__);

    return YES;
}





@end

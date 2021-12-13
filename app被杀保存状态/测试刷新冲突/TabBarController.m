//
//  TabBarController.m
//  测试刷新冲突
//
//  Created by 郭朝顺 on 2021/12/11.
//

#import "TabBarController.h"

@interface TabBarController ()<UIViewControllerRestoration,UITabBarControllerDelegate>

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.restorationClass = [self class];
    self.restorationIdentifier = @"TabBarController";

    self.delegate = self;
}


+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder{

    NSLog(@"%s",__func__);

    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TabBarController *controller = [storybord instantiateViewControllerWithIdentifier:[identifierComponents lastObject]];
    controller.restorationIdentifier = [identifierComponents lastObject];
    controller.restorationClass = [TabBarController class];
    return controller;
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder{
    [super decodeRestorableStateWithCoder:coder];
    NSNumber *index = [coder decodeObjectForKey:@"index"];
    NSLog(@"保存的下表为: %@",index);
    self.selectedIndex = [index intValue];
}





-(void)encodeRestorableStateWithCoder:(NSCoder *)coder{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:@(1) forKey:@"index"];

}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"%s",__func__);
}

@end

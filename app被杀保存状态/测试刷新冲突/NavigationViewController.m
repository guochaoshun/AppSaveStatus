//
//  NavigationViewController.m
//  测试刷新冲突
//
//  Created by 郭朝顺 on 2021/12/11.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.restorationClass = [self class];
    self.restorationIdentifier = @"NavigationViewController";

}


+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder{

    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    NavigationViewController *controller = [storybord instantiateViewControllerWithIdentifier:@"NavigationViewController1"];
    controller.restorationIdentifier = [identifierComponents lastObject];
    controller.restorationClass = [NavigationViewController class];
    return controller;
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder{
    [super decodeRestorableStateWithCoder:coder];
    NSNumber *count = [coder decodeObjectForKey:@"count"];
    NSLog(@"保存的数量为: %@",count);



}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:@(self.viewControllers.count) forKey:@"count"];

}


@end

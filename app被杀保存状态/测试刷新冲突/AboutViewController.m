//
//  AboutViewController.m
//  测试刷新冲突
//
//  Created by 郭朝顺 on 2021/12/11.
//

#import "AboutViewController.h"
#import "AboutDetailViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"默认title";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AboutDetailViewController *detail = [[AboutDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}


+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder{

    NSLog(@"%s",__func__);
    AboutViewController *about = [[AboutViewController alloc] init];
    about.restorationClass = [self class];
    about.restorationIdentifier = @"AboutViewController";
    return about;
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder{
    [super decodeRestorableStateWithCoder:coder];
    NSString *title = [coder decodeObjectForKey:@"title"];
    NSLog(@"保存的标题为: %@",title);
    self.title = [NSString stringWithFormat:@"%@ - %@",self.title, title];

}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:@"关于我们" forKey:@"title"];
}

@end

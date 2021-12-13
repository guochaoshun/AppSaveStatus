//
//  AboutDetailViewController.m
//  测试刷新冲突
//
//  Created by 郭朝顺 on 2021/12/11.
//

#import "AboutDetailViewController.h"

@interface AboutDetailViewController ()

@end

@implementation AboutDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"收藏";
    self.view.backgroundColor = [UIColor cyanColor];

    self.restorationClass = [self class];
    self.restorationIdentifier = @"AboutDetailViewController";


}



+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder{

    NSLog(@"%s",__func__);
    AboutDetailViewController *detail = [[AboutDetailViewController alloc] init];
    detail.restorationClass = [self class];
    detail.restorationIdentifier = @"AboutDetailViewController";
    return detail;
}


-(void)decodeRestorableStateWithCoder:(NSCoder *)coder{
    [super decodeRestorableStateWithCoder:coder];
    NSString *title = [coder decodeObjectForKey:@"title"];
    NSLog(@"保存的标题为: %@",title);
    self.title = [NSString stringWithFormat:@"%@ - %@",self.title, title];

}

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:@"详情" forKey:@"title"];
}



@end

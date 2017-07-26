//
//  ViewController.m
//  02-展示大图片
//
//  Created by xiaomage on 16/1/4.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    
    // 2.设置contentSize
    self.scrollView.contentSize = image.size;
    
}


@end

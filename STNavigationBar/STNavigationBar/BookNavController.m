//
//  BookNavController.m
//  STNavigationBar
//
//  Created by https://github.com/STShenZhaoliang/STNavigationBar on 16/5/5.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "BookNavController.h"

#import "STConfig.h"
@interface BookNavController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, assign) CGFloat iconHeight;
@end

@implementation BookNavController

#pragma mark - --- lift cycle 生命周期 ---

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    UIView *titleView = [UIView new];
    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleView;
    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.navigationItem.titleView.frame));
    self.headerImageView.centerX = titleView.centerX;
    self.headerImageView.y = (STNavigationBarHeight - self.iconHeight)/2;
    [titleView addSubview:self.headerImageView];
}

#pragma mark - --- delegate 视图委托 ---
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y + scrollView.contentInset.top;
    // 1.拉动最大的改变距离
    CGFloat distance = 200;
    CGFloat scale = 1.0;
    CGFloat scaleChange = 1 - offsetY/distance;
    CGFloat minBar = 5;

    // TODO: 算法待优化
    if (offsetY <= 0) { // 1.下拉
        scale = MIN(1, scaleChange);
    }else { // 2.上拉
        scale = MAX((44 - minBar * 2) / self.iconHeight , scaleChange);
    }
    NSLog(@"%s %f %f ", __FUNCTION__, scale,offsetY);

    self.headerImageView.transform = CGAffineTransformMakeScale(scale, scale);
//    self.headerImageView.y = (STNavigationBarHeight - self.iconHeight)/2;
    self.headerImageView.y = -self.headerImageView.layer.cornerRadius/2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld", (long)indexPath.row];
    return cell;
}
#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---

- (UITableView *)tableView
{
    if (!_tableView) {
        CGFloat tableX = 0;
        CGFloat tableY = 0;
        CGFloat tableW = ScreenWidth;
        CGFloat tableH = ScreenHeight - tableY;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(tableX, tableY, tableW, tableH) style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        CGFloat imageX = 0;
        CGFloat imageY = 0;
        CGFloat imageW = self.iconHeight;
        CGFloat imageH = imageW;
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        _headerImageView.image = [UIImage imageNamed:@"icon"];
        _headerImageView.layer.cornerRadius = imageW/2;
        _headerImageView.layer.masksToBounds = YES;


    }
    return _headerImageView;
}

- (CGFloat)iconHeight
{
    return 64;
}

//- (void)injected
//{
//    NSLog(@"I've been injected: %@", self);
//}


@end




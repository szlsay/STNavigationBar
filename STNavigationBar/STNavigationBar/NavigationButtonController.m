//
//  NavigationButtonController.m
//  STNavigationBar
//
//  Created by 沈兆良 on 16/5/4.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "NavigationButtonController.h"

#import "STConfig.h"
@interface NavigationButtonController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIColor *backColor;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, strong) UIView *headerContentView;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIImageView *iconView0;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGFloat scale;

/** <#des#> */
@property (nonatomic, strong) UIButton *buttonRight;
/** <#des#> */
@property (nonatomic, strong) UIButton *buttonLeft;
/** <#des#> */
@property (nonatomic, strong) UIButton *buttonLeft0;
@end

@implementation NavigationButtonController

#pragma mark - --- lift cycle 生命周期 ---

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];

    // 1.去掉背景图片和底部线条
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    // 2.设置标题
    //    self.navigationItem.title = @"个人信息";
    //    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

    //添加背景view
    [self.navigationController.navigationBar addSubview:self.backView];

    [self.headerContentView addSubview:self.headerImageView];
    [self.headerContentView addSubview:self.iconView];
    [self.headerContentView addSubview:self.buttonLeft];
    //    [self.headerContentView addSubview:self.label];

    UIView *headerView = [[UIView alloc] initWithFrame:self.headerContentView.bounds];
    [headerView addSubview:self.headerContentView];
    self.tableView.tableHeaderView = headerView;
}
#pragma mark - --- delegate 视图委托 ---
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentInset.top + scrollView.contentOffset.y;

    CGFloat progressIcon = offset * 2/ (self.headerImageView.bottom-64);
    CGFloat progress = offset / (self.headerHeight-64);

     self.backView.backgroundColor = [self.backColor colorWithAlphaComponent:progress];

    if (progressIcon > 1) {
        UIView *titleView = [UIView new];
        [titleView addSubview:self.iconView0];
        self.navigationItem.titleView = titleView;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.buttonLeft0];
        self.buttonLeft0.alpha = progressIcon - 1;

        if (progressIcon > 1.8) {

        }else {
            self.iconView0.width = (progressIcon-1) * 44;
            self.iconView0.height = (progressIcon-1) * 44;
            self.iconView0.x = -self.iconView0.width/2;
            self.iconView0.y = -self.iconView0.height/2;
            self.iconView0.layer.cornerRadius = self.iconView0.width/2.0f;
            self.iconView0.layer.masksToBounds = YES;
            self.iconView0.layer.borderWidth = 0.5;
            self.iconView0.layer.borderColor = [UIColor lightGrayColor].CGColor;
        }

    }else {
        self.iconView.alpha  = 1 - progressIcon;
        self.buttonLeft.alpha  = 1 - progressIcon;

        self.navigationItem.titleView = nil;
    }

    CGFloat offsetY = scrollView.contentOffset.y + 64;

    if (offsetY < 0) {
        self.headerContentView.y = offsetY;
        self.headerContentView.height = self.headerHeight - offsetY * 2;
        self.headerImageView.bounds = self.headerContentView.bounds;
        [self.headerImageView setContentMode:UIViewContentModeScaleAspectFill];
        self.iconView.center = self.headerImageView.center;
    }else {
         self.buttonLeft.centerY =  STStatusBarHeight + STNavigationBarHeight / 2 + offsetY;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
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
        CGFloat tableY = -(STNavigationBarHeight + STStatusBarHeight);
        CGFloat tableW = ScreenWidth;
        CGFloat tableH = ScreenHeight - tableY;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(tableX, tableY, tableW, tableH) style:UITableViewStyleGrouped];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)backView
{
    if (!_backView) {
        CGFloat viewX = 0;
        CGFloat viewY = -STStatusBarHeight;
        CGFloat viewW = ScreenWidth;
        CGFloat viewH = STNavigationBarHeight+STStatusBarHeight;
        _backView = [[UIView alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
    }
    return _backView;
}


- (UIColor *)backColor
{
    return [UIColor purpleColor];
}

- (CGFloat)headerHeight
{
    return 260;
}

- (UIView *)headerContentView
{
    if (!_headerContentView) {
        CGFloat viewX = 0;
        CGFloat viewY = 0;
        CGFloat viewW = ScreenWidth;
        CGFloat viewH = self.headerHeight;
        _headerContentView = [[UIView alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        [_headerContentView.layer setMasksToBounds:YES];
    }
    return _headerContentView;
}

- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        CGFloat viewX = 0;
        CGFloat viewY = 0;
        CGFloat viewW = ScreenWidth;
        CGFloat viewH = self.headerHeight;
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        _headerImageView.image  = [UIImage imageNamed:@"image"];
        [_headerImageView.layer setMasksToBounds:YES];
    }
    return _headerImageView;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        //        CGFloat viewW = 80;
        //        CGFloat viewH = 80;
        //        CGFloat viewX = STMarginBig;
        //        CGFloat viewY = self.headerContentView.height - viewH - STMarginBig;

        CGFloat viewW = 60;
        CGFloat viewH = viewW;
        CGFloat viewX = 0;
        CGFloat viewY = 0;
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        _iconView.center = self.headerImageView.center;
        _iconView.image = [UIImage imageNamed:@"icon"];
        _iconView.layer.cornerRadius = viewW/2.0f;
        _iconView.layer.masksToBounds = YES;
        _iconView.layer.borderWidth = 0.5;
        _iconView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _iconView;
}

- (UIImageView *)iconView0
{
    if (!_iconView0) {
        CGFloat viewW = 0;
        CGFloat viewH = viewW;
        CGFloat viewX = 0;
        CGFloat viewY = 0;
        _iconView0 = [[UIImageView alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        _iconView0.image = [UIImage imageNamed:@"icon"];
        _iconView0.layer.cornerRadius = viewW/2.0f;
        _iconView0.layer.masksToBounds = YES;
        _iconView0.layer.borderWidth = 0.5;
        _iconView0.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _iconView0;
}
- (UILabel *)label
{
    if (!_label) {
        CGFloat viewX = self.iconView.right + STMarginBig;
        CGFloat viewY = self.iconView.y;
        CGFloat viewW = ScreenWidth - viewX - STMarginBig;
        CGFloat viewH = self.iconView.height;
        _label = [[UILabel alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        _label.text = @"这羡慕你们这些人, 年纪轻轻的就认识了才华横溢的我!";
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:15];
        _label.numberOfLines = 0;
    }
    return _label;
}


- (UIButton *)buttonLeft
{
    if (!_buttonLeft) {
        CGFloat viewX = STMarginBig;
        CGFloat viewY = 0;
        CGFloat viewW = 42;
        CGFloat viewH = viewW;
        _buttonLeft = [[UIButton alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        _buttonLeft.centerY = STStatusBarHeight + STNavigationBarHeight / 2;
        [_buttonLeft setBackgroundImage:[UIImage imageNamed:@"jshop_sign_navi_prize_inactive"] forState:UIControlStateNormal];
    }
    return _buttonLeft;
}

- (UIButton *)buttonLeft0
{
    if (!_buttonLeft0) {
        CGFloat viewX = 0;
        CGFloat viewY = 0;
        CGFloat viewW = 42;
        CGFloat viewH = viewW;
        _buttonLeft0 = [[UIButton alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        [_buttonLeft0 setBackgroundImage:[UIImage imageNamed:@"jshop_sign_navi_prize_active"] forState:UIControlStateNormal];
        _buttonLeft0.alpha = 0.0;
    }
    return _buttonLeft0;
}

@end



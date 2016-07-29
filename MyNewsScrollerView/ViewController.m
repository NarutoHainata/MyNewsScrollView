//
//  ViewController.m
//  MyNewsScrollerView
//
//  Created by yang on 16/7/18.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ViewController.h"
#import "MryPageTable.h"
#import "BtnView.h"
@interface ViewController ()<UIScrollViewDelegate,MryScrollMenuDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *menuArray;
@property (nonatomic,strong) NSMutableArray *tableArray;
@property(nonatomic,strong)BtnView *btnView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    //设置数据源
    self.menuArray = [NSMutableArray arrayWithArray:@[@"推荐",@"热点",@"科技"]];
    self.tableArray = [NSMutableArray arrayWithCapacity:self.menuArray.count];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*self.menuArray.count, self.view.frame.size.height);
    for (int i = 0; i<self.menuArray.count; i++) {
        MryPageTable *table = [[MryPageTable alloc]initWithFrame:CGRectMake(i*self.view.frame.size.width,40 , self.view.frame.size.width, self.view.frame.size.height-40) style:UITableViewStylePlain];
        table.title = [self.menuArray objectAtIndex:i];
        //[self.tableArray addObject:table];
        [scrollView addSubview:table];
    }
    //设置边缘不能弹跳
    //scrollView.bounces = NO;
    //    //设置整页滚动
    scrollView.pagingEnabled = YES;
    //    //设置水平滚动条不可见
    //scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    _btnView = [[BtnView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    _btnView.menuArray = self.menuArray;
    _btnView.delegate = self;
    [self.view addSubview:_btnView];
    
    
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int current = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
   // NSLog(@"%d",current);
    [self.btnView setselectedIndex:current];
    
}
-(void)menuBtnClickAtIndex:(NSInteger)index{
    
    self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width*index, 0) ;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

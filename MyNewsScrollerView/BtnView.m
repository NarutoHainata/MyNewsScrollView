//
//  BtnView.m
//  MyNewsScrollerView
//
//  Created by yang on 16/7/18.
//  Copyright © 2016年 poplary. All rights reserved.
//
#define tagIndex 20160606
#import "BtnView.h"
#import "ViewController.h"
@implementation BtnView

-(id)initWithFrame:(CGRect)frame{

    self  =[super initWithFrame:frame];
    if (self) {
        
    
    }
    return self;
}
//设置数据源
- (void)setMenuArray:(NSMutableArray *)menuArray{
    _menuArray = menuArray;
    [self setUpMenuBtns];
}
//装载目录按钮
- (void)setUpMenuBtns{
    
    
    UIFont *btnFont = [UIFont systemFontOfSize:16];
    
    for (int i = 0; i < self.menuArray.count; i++) {
        UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuBtn.tag =  i;
        [menuBtn addTarget:self action:@selector(menuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [menuBtn setTitle:self.menuArray[i] forState:UIControlStateNormal];
        [menuBtn setBackgroundColor:[UIColor clearColor]];
        menuBtn.titleLabel.font = btnFont;
        [menuBtn setTitleColor:[UIColor colorWithRed:104/255.0 green:104/255.0 blue:124/255.0 alpha:1.f] forState:UIControlStateNormal];
        
        CGFloat menuBtnX = 15.f;
        
        //计算按钮大小
        CGRect btnRect = [self.menuArray[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:btnFont} context:nil];
        
        menuBtn.frame = CGRectMake(self.frame.size.width/4*i, 0, btnRect.size.width, 40);
        
        [self addSubview:menuBtn];
        
                if (i == 0) {
            //默认第一个选中
            self.selectedBtn = menuBtn;
        }
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/3, 1)];
    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
    self.view = view;
    
    
}
//设置选中目录
- (void)setSelectedBtn:(UIButton *)selectedBtn{
    if (selectedBtn == _selectedBtn) {
        return;
    }
    
    //计算scrollview偏移量
//    CGFloat originX = selectedBtn.center.x - CGRectGetMidX(self.scrollView.frame);
//    CGFloat maxOffsetX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
//    if (originX < 0) {
//        originX = 0;
//    }else if (originX > maxOffsetX){
//        originX = maxOffsetX;
//    }
//    [self.scrollView setContentOffset:CGPointMake(originX, 0) animated:YES];
    [UIView animateWithDuration:0.25 animations:^{
        //self.view.yy_width = titleButton.titleLabel.yy_width;
        self.view.center = selectedBtn.center;
        //NSLog(@"^^^^^^^%ld",(long)titleButton.tag);
    }];
    //改变按钮颜色
    [self.selectedBtn setTitleColor:[UIColor colorWithRed:104/255.0 green:104/255.0 blue:124/255.0 alpha:1.f] forState:UIControlStateNormal];
    [selectedBtn setTitleColor:[UIColor colorWithRed:49/255.0 green:195/255.0 blue:124/255.0 alpha:1.f] forState:UIControlStateNormal];
    
    _selectedBtn = selectedBtn;

}

- (void)menuBtnClick:(UIButton *)sender{
    NSLog(@"test");
    if (self.selectedBtn == sender) {
        NSLog(@"ee");
        return;
    }
    self.selectedBtn = sender;
    if ([self.delegate respondsToSelector:@selector(menuBtnClickAtIndex:)]) {
        NSLog(@"yes");
        [self.delegate menuBtnClickAtIndex:sender.tag];
    }

    
}
- (void)setselectedIndex:(NSInteger)index{
    if (self.subviews.count>index) {
        UIButton *selectedBtn = (UIButton *)[self subviews][index];
        self.selectedBtn = selectedBtn;

    }
    
}


@end

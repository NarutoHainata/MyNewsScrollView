//
//  BtnView.h
//  MyNewsScrollerView
//
//  Created by yang on 16/7/18.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MryScrollMenuDelegate <NSObject>

@optional

- (void)menuBtnClickAtIndex:(NSInteger)index;

@end

@interface BtnView : UIView

@property (nonatomic,weak) id<MryScrollMenuDelegate> delegate;
@property (nonatomic,strong) UIView *view;
@property (nonatomic,weak) UIButton *selectedBtn;
@property (nonatomic,strong) NSMutableArray *menuArray;
- (void)setselectedIndex:(NSInteger)index;

@end

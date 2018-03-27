//
//  crosswiseSelectView.h
//  hBtn
//
//  Created by zzw on 2017/11/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface crosswiseSelectView : UIView

@property (nonatomic, strong) NSArray * dataSource;

@property (nonatomic, assign) CGFloat leftMarge;
@property (nonatomic, assign) CGFloat itemMarge;
@property (nonatomic, assign) CGFloat itemSpace;
@property (nonatomic, assign) CGFloat section;
@property (nonatomic, assign) CGFloat font;
@end

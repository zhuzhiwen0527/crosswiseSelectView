//
//  crosswiseSelectView.m
//  hBtn
//
//  Created by zzw on 2017/11/26.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import "crosswiseSelectView.h"
@interface crosswiseSelectView () <UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray * btnArr;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIView * pageControlView;
@property (nonatomic, strong) UIPageControl * pageControl;
@end
@implementation crosswiseSelectView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    
    self.scrollView  =[[UIScrollView alloc] init];
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.scrollView];
    
    self.pageControlView = [[UIView alloc] init];
  
    self.pageControlView.backgroundColor = [UIColor redColor];
    [self addSubview:self.pageControlView];
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [self.pageControlView addSubview:self.pageControl];
    self.btnArr = [[NSMutableArray alloc] init];
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    
    for (NSInteger i = 0 ; i < dataSource.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font =[UIFont systemFontOfSize:self.font];
        [btn setTitle:dataSource[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor grayColor];
        btn.tag = i;
        [self.scrollView addSubview:btn];
        [self.btnArr addObject:btn];
        
    }
    [self setNeedsLayout];
}
#pragma mark --布局
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 20);
    
    self.pageControlView.frame = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, 20);
    self.pageControl.frame =self.pageControlView.bounds;
    
    CGFloat h = (self.frame.size.height - (self.section+1)*self.itemSpace - 20 )/self.section;
    CGFloat btnX = self.leftMarge;
    CGFloat btnY = self.itemSpace;
    NSInteger x = 0;
    for (NSInteger i = 0; i< self.btnArr.count; i++) {
        
        UIButton * btn = self.btnArr[i];
        
        NSDictionary * fontDict = @{NSFontAttributeName:[UIFont systemFontOfSize:self.font]};
        
        CGFloat w = [self.dataSource[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDict context:nil].size.width + 10;
        
     
        
        if (btnX + w > self.frame.size.width * (x + 1)) {
            
            if (btnY ==  self.frame.size.height - 20) {
                
                x ++;
                
                btnY = self.itemSpace;
                
            }else{
               
                btnY += h + self.itemSpace;
            }
            
            btnX = x * self.frame.size.width + self.leftMarge;
            
        
        }
        
        btn.frame =CGRectMake(btnX, btnY, w, h);
        
        btnX = CGRectGetMaxX(btn.frame)+self.itemMarge;
        if (i ==self.btnArr.count -1) {
            
            [self.scrollView setContentSize:CGSizeMake(self.frame.size.width * (x + 1), self.scrollView.frame.size.height)];
        }
    }
    self.pageControl.numberOfPages = x+1;
    
}
#pragma mark --scrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/self.frame.size.width;
    [self.pageControl setCurrentPage:index];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

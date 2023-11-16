//
//  ProProgressView.m
//  onetox
//
//  Created by Qian Yi on 2023/11/15.
//

#import "ProProgressView.h"

@interface ProProgressView ()

@property (nonatomic, assign) CGFloat progress;

//进度条颜色
@property(nonatomic,strong) UIColor *progerssColor;
//进度条背景颜色
@property(nonatomic,strong) UIColor *progerssBackgroundColor;
//进度条的宽度
@property(nonatomic,assign) CGFloat progerWidth;
//进度数据字体大小
@property(nonatomic,assign) CGFloat percentageFontSize;
//进度数字颜色
@property(nonatomic,strong) UIColor *percentFontColor;

@property (nonatomic, weak) UILabel *cLabel;

@end

@implementation ProProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        //默认颜色
        self.progerssBackgroundColor = [UIColor lightGrayColor];
        self.progerssColor = [UIColor blueColor];//[UIColor colorWithRed:248 green:93 blue:24 alpha:1];
        self.percentFontColor = [UIColor blueColor];//[UIColor colorWithRed:248 green:93 blue:24 alpha:1];
        //默认进度条宽度
        self.progerWidth=15;
        //默认百分比字体大小
        self.percentageFontSize=22;
        
        //百分比标签
//        UILabel *cLabel = [[UILabel alloc] initWithFrame:self.bounds];
//        cLabel.font = [UIFont boldSystemFontOfSize:self.percentageFontSize];
//        cLabel.textColor = self.percentFontColor;
//        cLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:cLabel];
//        self.cLabel = cLabel;
    }
    
    return self;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    _cLabel.text = [NSString stringWithFormat:@"%d%%", (int)floor(progress * 100)];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    
    //大圆弧
    UIBezierPath *backgroundPath = [[UIBezierPath alloc] init];
    //线宽
    backgroundPath.lineWidth = self.progerWidth;
    //颜色
    [self.progerssBackgroundColor set];
    backgroundPath.lineCapStyle = kCGLineCapRound;
    
    backgroundPath.lineJoinStyle = kCGLineJoinRound;
    CGFloat radius = (MIN(rect.size.width, rect.size.height) - self.progerWidth) * 0.5;
    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    [backgroundPath addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:2*M_PI/3 endAngle:M_PI/4  clockwise:YES];
    [backgroundPath stroke];
    
    
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(143, 160, 30, 30)]; 
    maskView.backgroundColor = [UIColor whiteColor];
    maskView.layer.cornerRadius = 15;
    maskView.layer.masksToBounds = YES;
    [self addSubview:maskView];
    
    UIView *cirleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    cirleView.backgroundColor = self.progerssBackgroundColor;
    cirleView.layer.cornerRadius = 10;
    cirleView.layer.masksToBounds = YES;
    cirleView.center = CGPointMake(15,15);
    [maskView addSubview:cirleView];
    
    
    //路径
    UIBezierPath *progressPath = [[UIBezierPath alloc] init];
    progressPath.lineWidth = self.progerWidth;
    [self.progerssColor set];
    progressPath.lineCapStyle = kCGLineCapRound;
    progressPath.lineJoinStyle = kCGLineJoinRound;
    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    [progressPath addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:2*M_PI/3 endAngle:2*M_PI/3+(M_PI * 2 * _progress) clockwise:YES];
    //连线
    [progressPath stroke];
}

@end

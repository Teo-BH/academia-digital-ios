//
//  ViewController.m
//  Quartz
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#define CIRCLE_PI_2 M_PI * 2

typedef NS_ENUM(NSInteger, TimeType) {
    TimeTypeHour,
    TimeTypeMinute,
    TimeTypeSecond
};

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *orangeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // View azul
    [self borderBlueView];

    // View Laranja
    [self createWatch];
}

-(void)borderBlueView {
    // apesar do framework ser QuartzCore
    // o prefixo das classes é CA (CoreAnimation)
    CALayer *layer = [[self blueView] layer];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    layer.borderWidth = 1.0;
}

- (IBAction)moveSlider:(UISlider *)sender {
    // controle de cornerRadius
    CGFloat height = self.blueView.frame.size.height / 2.0;
    height *= sender.value;
    [[[self blueView] layer] setCornerRadius:height];
}

-(void)createWatch {
    [self elipseOrangeView];

    // Cria os ponteiros
    CALayer *hour = [self createPointerWithHeight:80 withColor:[UIColor redColor]];
    CALayer *minute = [self createPointerWithHeight:110 withColor:[UIColor blueColor]];
    CALayer *second = [self createPointerWithHeight:120 withColor:[UIColor greenColor]];
    
    // Ajustar no centro
    hour.frame = [self frameCenterPointer:hour.frame viewRelativa:self.orangeView];
    minute.frame = [self frameCenterPointer:minute.frame viewRelativa:self.orangeView];
    second.frame = [self frameCenterPointer:second.frame viewRelativa:self.orangeView];
    
    // Adiciona a layer
    [[[self orangeView] layer] addSublayer:hour];
    [[[self orangeView] layer] addSublayer:minute];
    [[[self orangeView] layer] addSublayer:second];
    
    // Animações
    CABasicAnimation *hourAnimation = [self createAnimationPointer:TimeTypeHour];
    [hour addAnimation:hourAnimation forKey:nil];

    CABasicAnimation *minuteAnimation = [self createAnimationPointer:TimeTypeMinute];
    [minute addAnimation:minuteAnimation forKey:nil];

    CABasicAnimation *secondAnimation = [self createAnimationPointer:TimeTypeSecond];
    [second addAnimation:secondAnimation forKey:nil];
}

-(void)elipseOrangeView {
    CGFloat height = self.orangeView.frame.size.height;
    [[[self orangeView] layer] setCornerRadius:height / 2];
}

-(CGRect)frameCenterPointer:(CGRect)pointerFrame viewRelativa:(UIView *)view {
    CGRect result = pointerFrame;
    result.origin.x = view.frame.size.width / 2.0;
    result.origin.y = view.frame.size.height / 2.0 - result.size.height;
    return result;
}

-(CALayer *)createPointerWithHeight:(CGFloat)height {
    return [self createPointerWithHeight:height withColor:[UIColor blackColor]];
}

-(CALayer *)createPointerWithHeight:(CGFloat)height withColor:(UIColor *)color {
    CALayer *result = [CALayer layer];
    [result setFrame:CGRectMake(0, 0, 2, height)];
    [result setAnchorPoint:CGPointMake(0.5, 1)];
    [result setBackgroundColor:[color CGColor]];
    
    return result;
}

-(CABasicAnimation *)createAnimationPointer:(TimeType)timeType {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];

    // valor inicial
    CGFloat begin = [self getSecondByType:timeType];
    [animation setFromValue:@(begin)];
    
    // toValue -> anima até o valor
    //[animation setToValue:@(0)];
    
    // byValue -> anima incrementando o valor
    [animation setByValue:@(CIRCLE_PI_2)];
    
    // duração da animação
    CFTimeInterval duration = [self getTimeDuration:timeType];
    [animation setDuration:duration];
    
    // repetição (infinito)
    [animation setRepeatCount:INFINITY];
    
    return animation;
}

-(CFTimeInterval)getTimeDuration:(TimeType) type {
    switch (type) {
        case TimeTypeHour:
            return 60 * 60 * 12;
        case TimeTypeMinute:
            return 60 * 60;
        case TimeTypeSecond:
            return 60;
        default:
            return 1;
    }
}

-(NSString *)getDateFormatter:(TimeType) type {
    switch (type) {
        case TimeTypeHour:
            return @"hh";
        case TimeTypeMinute:
            return @"mm";
        case TimeTypeSecond:
            return @"ss";
        default:
            return [NSString string];
    }
}

-(CGFloat)getTimeTotal:(TimeType) type {
    switch (type) {
        case TimeTypeHour:
            return 12;
        case TimeTypeMinute:
            return 60;
        case TimeTypeSecond:
            return 60;
        default:
            return 1;
    }
}

-(CGFloat)getSecondByType:(TimeType) type {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString *dateFormat = [self getDateFormatter:type];
    [df setDateFormat:dateFormat];
    NSString *timeText = [df stringFromDate:[NSDate date]];
    NSInteger value = [timeText integerValue]; // valor da hora/min/seg
    CGFloat total = [self getTimeTotal:type];  // 100 % da hora/min/seg
    return value / total * CIRCLE_PI_2;        // posição no círculo
}

@end

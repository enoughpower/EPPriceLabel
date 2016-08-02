//
//  ViewController.m
//  PriceLabel
//
//  Created by dengcheng on 16/8/2.
//  Copyright © 2016年 dengcheng. All rights reserved.
//

#import "ViewController.h"
#import "CMTickerLabelView.h"
#import "PriceLabel.h"
@interface ViewController ()
@property (nonatomic, strong)CMTickerLabelView *Priceview;
@property (nonatomic, strong)PriceLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.Priceview = [[CMTickerLabelView alloc]initWithFrame:CGRectMake(100, 100, 200, 130)];
//    _Priceview.font = [UIFont systemFontOfSize:22];
//    [self.view addSubview:_Priceview];
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(action:) userInfo:nil repeats:YES];
//    
    _label = [[PriceLabel alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
    _label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_label];
    double number = 10000*((arc4random() % 90000) / 100000.00)+10000;
    NSString *numStr = [NSString stringWithFormat:@"%.02f",number];
    numStr = [self formattedNumberStr:numStr];
    [_label setText:numStr];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(action:) userInfo:nil repeats:YES];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)action:(NSTimer *)timer
{
    double number = 10000*((arc4random() % 90000) / 100000.00)+10000;
    NSString *numStr = [NSString stringWithFormat:@"%.02f",number];
    numStr = [self formattedNumberStr:numStr];
    [_label setText:numStr];

    
    
    
}
- (NSString *)formattedNumberStr: (NSString *)string {
    double num = [string doubleValue];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *numberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:num]];
    NSLog(@"%@",numberString);
    if ([numberString length] < 9) {
    }
    //    numberString = [numberString stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    //    numberString = [numberString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return numberString;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  PriceLabel
//
//  Created by dengcheng on 16/8/2.
//  Copyright © 2016年 dengcheng. All rights reserved.
//

#import "ViewController.h"
#import "PriceLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet PriceLabel *label;
//@property (nonatomic, strong)PriceLabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.Priceview = [[CMTickerLabelView alloc]initWithFrame:CGRectMake(100, 100, 200, 130)];
//    _Priceview.font = [UIFont systemFontOfSize:22];
//    [self.view addSubview:_Priceview];
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(action:) userInfo:nil repeats:YES];
//    
//    _label = [[PriceLabel alloc]initWithFrame:CGRectMake(100, 200, 200, 50)];
//    _label.backgroundColor = [UIColor blackColor];
    _label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:34];
    _label.textColor = [UIColor whiteColor];
//    [self.view addSubview:_label];
    double number = 100*((arc4random() % 90000) / 1000000000.0000)+10000;
    NSString *numStr = [NSString stringWithFormat:@"%lf",number];
//    numStr = [self formattedNumberStr:numStr];
    _label.textColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    [_label setText:numStr];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(action:) userInfo:nil repeats:YES];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)action:(NSTimer *)timer
{
    double number = 100*((arc4random() % 9000000) / 10000000.00)+10000;
    NSString *numStr = [NSString stringWithFormat:@"%lf",number];
//    numStr = [self formattedNumberStr:numStr];
    _label.textColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
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

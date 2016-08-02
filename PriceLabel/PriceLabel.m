//
//  PriceLabel.m
//  PriceLabel
//
//  Created by dengcheng on 16/8/2.
//  Copyright © 2016年 dengcheng. All rights reserved.
//

#import "PriceLabel.h"

@interface PriceLabel ()
@property (nonatomic, strong)NSMutableArray *layerArr;
@property (nonatomic, strong)NSMutableArray *characters;
@property (nonatomic, assign)CGFloat currentX;
@end


@implementation PriceLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    
}

- (void)initLayers
{
    _characters = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    self.currentX = 0;
    
    
    for (int i = 0; i < _text.length; i++) {
        NSString *subStr = [_text substringWithRange:NSMakeRange(i, 1)];
        [_characters addObject:subStr];
        CGSize size = [subStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 30)
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:22]}
                             context:0].size;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.currentX, 0, size.width, size.height)];
        label.text = subStr;
        label.font = [UIFont systemFontOfSize:22];
        label.tag = 100 + i;
        [self addSubview:label];
        self.currentX = label.frame.origin.x + label.frame.size.width;
        double a = (arc4random() % 100 +1) / 100.00;
        [UIView animateWithDuration:a animations:^{
            CATransform3D transForm = label.layer.transform;
            label.layer.transform = CATransform3DRotate(transForm, M_PI, 1, 0, 0);
        } completion:^(BOOL finished) {
            label.text = subStr;
            [UIView animateWithDuration:a animations:^{
                CATransform3D transForm = label.layer.transform;
                label.layer.transform = CATransform3DRotate(transForm, M_PI, 1, 0, 0);
            } completion:^(BOOL finished) {
            }];
        }];
    }
    NSLog(@"%@", self.characters);
}

- (void)setText:(NSString *)text
{
    _text = [text copy];
    if (_characters.count == 0) {
        [self initLayers];
    }else {
        if (text.length != _characters.count) {
            [self initLayers];
        }
        
        for (int i = 0; i < _characters.count; i++) {
            double a = (arc4random() % 100 +1) / 100.00;
            NSString *subStr = [_text substringWithRange:NSMakeRange(i, 1)];
            UILabel *label = (UILabel *)[self viewWithTag:100 + i];
            [UIView animateWithDuration:a animations:^{
                CATransform3D transForm = label.layer.transform;
                label.layer.transform = CATransform3DRotate(transForm, M_PI, 1, 0, 0);
            } completion:^(BOOL finished) {
                label.text = subStr;
                [UIView animateWithDuration:a animations:^{
                    CATransform3D transForm = label.layer.transform;
                    label.layer.transform = CATransform3DRotate(transForm, M_PI, 1, 0, 0);
                } completion:^(BOOL finished) {
                }];
            }];
            
            
            
        }
    }

    
    
    
    
    
    
}




@end

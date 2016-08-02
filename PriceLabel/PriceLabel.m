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
    self.currentX = 0;
    for (int i = 0; i < _text.length; i++) {
        NSString *subStr = [_text substringWithRange:NSMakeRange(i, 1)];
        [_characters addObject:subStr];
        CGSize size = [subStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 50)
                                 options:NSStringDrawingUsesLineFragmentOrigin
                              attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:40]}
                             context:0].size;
        __block UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.currentX, 0, size.width, size.height)];
        label.font = [UIFont systemFontOfSize:40];
        label.text = subStr;
        label.tag = 100 + i;
        [self addSubview:label];
        self.currentX = label.frame.origin.x + label.frame.size.width;
        double a = (arc4random() % 100 +1) / 100.00;
        [self showAnimationWithDuration:0.5 later:a label:label complictionBlock:^{
            label.text = subStr;
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
        if (text.length > _characters.count) {
            [self addNewLabel:text.length - _characters.count];

        }else if (text.length < _characters.count) {
            [self removeLabel:_characters.count - text.length];

        }
        self.currentX = 0;
        [_characters removeAllObjects];
        for (int i = 0; i < _text.length; i++) {
            double a = (arc4random() % 50) / 100.00;
            NSString *subStr = [_text substringWithRange:NSMakeRange(i, 1)];
            [_characters addObject:subStr];
            __block UILabel *label = (UILabel *)[self viewWithTag:100 + i];
            CGSize size = [subStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 50)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:40]}
                                               context:0].size;
            CGRect newFrame = label.frame;
            newFrame.size = size;
            newFrame.origin.x = self.currentX;
            label.frame = newFrame;
            self.currentX = label.frame.origin.x + label.frame.size.width;
            if ([label.text isEqualToString:subStr]) {
                continue;
            }
            [self showAnimationWithDuration:0.5 later:a label:label complictionBlock:^{
                label.text = subStr;
            }];
        }
    }
}

- (void)addNewLabel:(NSInteger)count
{
    for (int i = 0; i < count; i ++) {
    UILabel *label = self.subviews.lastObject;
    NSInteger tag = label.tag;
    tag += 1;
    UILabel *newlabel = [[UILabel alloc]initWithFrame:CGRectMake(self.currentX, 0, 30, 30)];
    newlabel.font = [UIFont systemFontOfSize:40];
    newlabel.text = @"";
    newlabel.tag = tag;
    [self addSubview:newlabel];
    }
}

- (void)removeLabel:(NSInteger)count
{
    for (int i = 0; i < count; i ++) {
        UILabel *label = self.subviews.lastObject;
        [label removeFromSuperview];
    }
}


- (void)showAnimationWithDuration:(double)duration
                            later:(double)later
                            label:(UILabel *)label
                 complictionBlock:(void(^)())block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(later * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:duration/4 animations:^{
            CATransform3D transForm = label.layer.transform;
            label.layer.transform = CATransform3DRotate(transForm, M_PI_2, 1, 0, 0);
        } completion:^(BOOL finished) {
            if (finished) {
                if (block) {
                    block();
                }
                [UIView animateWithDuration:duration*3/4 animations:^{
                    CATransform3D transForm = label.layer.transform;
                    label.layer.transform = CATransform3DRotate(transForm, M_PI_2*3, 1, 0, 0);
                } completion:^(BOOL finished) {
                }];
            }
        }];
    });
   }



@end

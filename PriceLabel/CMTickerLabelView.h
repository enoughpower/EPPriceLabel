//
//  CMTickerLabelView.h
//  GuiJinShu
//
//  Created by LRF on 16/6/12.
//  Copyright © 2016年 CaiMao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum{
    CMTickerLabelScrollDirectionUp,
    CMTickerLabelScrollDirectionDown
}CMTickerLabelScrollDirection;

@interface CMTickerLabelView : UIView

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;

/*
 Default ADTickerLabelScrollDirectionUp
 */
@property (nonatomic, assign) CMTickerLabelScrollDirection scrollDirection;

/*
 Default nil
 */
@property (nonatomic, strong) UIColor *shadowColor;

/*
 Default CGSizeMake(0, 0)
 */
@property (nonatomic, assign) CGSize shadowOffset;

/*
 Default NSTextAlignmentLeft
 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/*
 Default 1.0
 */
@property (nonatomic, assign) NSTimeInterval changeTextAnimationDuration;

@property (nonatomic, copy) NSString *text;

-(void)setText:(NSString *)text animated:(BOOL)animated;

@end

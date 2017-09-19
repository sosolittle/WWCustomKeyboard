//
//  WWCustomKeyboardView.h
//  WWCustomKeyboard
//
//  Created by Carbon on 2017/9/16.
//  Copyright © 2017年 Carbon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WWCustomKeyboardView;
@protocol WWCustomKeyboardViewDelegate <NSObject>
- (void)ww_customKeyboardViewSureDone:(WWCustomKeyboardView *)keyboardView;
@end

@interface WWCustomKeyboardView : UIView
@property (nonatomic ,weak) id<WWCustomKeyboardViewDelegate> delegate;
- (instancetype)initWithSureBtnTintColor:(UIColor *)tintColor;
@end

//
//  WWCustomKeyboardView.m
//  WWCustomKeyboard
//
//  Created by Carbon on 2017/9/16.
//  Copyright © 2017年 Carbon. All rights reserved.
//

#import "WWCustomKeyboardView.h"

#define ww_ScreenWidth          [UIScreen mainScreen].bounds.size.width
#define ww_ScreenhHeight        [UIScreen mainScreen].bounds.size.height
#define ww_Scale                [UIScreen mainScreen].scale
#define ww_CustomRGB(r,g,b,a)   [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]

#pragma mark -- static global function
static CGRect ww_get_frame() {
    CGFloat width = MIN(ww_ScreenWidth, ww_ScreenhHeight);
    CGFloat height = (width*0.32)*2.0;
    return CGRectMake(0, 0, width, height);
}

static UIImage *ww_image(UIColor *color, CGSize size) {
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

static UIImage *ww_delete_icon() {
    CGSize size = CGSizeMake(27*ww_Scale, 20*ww_Scale);
    const CGFloat lineWidth = 1.0f*ww_Scale;
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(8.5*ww_Scale, 19.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(23.15*ww_Scale, 19.5*ww_Scale) controlPoint1:CGPointMake(11.02*ww_Scale, 19.5*ww_Scale) controlPoint2:CGPointMake(20.5*ww_Scale, 19.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(26.5*ww_Scale, 15.5*ww_Scale) controlPoint1:CGPointMake(25.66*ww_Scale, 19.5*ww_Scale) controlPoint2:CGPointMake(26.5*ww_Scale, 17.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(26.5*ww_Scale, 4.5*ww_Scale) controlPoint1:CGPointMake(26.5*ww_Scale, 13.5*ww_Scale) controlPoint2:CGPointMake(26.6*ww_Scale, 7.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(23.15*ww_Scale, 0.5*ww_Scale) controlPoint1:CGPointMake(26.5*ww_Scale, 1.5*ww_Scale) controlPoint2:CGPointMake(24.82*ww_Scale, 0.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(8.5*ww_Scale, 0.5*ww_Scale) controlPoint1:CGPointMake(21.47*ww_Scale, 0.5*ww_Scale) controlPoint2:CGPointMake(11.02*ww_Scale, 0.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(0.5*ww_Scale, 9.5*ww_Scale) controlPoint1:CGPointMake(5.5*ww_Scale, 0.5*ww_Scale) controlPoint2:CGPointMake(0.5*ww_Scale, 9.5*ww_Scale)];
    [bezierPath addCurveToPoint:CGPointMake(8.5*ww_Scale, 19.8*ww_Scale) controlPoint1:CGPointMake(0.5*ww_Scale, 9.5*ww_Scale) controlPoint2:CGPointMake(5.5*ww_Scale, 19.5*ww_Scale)];
    [bezierPath closePath];
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineJoinStyle = kCGLineJoinRound;
    bezierPath.lineWidth = lineWidth;
    [[UIColor blackColor] setStroke];
    [bezierPath stroke];
    
    UIBezierPath *bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint:CGPointMake(19.5*ww_Scale, 6.5*ww_Scale)];
    [bezier2Path addLineToPoint:CGPointMake(12.5*ww_Scale, 13.5*ww_Scale)];
    [bezier2Path closePath];
    bezier2Path.lineCapStyle = kCGLineCapRound;
    bezier2Path.lineWidth = lineWidth;
    [[UIColor blackColor] setStroke];
    [bezier2Path stroke];
    
    UIBezierPath *bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint:CGPointMake(12.5*ww_Scale, 6.5*ww_Scale)];
    [bezier3Path addLineToPoint:CGPointMake(19.5*ww_Scale, 13.5*ww_Scale)];
    [bezier3Path closePath];
    bezier3Path.lineCapStyle = kCGLineCapRound;
    bezier3Path.lineWidth = lineWidth;
    [[UIColor blackColor] setStroke];
    [bezier3Path stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:image.CGImage scale:ww_Scale orientation:UIImageOrientationUp];
}

static UIImage *ww_keyboard_icon() {
    CGSize size = CGSizeMake(38*ww_Scale, 28*ww_Scale);
    const CGFloat lineWidth = 2.0*ww_Scale;
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(1*ww_Scale, 1*ww_Scale, 36*ww_Scale, 21*ww_Scale)];
    [[UIColor blackColor] setStroke];
    rectanglePath.lineWidth = lineWidth;
    [rectanglePath stroke];
    
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(21.71*ww_Scale, 25*ww_Scale)];
    [trianglePath addLineToPoint:CGPointMake(24*ww_Scale, 25*ww_Scale)];
    [trianglePath addLineToPoint:CGPointMake(20*ww_Scale, 28*ww_Scale)];
    [trianglePath addLineToPoint:CGPointMake(16*ww_Scale, 25*ww_Scale)];
    [trianglePath addLineToPoint:CGPointMake(21.71*ww_Scale, 25*ww_Scale)];
    [trianglePath closePath];
    [[UIColor blackColor] setFill];
    [trianglePath fill];
    
    UIBezierPath *rectangle2Path = [UIBezierPath bezierPathWithRect:CGRectMake(5*ww_Scale, 5*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle2Path fill];
    
    UIBezierPath *rectangle3Path = [UIBezierPath bezierPathWithRect:CGRectMake(10*ww_Scale, 5*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle3Path fill];
    
    UIBezierPath *rectangle4Path = [UIBezierPath bezierPathWithRect:CGRectMake(15*ww_Scale, 5*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle4Path fill];
    
    UIBezierPath *rectangle5Path = [UIBezierPath bezierPathWithRect:CGRectMake(20*ww_Scale, 5*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle5Path fill];
    
    UIBezierPath *rectangle6Path = [UIBezierPath bezierPathWithRect:CGRectMake(25*ww_Scale, 5*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle6Path fill];
    
    UIBezierPath *rectangle7Path = [UIBezierPath bezierPathWithRect:CGRectMake(30*ww_Scale, 5*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle7Path fill];
    
    UIBezierPath *rectangle8Path = [UIBezierPath bezierPathWithRect:CGRectMake(7*ww_Scale, 10*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle8Path fill];
    
    UIBezierPath *rectangle9Path = [UIBezierPath bezierPathWithRect:CGRectMake(12*ww_Scale, 10*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle9Path fill];
    
    UIBezierPath *rectangle10Path = [UIBezierPath bezierPathWithRect:CGRectMake(17*ww_Scale, 10*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle10Path fill];
    
    UIBezierPath *rectangle11Path = [UIBezierPath bezierPathWithRect:CGRectMake(22*ww_Scale, 10*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle11Path fill];
    
    UIBezierPath *rectangle12Path = [UIBezierPath bezierPathWithRect:CGRectMake(27*ww_Scale, 10*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle12Path fill];
    
    UIBezierPath *rectangle13Path = [UIBezierPath bezierPathWithRect:CGRectMake(6*ww_Scale, 15*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle13Path fill];
    
    UIBezierPath *rectangle14Path = [UIBezierPath bezierPathWithRect:CGRectMake(29*ww_Scale, 15*ww_Scale, 3*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle14Path fill];
    
    UIBezierPath *rectangle15Path = [UIBezierPath bezierPathWithRect:CGRectMake(11*ww_Scale, 15*ww_Scale, 16*ww_Scale, 3*ww_Scale)];
    [[UIColor blackColor] setFill];
    [rectangle15Path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:image.CGImage scale:ww_Scale orientation:UIImageOrientationUp];
}
#pragma mark -- WWCustomKeyboardItem
@interface WWCustomKeyboardItem : UIButton

@property (nonatomic ,assign) NSInteger   ww_IndexTag;
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

@implementation WWCustomKeyboardItem

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:ww_image(backgroundColor, CGSizeMake(1, 1)) forState:state];
}

@end

#pragma mark -- WWFindFirstResponder

@interface UIView (WWFindFirstResponder)

+ (UIView *)ww_firstResponder;

@end

@implementation UIView (WWFindFirstResponder)

+ (UIView *)ww_firstResponder {
    return [[[UIApplication sharedApplication] keyWindow] ww_findFirstResponder];
}

- (UIView *)ww_findFirstResponder {
    if ([self isFirstResponder] == YES) return self;
    for (UIView *view in self.subviews) {
        UIView *responder = [view ww_findFirstResponder];
        if (responder != nil) return responder;
    }
    return nil;
}

@end

#pragma mark -- WWCustomKeyboardView
@interface WWCustomKeyboardView ()

@property (nonatomic ,strong) UIColor                                *ww_TintColor;
@property (nonatomic ,strong) NSMutableArray<WWCustomKeyboardItem *> *ww_ItemViewsArr;
@property (nonatomic ,strong) NSTimer                                *ww_deleteTimer;
@property (nonatomic ,assign) NSInteger                              ww_deleteIndex;
@property (nonatomic ,weak)   UIView<UIKeyInput>                     *ww_firstResponder;

@end

@implementation WWCustomKeyboardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:ww_get_frame()]) {
        [self ww_setupUI];
    }
    return self;
}

- (instancetype)initWithSureBtnTintColor:(UIColor *)tintColor {
    if (self = [super initWithFrame:ww_get_frame()]) {
        self.ww_TintColor = tintColor;
        [self ww_setupUI];
    }
    return self;
}

#pragma mark -- private
- (void)ww_setupUI {
    self.backgroundColor = ww_CustomRGB(204, 204, 204, 1.0);
    self.ww_TintColor = self.ww_TintColor ? : ww_CustomRGB(0, 170, 238, 1.0);
    self.ww_ItemViewsArr = [[NSMutableArray alloc] init];
    WWCustomKeyboardItem *firstItem = nil;
    for (NSInteger i = 0; i < 14; i++) {
        WWCustomKeyboardItem *item = [[WWCustomKeyboardItem alloc] init];
        [self ww_setContentWithItem:item index:i];
        [self addSubview:item];
        if (i == 0) {
            firstItem = item;
        } else {
            [self.ww_ItemViewsArr addObject:item];
        }
    }
    [self.ww_ItemViewsArr insertObject:firstItem atIndex:10];
}

- (void)ww_setContentWithItem:(WWCustomKeyboardItem *)item index:(NSInteger)index {
    item.ww_IndexTag = index;
    switch (index) {
        case 10: {
            [item setTitle:@"." forState:UIControlStateNormal];
        }
            break;
        case 11: {
            [item setImage:ww_keyboard_icon() forState:UIControlStateNormal];
        }
            break;
        case 12: {//删除
            [item setImage:ww_delete_icon() forState:UIControlStateNormal];
            UILongPressGestureRecognizer *pressTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(ww_deleteItemLongPress:)];
            [item addGestureRecognizer:pressTap];
        }
            break;
        case 13: {//确定
            [item setTitle:@"确定" forState:UIControlStateNormal];
            [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [item setBackgroundColor:self.ww_TintColor forState:UIControlStateNormal];
            [item setBackgroundColor:[self ww_highlightColor:self.ww_TintColor] forState:UIControlStateHighlighted];
            [item addTarget:self action:@selector(ww_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
            return;
            
        default: {
            [item setTitle:[NSString stringWithFormat:@"%ld",(long)index] forState:UIControlStateNormal];
            [item setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }
            break;
    }
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [item.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:25]];
    [item setBackgroundColor:ww_CustomRGB(250, 250, 250, 1.0) forState:UIControlStateNormal];
    [item setBackgroundColor:ww_CustomRGB(230, 230, 230, 1.0) forState:UIControlStateHighlighted];
    [item addTarget:self action:@selector(ww_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)ww_buttonClick:(WWCustomKeyboardItem *)item {
    if (self.ww_firstResponder == nil || [self.ww_firstResponder isFirstResponder] == NO) {
        self.ww_firstResponder = (UIView<UIKeyInput> *)[UIView ww_firstResponder];
        if (self.ww_firstResponder == nil) return;
        if ([self.ww_firstResponder conformsToProtocol:@protocol(UIKeyInput)] == NO) return;
    }
    [self ww_playClickAudio];
    [self ww_handelInputContentWithIndex:item.ww_IndexTag];
}

- (void)ww_handelInputContentWithIndex:(NSUInteger)index {
    switch (index) {
        case 10: {
            [self ww_clickedDot];
        }
            break;
            
        case 11: {
            [self ww_clickedKeyboard];
        }
            break;
            
        case 12: {
            [self ww_clickedDelete];
        }
            break;
            
        case 13: {
            [self ww_clickedSure];
        }
            break;
            
        default: {
            [self ww_clickedDecimalNumber:index];
        }
            break;
    }
}

- (void)ww_clickedDot {
    [self ww_insertContentText:@"."];
}

- (void)ww_clickedKeyboard {
    [self.ww_firstResponder resignFirstResponder];
}

- (void)ww_clickedDelete {
    if ([self.ww_firstResponder hasText] == YES) {
        [self.ww_firstResponder deleteBackward];
    }
}

- (void)ww_clickedSure {
    [self.ww_firstResponder resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(ww_customKeyboardViewSureDone:)]) {
        [self.delegate ww_customKeyboardViewSureDone:self];
    }
}

- (void)ww_clickedDecimalNumber:(NSInteger)number {
    [self ww_insertContentText:[NSString stringWithFormat:@"%ld",(long)number]];
}

- (void)ww_insertContentText:(NSString *)text {
    if ([self.ww_firstResponder isKindOfClass:[UITextField class] ] == YES) {
        id<UITextFieldDelegate> delegate = ((UITextField *)self.ww_firstResponder).delegate;
        if (delegate && [delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            NSRange range = [self ww_selectedRangeInInputView:(UITextField *)self.ww_firstResponder];
            if ([delegate textField:(UITextField *)self.ww_firstResponder shouldChangeCharactersInRange:range replacementString:text]) {
                [self.ww_firstResponder insertText:text];
            }
        } else {
            [self.ww_firstResponder insertText:text];
        }
    } else if ([self.ww_firstResponder isKindOfClass:[UITextView class] ]== YES) {
        id<UITextViewDelegate> delegate = ((UITextView *)self.ww_firstResponder).delegate;
        if (delegate && [delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
            NSRange range = [self ww_selectedRangeInInputView:(UITextView *)self.ww_firstResponder];
            if ([delegate textView:(UITextView *)self.ww_firstResponder shouldChangeTextInRange:range replacementText:text]) {
                [self.ww_firstResponder insertText:text];
            }
        } else {
            [self.ww_firstResponder insertText:text];
        }
    } else {
        [self.ww_firstResponder insertText:text];
    }
}

- (NSRange)ww_selectedRangeInInputView:(id<UITextInput>)inputView {
    UITextPosition *textBegin = inputView.beginningOfDocument;
    UITextRange *selectedRange = inputView.selectedTextRange;
    UITextPosition *selectedStart = selectedRange.start;
    UITextPosition *selectedEnd = selectedRange.end;
    const NSInteger location = [inputView offsetFromPosition:textBegin toPosition:selectedStart];
    const NSInteger length = [inputView offsetFromPosition:selectedStart toPosition:selectedEnd];
    return NSMakeRange(location, length);
}

- (void)ww_cleanTimer {
    [self.ww_deleteTimer invalidate];
    self.ww_deleteTimer = nil;
}

- (void)ww_playClickAudio {
    [[ UIDevice currentDevice] playInputClick];
}

- (UIColor *)ww_highlightColor:(UIColor *)color {
    CGFloat h, s, b, a;
    if ([color getHue:&h saturation:&s brightness:&b alpha:&a]) {
        return [UIColor colorWithHue:h saturation:s brightness:(b-0.1f) alpha:a];
    }
    return nil;
}
#pragma mark -- Override
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat startX = 0.0;
    CGFloat startY = 0.0;
    CGFloat widthSpace = 0.5;
    CGFloat heightSpace = 0.5;
    CGFloat width = CGRectGetWidth(self.bounds)/4.0;
    CGFloat height = CGRectGetHeight(self.bounds)/4.0;
    for (NSInteger i = 0; i < self.ww_ItemViewsArr.count; i++) {
        NSInteger row = i/3;
        NSInteger col = i%3;
        WWCustomKeyboardItem *item = self.ww_ItemViewsArr[i];
        if (i == 12) {//删除
            self.ww_deleteIndex = i;
            item.frame = CGRectMake(3*(width+widthSpace)+startX, startY, width, 2*height);
        } else if (i == 13) {//确定
            item.frame = CGRectMake(3*(width+widthSpace)+startX, 2*(height+heightSpace)+startY, width, 2*height);
        } else {
            item.frame = CGRectMake(col*(width+widthSpace)+startX, row*(height+heightSpace)+startY, width, height);
        }
    }
    UIView *topLineV = [[UIView alloc] init];//frame算出来显示始终有问题，先用线代替
    topLineV.backgroundColor = self.backgroundColor;
    topLineV.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 1);
    [self addSubview:topLineV];
}
#pragma mark -- Action

- (void)ww_deleteItemLongPress:(UILongPressGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ww_ItemViewsArr[self.ww_deleteIndex].highlighted = YES;
        });
        self.ww_deleteTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(ww_repeatDeleteItemLongPress) userInfo:nil repeats:YES];
    } else if (recognizer.state == UIGestureRecognizerStateEnded  ||
               recognizer.state == UIGestureRecognizerStateFailed ||
               recognizer.state == UIGestureRecognizerStateCancelled) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ww_ItemViewsArr[self.ww_deleteIndex].highlighted = NO;
        });
        [self ww_cleanTimer];
    }
}

- (void)ww_repeatDeleteItemLongPress {
    [self.ww_ItemViewsArr[self.ww_deleteIndex] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end

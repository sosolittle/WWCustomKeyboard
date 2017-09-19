//
//  ViewController.m
//  WWCustomKeyboard
//
//  Created by Carbon on 2017/9/16.
//  Copyright © 2017年 Carbon. All rights reserved.
//

#import "ViewController.h"
#include "WWCustomKeyboardView.h"
@interface ViewController ()
<UITextFieldDelegate,
WWCustomKeyboardViewDelegate
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *tf = [[UITextField alloc] init];
    tf.delegate = self;
    tf.backgroundColor = [UIColor redColor];
    tf.frame = CGRectMake(10, 80, 300, 40);
    [self.view addSubview:tf];
    WWCustomKeyboardView *inputView = [[WWCustomKeyboardView alloc] init];
//    WWCustomKeyboardView *inputView = [[WWCustomKeyboardView alloc] initWithSureBtnTintColor:[UIColor redColor]];
    inputView.delegate = self;
    tf.inputView = inputView;
    [tf reloadInputViews];
//    [self.view addSubview:inputView];
    
}

- (void)ww_customKeyboardViewSureDone:(WWCustomKeyboardView *)keyboardView {
    NSLog(@"sure");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@",[textField.text stringByReplacingCharactersInRange:range withString:string]);
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

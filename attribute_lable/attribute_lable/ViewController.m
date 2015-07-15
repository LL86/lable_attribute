//
//  ViewController.m
//  attribute_lable
//
//  Created by 史练练 on 15/7/15.
//  Copyright (c) 2015年 LL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *attributeLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    [self testAttribute];

}

- (void)testAttribute{

    _attributeLable = [[UILabel alloc] initWithFrame:CGRectMake(40, 120, 300, 50)];
    _attributeLable.backgroundColor = [UIColor whiteColor];
    _attributeLable.numberOfLines = 0;

    NSString *redText = @"red text";
    NSString *greenText = @"green text";
    NSString *purpleBoldText = @"purple bold text";

    NSString *text = [NSString stringWithFormat:@"Here are %@, %@ and %@",
                      redText,
                      greenText,
                      purpleBoldText];

    // If attributed text is supported (iOS6+)
    if ([self.attributeLable respondsToSelector:@selector(setAttributedText:)]) {

        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName: self.attributeLable.textColor,
                                  NSFontAttributeName: self.attributeLable.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:text
                                               attributes:attribs];

        // Red text attributes
        UIColor *redColor = [UIColor redColor];
        NSRange redTextRange = [text rangeOfString:redText];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:redColor}
                                range:redTextRange];

        // Green text attributes
        UIColor *greenColor = [UIColor greenColor];
        NSRange greenTextRange = [text rangeOfString:greenText];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:greenColor}
                                range:greenTextRange];

        // Purple and bold text attributes
        UIColor *purpleColor = [UIColor purpleColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize:self.attributeLable.font.pointSize];
        NSRange purpleBoldTextRange = [text rangeOfString:purpleBoldText];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:purpleColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.attributeLable.attributedText = attributedText;
    }

    [self.view addSubview:_attributeLable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

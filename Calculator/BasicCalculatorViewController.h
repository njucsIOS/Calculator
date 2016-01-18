//
//  BasicCalculatorViewController.h
//  Calculator
//
//  Created by Apple on 16/1/18.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyStack.h"

@interface BasicCalculatorViewController : UIViewController<UITextFieldDelegate>
{
    NSMutableString *inputString_;
    NSString  *operatorStr_;
    NSMutableString *expression_;
}

@property (weak, nonatomic) IBOutlet UIButton *caculateBtn;
@property (weak, nonatomic) IBOutlet UIButton *substractionBtn;
@property (weak, nonatomic) IBOutlet UIButton *additionBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *divisionBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;

@property (weak, nonatomic) IBOutlet UIButton *mutiplicationBtn;

@property (weak, nonatomic) IBOutlet UIButton *dotBtn;
@property (weak, nonatomic) IBOutlet UIButton *ZeroBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIButton *fiveBtn;
@property (weak, nonatomic) IBOutlet UIButton *sixBtn;
@property (weak, nonatomic) IBOutlet UIButton *sevenBtn;
@property (weak, nonatomic) IBOutlet UIButton *eightBtn;
@property (weak, nonatomic) IBOutlet UIButton *nineBtn;

@property (weak, nonatomic) IBOutlet UILabel *finalExpressionLabel;

@property (weak, nonatomic) IBOutlet UILabel *inputLabel;


@property MyStack *inputStack_;

@property MyStack *numbersStack_;

@property MyStack *operatorStack_;

-(IBAction)onBtnClick:(id)sender;

-(BOOL)isStackTopOperator:(MyStack *)stack;

-(BOOL)canCaculate:(NSString*)currentOperator compareWith:(NSString*)stackTopOperator;


@end

//
//  BasicCalculatorViewController.m
//  Calculator
//
//  Created by Apple on 16/1/18.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "BasicCalculatorViewController.h"

@interface BasicCalculatorViewController ()

@end

@implementation BasicCalculatorViewController

@synthesize inputLabel;
@synthesize finalExpressionLabel;

@synthesize caculateBtn;
@synthesize clearBtn;
@synthesize deleteBtn;

@synthesize additionBtn;
@synthesize substractionBtn;
@synthesize mutiplicationBtn;
@synthesize divisionBtn;

@synthesize dotBtn;
@synthesize ZeroBtn;
@synthesize oneBtn;
@synthesize twoBtn;
@synthesize threeBtn;
@synthesize fourBtn;
@synthesize fiveBtn;
@synthesize sixBtn;
@synthesize sevenBtn;
@synthesize eightBtn;
@synthesize nineBtn;

@synthesize inputStack_;
@synthesize numbersStack_;
@synthesize operatorStack_;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    operatorStr_ = @"+-*/";
    expression_ = [NSMutableString stringWithCapacity:30];
    inputString_ = [NSMutableString stringWithCapacity:30];
    inputStack_ = [[MyStack alloc]init];
    numbersStack_ = [[MyStack alloc]init];
    operatorStack_ = [[MyStack alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)isStackTopOperator:(MyStack *)stack
{
    NSString *topStr = [NSString stringWithString:[stack peek]];
    NSRange childRange = [operatorStr_ rangeOfString:topStr];
    
    bool isOperator = (childRange.location != NSNotFound);

    return isOperator;
}

- (void)pushOperator:(NSString *)btnText//入栈－－－－操作符
{
    //如果已经输入了数字，先将数字压入栈中
    if (inputString_.length>0) {
        [inputStack_ push:inputString_];
    }
    
    if (inputStack_.count>0) {
        bool isOperator=[self isStackTopOperator:inputStack_];
        if (isOperator) {
            [inputStack_ pop];
        }
    }
    [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
    [inputStack_ push:btnText];
}

-(BOOL)canCaculate:(NSString *)currentOperator compareWith:(NSString *)stackTopOperator
{
    if ([currentOperator isEqualToString:@"*"]) {
        if ([stackTopOperator isEqualToString:@"/"]) {
            return NO;
        }
        else{
            return YES;
        }
    }
    if ([currentOperator isEqualToString:@"/"]) {
        if ([stackTopOperator isEqualToString:@"/"]||[stackTopOperator isEqualToString:@"*"]) {
            return NO;
        }
        else{
            return YES;
        }
    }
    if ([currentOperator isEqualToString:@"+"]) {
        if ([stackTopOperator isEqualToString:@"+"]) {
            return YES;
        }
        else{
            return NO;
        }
    }
    if ([currentOperator isEqualToString:@"-"]) {
        if ([stackTopOperator isEqualToString:@"+"]) {
            return YES;
        }
        else{
            return NO;
        }
    }
    return NO;
}

- (void)CaculateNumber
{
    //caculate here
    double number1=[[numbersStack_ pop] doubleValue];
    double number2=[[numbersStack_ pop] doubleValue];
    double resultNumber=0;
    
    NSString *caculateOperator=[operatorStack_ pop];
    if ([caculateOperator isEqualToString:@"+"]) {
        resultNumber=number1+number2;
    }
    else if ([caculateOperator isEqualToString:@"-"]) {
        resultNumber=number1-number2;
    }
    else if ([caculateOperator isEqualToString:@"*"]) {
        resultNumber=number1*number2;
    }
    else if ([caculateOperator isEqualToString:@"/"]) {
        resultNumber=number1/number2;
    }
    NSString *resultStr = [NSString stringWithFormat:@"%.3f",resultNumber];
    [numbersStack_ push:resultStr];
}

//点击计算器按键
-(IBAction)onBtnClick:(id)sender
{
    UIButton *clickedBtn=(UIButton *)sender;
    
    NSString *btnText= clickedBtn.titleLabel.text;//获取计算器按键的内容
    if([btnText isEqualToString:@"+"]){
        if (inputString_.length != 0 || inputStack_.count == 1) {
            [self pushOperator:btnText];
            
        }
    }
    else if([btnText isEqualToString:@"-"]){
      //  if (numbersStack_.count == 0) {
           // NSString *resultStr = [NSString stringWithFormat:@"%.3f",@"0"];
            //[numbersStack_ push:resultStr];
        //    [numbersStack_ push:@"0"];
        //}
        if (inputString_.length == 0 && inputStack_.count == 0) {
            [inputStack_ push:@"0"];
        }
        [self pushOperator:btnText];
    }
    else if([btnText isEqualToString:@"*"]){
        if (inputString_.length != 0 || inputStack_.count == 1) {
            [self pushOperator:btnText];
    
        }
    }
    else if([btnText isEqualToString:@"/"]){

        if (inputString_.length != 0 || inputStack_.count == 1) {
            [self pushOperator:btnText];
            
        }
        
    }
    else if ([btnText isEqualToString:@"="]){
        
        if (inputStack_.count>1) {
            
            bool isOperator=[self isStackTopOperator:inputStack_];
            if (isOperator) {
                if (inputString_.length>0) {
                    [inputStack_ push:inputString_];
                    [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
                    
                    [finalExpressionLabel setText:[inputStack_ getExpression]];
                    //start caculate
                    
                    //pop inputStack_
                    while (inputStack_.count > 0) {
                        
                        if (operatorStack_.count > 0 && numbersStack_.count > 1) {
                            NSString *popStr = [inputStack_ peek];
                            bool istopOperator = [self isStackTopOperator:inputStack_];
                            if (istopOperator) {
                                bool caculateable = [self canCaculate:[operatorStack_ peek] compareWith:popStr];
                                if (caculateable) {
                                    [self CaculateNumber];
                                }
                                else{
                                    NSString *cannotCaculate=[inputStack_ pop];
                                    [operatorStack_ push:cannotCaculate];
                                }
                            }
                            else{
                                NSString *popStr= [inputStack_ pop];
                                [numbersStack_ push:popStr];
                                //inputStack used up
                                if (inputStack_.count == 0) {
                                    while (numbersStack_.count>1) {
                                        [self CaculateNumber];
                                    }
                                }
                            }
                        }
                        else{
                            bool istopOperator=[self isStackTopOperator:inputStack_];
                            if (istopOperator) {
                                NSString *popStr = [inputStack_ pop];
                                [operatorStack_ push:popStr];
                            }
                            else{
                                NSString *popStr = [inputStack_ pop];
                                [numbersStack_ push:popStr];
                            }
                            //inputStack used up
                            if (inputStack_.count == 0) {
                                while (numbersStack_.count > 1) {
                                    [self CaculateNumber];
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        int a = 1+1;
        a = a+a;
    }
    else if([btnText isEqualToString:@"C"]){
        [inputStack_ clear];
        [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
        
    }
    else if([btnText isEqualToString:@"DEL"]){
        
        if (inputString_.length>0) {
            NSRange deleteRange=NSMakeRange(inputString_.length-1, 1);
            [inputString_ deleteCharactersInRange:deleteRange];
        }
//        else {
//            if (inputStack_.count>0) {
//                [inputString_ appendString:[inputStack_ pop]];
//                if (inputString_.length>0) {
//                    NSRange deleteRange=NSMakeRange(inputString_.length-1, 1);
//                    [inputString_ deleteCharactersInRange:deleteRange];
//                }
//                
//            }
//        }
    }
    else if([btnText isEqualToString:@"."]) {
        if (inputStack_.count>0) {
            if (![self isStackTopOperator:inputStack_] && inputString_.length==0) {
                [inputStack_ clear];
            }
        }
        
        if (inputString_.length == 0) {
            [inputString_ appendString:@"0"];
        }
        NSRange childRange= [inputString_ rangeOfString:btnText];
        if (childRange.location==NSNotFound) {
            [inputString_ appendString:btnText];
        }
        
    }
    else if([btnText isEqualToString:@"0"]){
        if (inputStack_.count>0) {
            if (![self isStackTopOperator:inputStack_] && inputString_.length==0) {
                [inputStack_ clear];
            }
        }
        if (inputString_.length == 0 || ![inputString_ isEqualToString:@"0"]) {
            [inputString_ appendString:btnText];
        }
    }
    else {
        if (inputStack_.count>0) {
            if (![self isStackTopOperator:inputStack_] && inputString_.length==0) {
                [inputStack_ clear];
            }
        }
        [inputString_ appendString:btnText];
    }
    
    
    if (expression_.length>0) {
        NSRange expressionRange=NSMakeRange(0, expression_.length);
        [expression_ deleteCharactersInRange:expressionRange];
    }
    
    //一次计算之后－－结果弹出，进入输入栈
    if (numbersStack_.count==1 && inputStack_.count==0 && operatorStack_.count==0) {
        [inputStack_ push:[numbersStack_ pop]];
    }
    
    //表达式改变
    if (inputStack_.count>0) {
        [expression_ appendString:[inputStack_ getExpression]];
    }
    
    
    if (inputString_.length>0) {
        [expression_ appendString:inputString_];
    }
    
    if (![btnText isEqualToString:@"="]) {
        [finalExpressionLabel setText:@""];
    }
    
    [inputLabel setText:expression_];
    
}

@end

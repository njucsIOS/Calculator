//
//  ProgrammerViewController.m
//  Calculator
//
//  Created by Apple on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "ProgrammerViewController.h"

@interface ProgrammerViewController ()

@end

@implementation ProgrammerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    inputString_=[NSMutableString stringWithCapacity:30];
    [_ProFromLabel setText:@"Bin"];
    [_ProToLabel setText:@"Bin"];
    // Do any additional setup after loading the view.
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


- (IBAction)ProFrom:(id)sender {
    chooseFrom = YES;
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
            initWithTitle:@"select the base"
            delegate:self
            cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:nil
            otherButtonTitles:@"Bin",@"Oct",@"Dec",@"Hex",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}

- (IBAction)ProTo:(id)sender {
    chooseFrom = NO;
    UIActionSheet *as = [[UIActionSheet alloc]
            initWithTitle:@"select the base"
            delegate:self
            cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:nil
            otherButtonTitles:@"Bin",@"Oct",@"Dec",@"Hex",nil];
    as.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [as showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if(chooseFrom) {
            [_ProFromLabel setText:@"Bin"];
        }
        else{
            [_ProToLabel setText:@"Bin"];
        }
    } else if (buttonIndex == 1) {
        if(chooseFrom) {
            [_ProFromLabel setText:@"Oct"];
        }
        else{
            [_ProToLabel setText:@"Oct"];
        }
    } else if(buttonIndex == 2) {
        if(chooseFrom) {
            [_ProFromLabel setText:@"Dec"];
        }
        else{
            [_ProToLabel setText:@"Dec"];
        }
    } else if(buttonIndex == 3) {
        if(chooseFrom) {
            [_ProFromLabel setText:@"Hex"];
        }
        else{
            [_ProToLabel setText:@"Hex"];
        }
    }
    if (chooseFrom) {
        [_ProInputLabel setText:@""];
        [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
    }
    [_ProOutputLabel setText:@""];

}

- (int)BinToDec:(NSString *)binNum {
    int result = 0;
    for (int i = (int)binNum.length - 1; i >= 0; i--) {
        if ([binNum characterAtIndex:i] == '1') {
            int n = 1;
            for (int j = i; j < (int)binNum.length - 1; j++) {
                n = n * 2;
            }
            result += n;
        }
    }
    return result;
}

- (int)OctToDec:(NSString *)octNum {
    int result = 0;
    int x = 0;
    for (int i = (int)octNum.length - 1; i >= 0; i--) {
        int n = 1;
        for (int j = i; j < (int)octNum.length - 1; j++) {
            n = n * 8;
        }
        x = [octNum characterAtIndex:i] - '0';
        result += n * x;
    }
    return result;
}

- (int)HexToDec:(NSString *)hexNum {
    int result = 0;
    int x = 0;
    unichar ch;
    for (int i = (int)hexNum.length - 1; i >= 0; i--) {
        ch = [hexNum characterAtIndex:i];
        if (ch >= '0' && ch <= '9') {
            x = ch - '0';
        }
        else {
            x = ch - 'A' + 10;
        }
        int n = 1;
        for (int j = i; j < (int)hexNum.length - 1; j++) {
            n = n * 16;
        }
        result += n * x;
    }
    return result;
}

- (NSString *)DecToBin:(int)num {
    NSString *result = @"";
    for (int i = 0; num > 0; i++) {
        NSString *tempStr;
        if (num % 2 == 0) {
            tempStr = @"0";
        }
        else {
            tempStr = @"1";
        }
        num = num / 2;
        result = [NSString stringWithFormat:@"%@%@",tempStr,result];
    }
    return result;
}

- (NSString *)DecToOct:(int)num {
    NSString *result = @"";
    for (int i = 0; num > 0; i++) {
        int temp = num % 8;
        NSString *tempStr;
        if (temp == 0) {
            tempStr = @"0";
        }
        else if (temp == 1) {
            tempStr = @"1";
        }
        else if (temp == 2) {
            tempStr = @"2";
        }
        else if (temp == 3) {
            tempStr = @"3";
        }
        else if (temp == 4) {
            tempStr = @"4";
        }
        else if (temp == 5) {
            tempStr = @"5";
        }
        else if (temp == 6) {
            tempStr = @"6";
        }
        else {
            tempStr = @"7";
        }
        result = [NSString stringWithFormat:@"%@%@",tempStr,result];
        num = num / 8;
    }
    return result;
}

- (NSString *)DecToHex:(int)num {
    NSString *result = @"";
    for (int i = 0; num > 0; i++) {
        int temp = num % 16;
        NSString *tempStr;
        if (temp == 0) {
            tempStr = @"0";
        }
        else if (temp == 1) {
            tempStr = @"1";
        }
        else if (temp == 2) {
            tempStr = @"2";
        }
        else if (temp == 3) {
            tempStr = @"3";
        }
        else if (temp == 4) {
            tempStr = @"4";
        }
        else if (temp == 5) {
            tempStr = @"5";
        }
        else if (temp == 6) {
            tempStr = @"6";
        }
        else if (temp == 7) {
            tempStr = @"7";
        }
        else if (temp == 8) {
            tempStr = @"8";
        }
        else if (temp == 9) {
            tempStr = @"9";
        }
        else if (temp == 10) {
            tempStr = @"A";
        }
        else if (temp == 11) {
            tempStr = @"B";
        }
        else if (temp == 12) {
            tempStr = @"C";
        }
        else if (temp == 13) {
            tempStr = @"D";
        }
        else if (temp == 14) {
            tempStr = @"E";
        }
        else {
            tempStr = @"F";
        }
        num = num / 16;
        result = [NSString stringWithFormat:@"%@%@",tempStr,result];
    }
    return result;
}

- (IBAction)OnBtnClick:(id)sender {
    UIButton *clickedBtn=(UIButton *)sender;
    
    NSString *btnText= clickedBtn.titleLabel.text;//获取计算器按键的内容
    
    
    if ([btnText isEqualToString:@"="]){
        NSString *fromChosen = _ProFromLabel.text;
        NSString *toChosen = _ProToLabel.text;
        int tempNum;
        if ([fromChosen isEqualToString:@"Bin"]) {
            tempNum = [self BinToDec:inputString_];
        }
        else if ([fromChosen isEqualToString:@"Oct"]) {
            tempNum = [self OctToDec:inputString_];
        }
        else if ([fromChosen isEqualToString:@"Hex"]) {
            tempNum = [self HexToDec:inputString_];
        }
        else {
            tempNum = [inputString_ intValue];
        }
        
        NSString *result;
        
        if ([toChosen isEqualToString:@"Bin"]) {
            result = [self DecToBin:tempNum];
        }
        else if ([toChosen isEqualToString:@"Oct"]) {
            result = [self DecToOct:tempNum];
        }
        else if ([toChosen isEqualToString:@"Hex"]) {
            result = [self DecToHex:tempNum];
        }
        else {
            result = [NSString stringWithFormat:@"%d", tempNum];
        }
        
        [_ProOutputLabel setText:result];
    }
    else if([btnText isEqualToString:@"C"]){
        [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
        
    }
    else if([btnText isEqualToString:@"DEL"]){
        
        if (inputString_.length>0) {
            NSRange deleteRange = NSMakeRange(inputString_.length-1, 1);
            [inputString_ deleteCharactersInRange:deleteRange];
        }
    }
    else if([btnText isEqualToString:@"0"]){
        
        if (inputString_.length > 0) {
            [inputString_ appendString:btnText];
        }
    }
    else {
        NSString *fromChosen = _ProFromLabel.text;
        if ([fromChosen isEqualToString:@"Bin"]) {
            if ([btnText isEqualToString:@"1"]) {
                [inputString_ appendString:btnText];
            }
        }
        else if ([fromChosen isEqualToString:@"Oct"]) {
            if ([btnText isEqualToString:@"1"] || [btnText isEqualToString:@"2"] || [btnText isEqualToString:@"3"]
                || [btnText isEqualToString:@"4"] || [btnText isEqualToString:@"5"] || [btnText isEqualToString:@"6"]
                || [btnText isEqualToString:@"7"]) {
                [inputString_ appendString:btnText];
            }
        }
        else if ([fromChosen isEqualToString:@"Dec"]) {
            if (!([btnText isEqualToString:@"A"] || [btnText isEqualToString:@"B"] || [btnText isEqualToString:@"C"]
                || [btnText isEqualToString:@"D"] || [btnText isEqualToString:@"E"] || [btnText isEqualToString:@"F"])) {
                [inputString_ appendString:btnText];
            }
        }
        else {
            [inputString_ appendString:btnText];
        }
    }
    
    [_ProInputLabel setText:inputString_];
    
    if (![btnText isEqualToString:@"="]) {
        [_ProOutputLabel setText:@""];
    }
    else {
        // [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
    }
    
    
    
}

@end

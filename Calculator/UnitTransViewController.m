//
//  UnitTransViewController.m
//  Calculator
//
//  Created by Apple on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "UnitTransViewController.h"

@interface UnitTransViewController ()

@end

@implementation UnitTransViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    inputString_=[NSMutableString stringWithCapacity:30];
    unit_i = 0;
    unit_jFrom = 0;
    unit_jTo = 0;
    unitRatios[0][0] = 1;        //长度    m->m
    unitRatios[0][1] = 100;      //长度    m->cm
    unitRatios[0][2] = 0.001;    //长度    m->km
    unitRatios[0][3] = 39.4;     //长度    m->in
    unitRatios[0][4] = 0.000621; //长度    m->mile
    unitRatios[1][0] = 1;        //面积    km^2->km^2
    unitRatios[1][1] = 1000000;  //面积    km^2->m^2
    unitRatios[1][2] = 100;      //面积    km^2->ha
    unitRatios[1][3] = 247.1;    //面积    km^2->acre
    unitRatios[1][4] = 10000;    //面积    km^2->are
    unitRatios[2][0] = 1;        //质量    kg->kg
    unitRatios[2][1] = 100;      //质量    kg->g
    unitRatios[2][2] = 0.001;    //质量    kg->t
    unitRatios[2][3] = 2.205;    //质量    kg->lb
    unitRatios[2][4] = 35.274;   //质量    kg->oz
    
    [_FromUnit setText:@"m"];
    [_ToUnit setText:@"m"];
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

- (IBAction)LengthFromSelect:(id)sender {
    chooseFrom = true;
    UIActionSheet *FromActionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"select the FROM unit"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:
                                    @"m(米)", @"cm(厘米)",@"km(千米)",@"in(英寸)",@"mile(英里)",
                                    @"km²(平方千米)", @"m²(平方米)",@"ha(公顷)",@"acre(英亩)",@"are(公亩)",
                                    @"kg(千克)", @"g(克)",@"t(吨)",@"lb(磅)",@"oz(盎司)",nil];
    FromActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [FromActionSheet showInView:self.view];
    
}

- (IBAction)LengthToSelect:(id)sender {
    chooseFrom = false;
    UIActionSheet *ToActionSheet;
    if (unit_i == 0) {
        ToActionSheet = [[UIActionSheet alloc]
                       initWithTitle:@"select the TO unit"
                       delegate:self
                       cancelButtonTitle:@"Cancel"
                       destructiveButtonTitle:nil
                       otherButtonTitles:@"m(米)", @"cm(厘米)",@"km(千米)",@"in(英寸)",@"mile(英里)",nil];
    }
    else if (unit_i == 1) {
        ToActionSheet = [[UIActionSheet alloc]
                       initWithTitle:@"select the TO unit"
                       delegate:self
                       cancelButtonTitle:@"Cancel"
                       destructiveButtonTitle:nil
                       otherButtonTitles:@"km²(平方千米)", @"m²(平方米)",@"ha(公顷)",@"acre(英亩)",@"are(公亩)",nil];
    }
    else {
        ToActionSheet = [[UIActionSheet alloc]
                       initWithTitle:@"select the TO unit"
                       delegate:self
                       cancelButtonTitle:@"Cancel"
                       destructiveButtonTitle:nil
                       otherButtonTitles:@"kg(千克)", @"g(克)",@"t(吨)",@"lb(磅)",@"oz(盎司)",nil];
    }
    ToActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [ToActionSheet showInView:self.view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (chooseFrom) {
        if (buttonIndex == 0) {
            unit_i = 0;
            unit_jFrom = 0;
            [_FromUnit setText:@"m"];
        }
        else if (buttonIndex == 1) {
            unit_i = 0;
            unit_jFrom = 1;
            [_FromUnit setText:@"cm"];
        }
        else if(buttonIndex == 2) {
            unit_i = 0;
            unit_jFrom = 2;
            [_FromUnit setText:@"km"];
        }
        else if(buttonIndex == 3) {
            unit_i = 0;
            unit_jFrom = 3;
            [_FromUnit setText:@"in"];
        }
        else if (buttonIndex == 4) {
            unit_i = 0;
            unit_jFrom = 4;
            [_FromUnit setText:@"mile"];
        }
        else if(buttonIndex == 5) {
            unit_i = 1;
            unit_jFrom = 0;
            [_FromUnit setText:@"km²"];
        }
        else if(buttonIndex == 6) {
            unit_i = 1;
            unit_jFrom = 1;
            [_FromUnit setText:@"m²"];
        }
        else if (buttonIndex == 7) {
            unit_i = 1;
            unit_jFrom = 2;
            [_FromUnit setText:@"ha"];
        }
        else if(buttonIndex == 8) {
            unit_i = 1;
            unit_jFrom = 3;
            [_FromUnit setText:@"acre"];
        }
        else if(buttonIndex == 9) {
            unit_i = 1;
            unit_jFrom = 4;
            [_FromUnit setText:@"are"];
        }
        else if (buttonIndex == 10) {
            unit_i = 2;
            unit_jFrom = 0;
            [_FromUnit setText:@"kg"];
        }
        else if(buttonIndex == 11) {
            unit_i = 2;
            unit_jFrom = 1;
            [_FromUnit setText:@"g"];
        }
        else if(buttonIndex == 12) {
            unit_i = 2;
            unit_jFrom = 2;
            [_FromUnit setText:@"t"];
        }
        else if(buttonIndex == 13) {
            unit_i = 2;
            unit_jFrom = 3;
            [_FromUnit setText:@"lb"];
        }
        else if(buttonIndex == 14) {
            unit_i = 2;
            unit_jFrom = 4;
            [_FromUnit setText:@"oz"];
        }
        [_ToUnit setText:@""];
    }
    else {
        if (buttonIndex == 0) {
            unit_jTo = 0;
            
            if (unit_i == 0) {
                [_ToUnit setText:@"m"];
            }
            else if (unit_i == 1) {
                [_ToUnit setText:@"km²"];
            }
            else {
                [_ToUnit setText:@"kg"];
            }
        }
        else if (buttonIndex == 1) {
            unit_jTo = 1;
            
            if (unit_i == 0) {
                [_ToUnit setText:@"cm"];
            }
            else if (unit_i == 1) {
                [_ToUnit setText:@"m²"];
            }
            else {
                [_ToUnit setText:@"g"];
            }
        }
        else if(buttonIndex == 2) {
            unit_jTo = 2;
            
            if (unit_i == 0) {
                [_ToUnit setText:@"km"];
            }
            else if (unit_i == 1) {
                [_ToUnit setText:@"ha"];
            }
            else {
                [_ToUnit setText:@"t"];
            }
        }
        else if(buttonIndex == 3) {
            unit_jTo = 3;
            
            if (unit_i == 0) {
                [_ToUnit setText:@"in"];
            }
            else if (unit_i == 1) {
                [_ToUnit setText:@"acre"];
            }
            else {
                [_ToUnit setText:@"lb"];
            }
        }
        else if (buttonIndex == 4) {
            unit_jTo = 4;
            
            if (unit_i == 0) {
                [_ToUnit setText:@"mile"];
            }
            else if (unit_i == 1) {
                [_ToUnit setText:@"are"];
            }
            else {
                [_ToUnit setText:@"oz"];
            }
        }
        [_LengthToLabel setText:@""];
    }
}


- (IBAction)OnBtnClick:(id)sender {
    UIButton *clickedBtn=(UIButton *)sender;
    
    NSString *btnText= clickedBtn.titleLabel.text;//获取计算器按键的内容
    
    
    if ([btnText isEqualToString:@"="]){
        float floatString = [inputString_ floatValue];
        float result = floatString / unitRatios[unit_i][unit_jFrom] * unitRatios[unit_i][unit_jTo];
        
        NSString *resultStr = [NSString stringWithFormat:@"%.3f",result];
        [_LengthToLabel setText:resultStr];
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
    else if([btnText isEqualToString:@"."]) {
        
        if (inputString_.length == 0) {
            [inputString_ appendString:@"0"];
        }
        NSRange childRange= [inputString_ rangeOfString:btnText];
        if (childRange.location == NSNotFound) {
            [inputString_ appendString:btnText];
        }
        
    }
    else if([btnText isEqualToString:@"0"]){
        
        if (inputString_.length == 0 || ![inputString_ isEqualToString:@"0"]) {
            [inputString_ appendString:btnText];
        }
    }
    else {
        [inputString_ appendString:btnText];
    }
    
    
    [_LengthFromLabel setText:inputString_];
    
    if (![btnText isEqualToString:@"="]) {
        [_LengthToLabel setText:@""];
    }
    else {
       // [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
    }
}

@end

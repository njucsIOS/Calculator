//
//  LengthTransViewController.m
//  Calculator
//
//  Created by Apple on 16/1/18.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "LengthTransViewController.h"

@interface LengthTransViewController ()

@end

@implementation LengthTransViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    inputString_=[NSMutableString stringWithCapacity:30];
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

- (IBAction)LengthFromSelect:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
            initWithTitle:@"select the length unit"
            delegate:self
            cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:nil
            otherButtonTitles:@"m", @"dm",@"cm",@"mm",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}

- (IBAction)LengthToSelect:(id)sender {
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [_FromUnit setText:@"m"];
    }else if (buttonIndex == 1) {
        [_FromUnit setText:@"dm"];
    }else if(buttonIndex == 2) {
        [_FromUnit setText:@"cm"];
    }else if(buttonIndex == 3) {
        [_FromUnit setText:@"mm"];    }
}

- (IBAction)OnBtnClick:(id)sender {
    UIButton *clickedBtn=(UIButton *)sender;
    NSString *btnText=clickedBtn.titleLabel.text;
    [inputString_ appendString:btnText];
    float floatString = [inputString_ floatValue];
    //printf("%.3f ",floatString);
    NSString *stringFloat = [NSString stringWithFormat:@"%.3f",floatString];
    [_LengthFromLabel setText:stringFloat];
    
}
@end

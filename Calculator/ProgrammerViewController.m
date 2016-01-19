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
    FromOrTo=0;
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

- (IBAction)OnBtnClick:(id)sender {
    
    
    
    
}

- (IBAction)ProFrom:(id)sender {
    FromOrTo=0;
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
    FromOrTo=1;
    UIActionSheet *as = [[UIActionSheet alloc]
            initWithTitle:@"select the base"
            delegate:self
            cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:nil
            otherButtonTitles:@"Bin",@"Oct",@"Dec",@"Hex",nil];
    as.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [as showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        if(FromOrTo==0){
            [_ProFromLabel setText:@"Bin"];
        }
        else{
            [_ProToLabel setText:@"Bin"];
        }
    }else if (buttonIndex == 1) {
        if(FromOrTo==0){
            [_ProFromLabel setText:@"Oct"];
        }
        else{
            [_ProToLabel setText:@"Oct"];
        }
    }else if(buttonIndex == 2) {
        if(FromOrTo==0){
            [_ProFromLabel setText:@"Dec"];
        }
        else{
            [_ProToLabel setText:@"Dec"];
        }
    }else if(buttonIndex == 3) {
        if(FromOrTo==0){
            [_ProFromLabel setText:@"Hex"];
        }
        else{
            [_ProToLabel setText:@"Hex"];
        }
    }
}

@end

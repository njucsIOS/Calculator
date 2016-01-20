//
//  ProgrammerViewController.h
//  Calculator
//
//  Created by Apple on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgrammerViewController : UIViewController<UITextFieldDelegate>{
    BOOL chooseFrom;
    NSMutableString *inputString_;
}
@property (weak, nonatomic) IBOutlet UIButton *Seven;
@property (weak, nonatomic) IBOutlet UIButton *Eight;
@property (weak, nonatomic) IBOutlet UIButton *Nine;
@property (weak, nonatomic) IBOutlet UIButton *Four;
@property (weak, nonatomic) IBOutlet UIButton *Six;
@property (weak, nonatomic) IBOutlet UIButton *One;
@property (weak, nonatomic) IBOutlet UIButton *Two;
@property (weak, nonatomic) IBOutlet UIButton *Three;
@property (weak, nonatomic) IBOutlet UIButton *Zero;
@property (weak, nonatomic) IBOutlet UIButton *Equal;
@property (weak, nonatomic) IBOutlet UIButton *Clear;
@property (weak, nonatomic) IBOutlet UIButton *Five;
@property (weak, nonatomic) IBOutlet UIButton *Delete;
@property (weak, nonatomic) IBOutlet UIButton *AButton;
@property (weak, nonatomic) IBOutlet UIButton *BButton;
@property (weak, nonatomic) IBOutlet UIButton *EButton;
@property (weak, nonatomic) IBOutlet UIButton *CButton;
@property (weak, nonatomic) IBOutlet UIButton *DButton;
@property (weak, nonatomic) IBOutlet UILabel *ProFromLabel;
@property (weak, nonatomic) IBOutlet UILabel *ProToLabel;
@property (weak, nonatomic) IBOutlet UILabel *ProInputLabel;
@property (weak, nonatomic) IBOutlet UILabel *ProOutputLabel;
- (IBAction)OnBtnClick:(id)sender;

- (IBAction)ProFrom:(id)sender;
- (IBAction)ProTo:(id)sender;

- (int)BinToDec:(NSString *)binNum;
- (int)OctToDec:(NSString *)octNum;
- (int)HexToDec:(NSString *)hexNum;

- (NSString *)DecToBin:(int)num;
- (NSString *)DecToOct:(int)num;
- (NSString *)DecToHex:(int)num;

@end

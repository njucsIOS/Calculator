//
//  UnitTransViewController.h
//  Calculator
//
//  Created by Apple on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnitTransViewController : UIViewController<UITextFieldDelegate>{
    NSMutableString *inputString_;
    double unitRatios[3][5];
    int unit_i, unit_jFrom, unit_jTo;
    BOOL chooseFrom;
}

- (IBAction)LengthFromSelect:(id)sender;
- (IBAction)LengthToSelect:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *LengthToLabel;
@property (weak, nonatomic) IBOutlet UILabel *LengthFromLabel;

@property (weak, nonatomic) IBOutlet UIButton *Zero;
@property (weak, nonatomic) IBOutlet UIButton *One;
@property (weak, nonatomic) IBOutlet UIButton *Two;
@property (weak, nonatomic) IBOutlet UIButton *Three;
@property (weak, nonatomic) IBOutlet UIButton *Four;
@property (weak, nonatomic) IBOutlet UIButton *Five;
@property (weak, nonatomic) IBOutlet UIButton *Six;
@property (weak, nonatomic) IBOutlet UIButton *Seven;
@property (weak, nonatomic) IBOutlet UIButton *Eight;
@property (weak, nonatomic) IBOutlet UIButton *Nine;
@property (weak, nonatomic) IBOutlet UIButton *Dot;
@property (weak, nonatomic) IBOutlet UIButton *Clear;
@property (weak, nonatomic) IBOutlet UIButton *Equal;
@property (weak, nonatomic) IBOutlet UIButton *Delete;

@property (weak, nonatomic) IBOutlet UILabel *FromUnit;
@property (weak, nonatomic) IBOutlet UILabel *ToUnit;

- (IBAction)OnBtnClick:(id)sender;


@end

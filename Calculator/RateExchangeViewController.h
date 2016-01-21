//
//  RateExchangeViewController.h
//  Calculator
//
//  Created by Apple on 16/1/21.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RateExchangeViewController : UIViewController<UITextFieldDelegate>{
    NSMutableString *inputString_;
    BOOL chooseFrom;
}

- (IBAction)FromSelect:(id)sender;
- (IBAction)ToSelect:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *ToAmount;
@property (weak, nonatomic) IBOutlet UILabel *FromAmount;

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

@property (weak, nonatomic) IBOutlet UILabel *FromContent;
@property (weak, nonatomic) IBOutlet UILabel *ToContent;

- (IBAction)OnBtnClick:(id)sender;


@end

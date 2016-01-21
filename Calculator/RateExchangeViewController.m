//
//  RateExchangeViewController.m
//  Calculator
//
//  Created by Apple on 16/1/21.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "RateExchangeViewController.h"

@interface RateExchangeViewController ()

@end

@implementation RateExchangeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    inputString_=[NSMutableString stringWithCapacity:30];
    
    [_FromContent setText:@"CNY"];
    [_ToContent setText:@"CNY"];
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

- (IBAction)FromSelect:(id)sender {
    chooseFrom = true;
    UIActionSheet *FromActionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"select the FROM currency"
                                      delegate:self
                                      cancelButtonTitle:@"Cancel"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:
                                      @"CNY(人民币)", @"AUD(澳大利亚)",@"CAD(加拿大元)",@"EUR(欧元)",@"GBP(英镑)",@"HKD(港币)",
                                      @"JPY(日元)",@"KRW(韩元)",@"RUB(俄罗斯卢布)",@"THB(泰铢)",@"USD(美元)", nil];
    FromActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [FromActionSheet showInView:self.view];
    
}

- (IBAction)ToSelect:(id)sender {
    chooseFrom = false;
    UIActionSheet *ToActionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"select the FROM currency"
                                      delegate:self
                                      cancelButtonTitle:@"Cancel"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:
                                      @"CNY(人民币)", @"AUD(澳大利亚)",@"CAD(加拿大元)",@"EUR(欧元)",@"GBP(英镑)",@"HKD(港币)",
                                      @"JPY(日元)",@"KRW(韩元)",@"RUB(俄罗斯卢布)",@"THB(泰铢)",@"USD(美元)", nil];
    ToActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [ToActionSheet showInView:self.view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (chooseFrom) {
        if (buttonIndex == 0) {
            [_FromContent setText:@"CNY"];
        }
        else if (buttonIndex == 1) {
            [_FromContent setText:@"AUD"];
        }
        else if(buttonIndex == 2) {
            [_FromContent setText:@"CAD"];
        }
        else if(buttonIndex == 3) {
            [_FromContent setText:@"EUR"];
        }
        else if (buttonIndex == 4) {
            [_FromContent setText:@"GBP"];
        }
        else if(buttonIndex == 5) {
            [_FromContent setText:@"HKD"];
        }
        else if(buttonIndex == 6) {
            [_FromContent setText:@"JPY"];
        }
        else if (buttonIndex == 7) {
            [_FromContent setText:@"KRW"];
        }
        else if(buttonIndex == 8) {
            [_FromContent setText:@"RUB"];
        }
        else if(buttonIndex == 9) {
            [_FromContent setText:@"THB"];
        }
        else if (buttonIndex == 10) {
            [_FromContent setText:@"USD"];
        }
    }
    else {
        if (buttonIndex == 0) {
            [_ToContent setText:@"CNY"];
        }
        else if (buttonIndex == 1) {
            [_ToContent setText:@"AUD"];
        }
        else if(buttonIndex == 2) {
            [_ToContent setText:@"CAD"];
        }
        else if(buttonIndex == 3) {
            [_ToContent setText:@"EUR"];
        }
        else if (buttonIndex == 4) {
            [_ToContent setText:@"GBP"];
        }
        else if(buttonIndex == 5) {
            [_ToContent setText:@"HKD"];
        }
        else if(buttonIndex == 6) {
            [_ToContent setText:@"JPY"];
        }
        else if (buttonIndex == 7) {
            [_ToContent setText:@"KRW"];
        }
        else if(buttonIndex == 8) {
            [_ToContent setText:@"RUB"];
        }
        else if(buttonIndex == 9) {
            [_ToContent setText:@"THB"];
        }
        else if (buttonIndex == 10) {
            [_ToContent setText:@"USD"];
        }
    }
    [_ToAmount setText:@""];
}


- (IBAction)OnBtnClick:(id)sender {
    UIButton *clickedBtn=(UIButton *)sender;
    
    NSString *btnText= clickedBtn.titleLabel.text;//获取计算器按键的内容
    
    
    if ([btnText isEqualToString:@"="]) {
        
        NSString *fromCurrency = _FromContent.text;
        NSString *toCurrency = _ToContent.text;
        NSString *httpUrl = @"http://apis.baidu.com/apistore/currencyservice/currency";
        NSString *httpArg = [[NSString alloc]initWithFormat: @"fromCurrency=%@&toCurrency=%@&amount=%@", fromCurrency, toCurrency, inputString_];
        NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, httpArg];
        NSURL *url = [NSURL URLWithString: urlStr];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
        [request setHTTPMethod: @"GET"];
        [request addValue: @"5655cecd18bd955dffe50d421c5b30ac" forHTTPHeaderField: @"apikey"];
        
        [NSURLConnection sendAsynchronousRequest: request
                                           queue: [NSOperationQueue mainQueue]
                               completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                                   if (error) {
                                       NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                                       [_ToAmount setText:@"HTTP ERROR"];
                                   } else {
                                       NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                       
                                       NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                       NSLog(@"HttpResponseCode:%ld", responseCode);
                                       NSLog(@"HttpResponseBody %@",responseString);
                                       
                                       id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                       if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                                           NSDictionary *jsonDictionary = (NSDictionary*)jsonObject;
                                           
                                          // NSData *retData = [(NSString *)[jsonDictionary valueForKey:@"retData"] dataUsingEncoding:NSUTF8StringEncoding];
                                           id jsonObjectOfRetData =[jsonDictionary valueForKey:@"retData"];
                                           //[NSJSONSerialization JSONObjectWithData:retData options:NSJSONReadingMutableContainers error:&error];
                                           if ([jsonObjectOfRetData isKindOfClass:[NSDictionary class]]) {
                                               NSDictionary *jsonForRetDataDictionary = (NSDictionary*)jsonObjectOfRetData;
                                               
                                               NSNumber *resultNum = (NSNumber *)[jsonForRetDataDictionary valueForKey:@"convertedamount"];
                                               NSString *resultStr = [NSString stringWithFormat:@"%.3f",[resultNum floatValue]];
                                               [_ToAmount setText:resultStr];
                                           }
                                           else {
                                               [_ToAmount setText:@"JSON ERROR"];
                                           }
                                       }
                                       else {
                                           [_ToAmount setText:@"JSON ERROR"];
                                       }
                                   }
                               }];
        
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
    
    
    [_FromAmount setText:inputString_];
    
    if (![btnText isEqualToString:@"="]) {
        [_ToAmount setText:@""];
    }
    else {
        // [inputString_ deleteCharactersInRange:NSMakeRange(0, inputString_.length)];
    }
}

@end

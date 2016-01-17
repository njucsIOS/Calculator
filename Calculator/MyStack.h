//
//  MyStack.h
//  Calculator
//
//  Created by Apple on 16/1/17.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStack : NSObject
{
    NSInteger count_;
    NSMutableArray *array_;
    NSMutableString *allElementString_;
}

@property(atomic,readonly) NSInteger count;
@property(nonatomic,retain) NSMutableString *allElementString;

-(void)push:(id)anObject;
-(NSString *)pop;
-(void)clear;
-(BOOL)contains:(id)anObject;
-(id)peek;

@end

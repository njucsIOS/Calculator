//
//  MyStack.m
//  Calculator
//
//  Created by Apple on 16/1/17.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "MyStack.h"

@implementation MyStack

@synthesize count = count_;
@synthesize allElementString = allElementString_;

-(id)init{
    if (self = [super init]) {
        count_ = 0;
        array_ = [[NSMutableArray alloc]initWithCapacity:30];
        allElementString_ = [[NSMutableString alloc]initWithCapacity:30];
        self.allElementString = allElementString_;
    }
    return self;
}

-(void)push:(NSString*)anObject{
    [array_ addObject:[NSString stringWithString:anObject]];
    [allElementString_ appendString:[NSString stringWithString:anObject]];
    count_ = array_.count;
}

-(NSString *)pop{
    NSString *popItem = @"";
    if (array_.count > 0) {
        popItem = [array_ lastObject];
        [array_ removeLastObject];
        count_ = array_.count;
        if (array_.count > 0) {
            [allElementString_ deleteCharactersInRange:NSMakeRange(0, allElementString_.length)];
            for (int i = 0; i < array_.count; i++) {
                [allElementString_ appendString:array_[i]];
            }
        }
        else{
            [allElementString_ deleteCharactersInRange:NSMakeRange(0, allElementString_.length)];
        }
    }
    return popItem;
}

-(void)clear{
    [array_ removeAllObjects];
    count_ = 0;
    [allElementString_ deleteCharactersInRange:NSMakeRange(0, allElementString_.length)];
}

-(BOOL)contains:anObject{
    return [array_ containsObject:anObject];
}

-(NSString*)peek{
    return [array_ lastObject];
}

@end

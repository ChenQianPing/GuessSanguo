//
//  Question.m
//  GuessSanguo
//
//  Created by ChenQianPing on 16/5/3.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "Question.h"

@implementation Question

// 相当于构造方法(用于NSDictionary字典构造)
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if(self){
        [self setValuesForKeysWithDictionary:dict];
        // 让模型打乱数据
        [self randomOptions];
    }
    return self;
}

// 提供类方法调用initWithDict
+ (instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

// 返回所有题目数组
+ (NSArray *)questions
{
    // arary中是文件中的字典数组
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"questions.plist" ofType:nil]];
    // 初始化一个可以添加的数组为了存储模型数据
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    return arrayM;
}

- (void)randomOptions
{
    // 对options做乱序
    self.options = [self.options sortedArrayUsingComparator:^NSComparisonResult(NSString *str1,NSString *str2){
        // 0或者1的随机数
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        } else
        {
            return [str2 compare:str1];
        }
    }];
    
}


@end

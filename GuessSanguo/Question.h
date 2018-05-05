//
//  Question.h
//  GuessSanguo
//
//  Created by ChenQianPing on 16/5/3.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic,copy) NSString *answer;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)questionWithDict:(NSDictionary *)dict;

// 返回所有题目数组
+ (NSArray *)questions;
// 打乱备选文字的数组
- (void)randomOptions;

@end

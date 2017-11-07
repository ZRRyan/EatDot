//
//  NSString+Extension.h
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)
/**
 *  计算文字尺寸
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 * 利用正则表达式验证邮箱
 */
-(BOOL)isValidateEmail;

//利用正则表达式验证电话号
-(BOOL)isValidateTel;

/**
 * 判断是否为整形
 */
- (BOOL)isPureInt;

/**
 * 判断是否为浮点形：
 */
- (BOOL)isPureFloat;

/** md5字符串加密 */
+(NSString *) md5:(NSString*) str;

/** md5文件加密 */
+(NSString *)file_md5:(NSString*) path;

/**
 *  32位随机数
 *
 *  @return 32随机数
 */
+ (NSString*) uuid;
@end

//
//  UIImage+Extension.h
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/** 切图 */
+ (instancetype)captureWithView:(UIView *)view;

/** 图片处理（拉伸） */
+(UIImage *)resizableImage:(NSString *)image;


/**
 图片压缩
 
 @param maxLength 最大尺寸
 @return 压缩后的图片
 */
- (NSData *)compressImageWithMaxLength: (NSInteger)maxLength;
/**
 模糊

 @param image <#image description#>
 @param blur <#blur description#>
 @return <#return value description#>
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end

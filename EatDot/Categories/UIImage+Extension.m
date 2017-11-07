//
//  UIImage+Extension.m
//  ContractManage
//
//  Created by Ryan on 15/12/31.
//  Copyright © 2015年 monkey. All rights reserved.
//

#import "UIImage+Extension.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Extension)

/** 切图 */
+ (instancetype)captureWithView:(UIView *)view
{
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    // 将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


/** 图片处理（拉伸） */
+(UIImage *)resizableImage:(UIImage *)originImage

{
    
    CGFloat w = originImage.size.width * 0.5;
    
    CGFloat h = originImage.size.width * 0.5;
    
    return [originImage resizableImageWithCapInsets:UIEdgeInsetsMake(w, h, w, h)];
    
}


/**
 对图片按指定尺寸进行重绘
 */
- (UIImage *)drawImageWithSize: (CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}


/**
 通过图片最长边，获得等比例突破尺寸
 */
- (CGSize)scaleWithImageLength:(CGFloat) imageLength {
    CGFloat newWidth = 0;
    CGFloat newHeight = 0;
    CGFloat imgW = self.size.width;
    CGFloat imgH = self.size.height;
    if (imgW > imageLength || imgH > imageLength) {
        
        if (imgW > imgH) {
            newWidth = imageLength;
            newHeight = imageLength * imgH / imgW;
        } else {
            newHeight = imageLength;
            newWidth = imageLength * imgW / imgH;
        }
        return CGSizeMake(newWidth, newHeight);
    } else {
        return self.size;
    }
}


/**
 图片压缩

 @param maxLength 最大尺寸
 @return 压缩后的图片
 */
- (NSData *)compressImageWithMaxLength: (NSInteger)maxLength {
    CGSize newSize = [self scaleWithImageLength:800];
    UIImage *newImage = [self drawImageWithSize:newSize];
    
    CGFloat compress = 1.0;
    NSData *data = UIImageJPEGRepresentation(newImage, compress);
    while (data.length > maxLength && compress > 0.02) {
        compress -= 0.02;
        data = UIImageJPEGRepresentation(newImage, compress);
    }
    
    return data;
}


#pragma mark - 模糊
/**
 模糊

 @param image <#image description#>
 @param blur <#blur description#>
 @return <#return value description#>
 */
+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}


/**
 模糊

 @param image <#image description#>
 @param blur <#blur description#>
 @return <#return value description#>
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象的属性
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    if(pixelBuffer == NULL)
        NSLog(@"No pixelbuffer");
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate( outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    //clean up CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}




@end

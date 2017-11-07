//
//  NSString+AES256.h
//  ContractManage
//
//  Created by Ryan on 16/1/26.
//  Copyright © 2016年 monkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AES256)
/** 加密 */
-(NSString *) aes256_encrypt:(NSString *)key;
/** 解密 */
-(NSString *) aes256_decrypt:(NSString *)key;
@end

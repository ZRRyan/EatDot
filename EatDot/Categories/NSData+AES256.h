//
//  NSData+AES256.h
//  ContractManage
//
//  Created by Ryan on 16/1/26.
//  Copyright © 2016年 monkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)
///** 加密 */
//- (NSData *)aes256_encrypt:(NSString *)key;
///** 解密 */
//- (NSData *)aes256_decrypt:(NSString *)key;

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end

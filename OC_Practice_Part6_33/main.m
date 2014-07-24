//
//  main.m
//  OC_Practice_Part6_33
//
//  Created by Chase Gosingtian on 7/23/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int const NUM_BITS = 64;

NSString* bitString(NSUInteger num);
NSUInteger generateAlternatingBitsOdd();

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSUInteger bit64 = 0;
        
        bit64 = generateAlternatingBitsOdd();
        
        NSLog(@"%@, %lu", bitString(bit64), (unsigned long)bit64);
        
    }
    return 0;
}

NSUInteger generateAlternatingBitsOdd()
{
    NSUInteger num = 0;
    NSUInteger exponent=0;
    for (NSUInteger i = 0; i < NUM_BITS;i++)
    {
        exponent = (double)i*2.0f;
        num += pow(2.0,exponent);
        NSLog(@"%lu",(unsigned long)num);
    }
    return num;
}

//converts an unsigned int into binary as a string
NSString* bitString(NSUInteger num)
{
    NSString *str = @"";
    
    for (NSUInteger i = 0;i < NUM_BITS;i++)
    {
        //prepend 1 to string if (num & 1) is 1, otherwise, 0
        str = [NSString stringWithFormat:@"%@%@",
               num & 1 ? @"1" : @"0", // ternary operator (aka if else)
               str];
        
//        if (i % 8 == 0)
//            str = [NSString stringWithFormat:@"%@ ",str];
        
        num >>= 1;
    }
    
    return str;
}
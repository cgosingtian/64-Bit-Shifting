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
NSUInteger generateAlternatingBitsOddWithShifting();

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSUInteger bit64 = 0;
        
        bit64 = generateAlternatingBitsOddWithShifting();
        
        NSLog(@"A 64-bit integer with alternating bits %@, is %lu.", bitString(bit64), (unsigned long)bit64);
        
    }
    return 0;
}

// HACK: This function can't handle more than 55 bits because
// the pow function returns a double - and doubles have limits.
// Use generateAlternatingBitsOddWithShifting() instead.
NSUInteger generateAlternatingBitsOdd() // done with exponents
{
    NSUInteger num = 0;
    NSUInteger exponent=0;
    for (NSUInteger i = 0; i < NUM_BITS/2;i++)
    {
        exponent = (double)i*2.0;
//        NSLog(@"%lu",(unsigned long)num);
        num += pow(2.0,exponent);
    }
    return num;
}

NSUInteger generateAlternatingBitsOddWithShifting() // done with bit shifting
{
    NSUInteger num = 0;
    for (NSUInteger i = 0; i < NUM_BITS;i++)
    {
//        NSLog(@"%lu",(unsigned long)num);
        if (i % 2 == 0)
        {
            num <<= 2;
            num += 1;
        }
    }
    return num;
    
}

//converts an unsigned int into binary as a string
NSString* bitString(NSUInteger num)
{
    NSString *str = @"";
    
    for (NSUInteger i = 0;i < NUM_BITS;i++)
    {
        if (i % 8 != 0) //add a space every 8th bit
        {
            //prepend 1 to string if (num & 1) is 1, otherwise, 0
            str = [NSString stringWithFormat:@"%@%@",
                   num & 1 ? @"1" : @"0", // ternary operator (aka if else)
                   str];
        }
        else
        {
            str = [NSString stringWithFormat:@"%@ %@",
                   num & 1 ? @"1" : @"0",
                   str];
        }
        
        num >>= 1;
    }
    
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
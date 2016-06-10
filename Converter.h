//
//  Converter.h
//  Optimus Converter
//
//  Created by Favio on 6/10/16.
//  Copyright © 2016 Favio Tejada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Converter : NSObject

-(float) convertArea:(int)fromIndex to:(int) toIndex val:(float) value;

-(float) convertTemperature:(int)fromIndex to:(int) toIndex val:(float) value;

-(float) convertLength:(int)fromIndex to:(int) toIndex val:(float) value;



@end
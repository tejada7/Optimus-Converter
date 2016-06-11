//
//  Converter.m
//  Optimus Converter
//
//  Created by Favio on 6/10/16.
//  Copyright © 2016 Favio Tejada. All rights reserved.
//


#import "Converter.h"

@implementation Converter

// Method that converts a value given its area unit, into its equivalent in another area unit. These units can be kilometers, meters or foot
-(float)convertArea:(int)fromIndex to:(int)toIndex val:(float)value {
    if (value == 0) {
        value = -1;
    } else {
        switch (fromIndex) {
            case 0: // From square kilometers
                if(toIndex == 1) { // To meters
                    value *= 1000000;
                } else if (toIndex == 2) { // To square foot
                    value *= 10763910.42;
                }
                break;
            case 1: // From square meters
                if(toIndex == 0) { // To square kilometers
                    value /= 1000000;
                } else if (toIndex == 2) { // To square food
                    value *= 10.7639;
                }
                break;
            case 2: // From square foot
                if(toIndex == 0) { // To square kilometer
                    value /= 10763910.42;
                } else if (toIndex == 1) { // To square meter
                    value *= 0.092903;
                }
                break;
        }
    }
    return value;
}

// Method that converts a value given its temperature unit, into its equivalent in another temperature unit. These units can be Farenheit, Celsius and Kelvin
-(float)convertTemperature:(int)fromIndex to:(int)toIndex val:(float)value {
    if (value == 0) {
        value = -1;
    } else {
        switch (fromIndex) {
            case 0: // From Celsius
                if(toIndex == 1) { // To Fahrenheit
                    value =	value * 1.8 + 32;
                } else if (toIndex == 2) { // To Kelvin
                    value += 273.15	;
                }
                break;
            case 1: // From Fahrenheit
                if(toIndex == 0) { // To Celsius
                    value = (value - 32) / 1.8;
                } else if (toIndex == 2) { // To Kelvin
                    value = (5 * (value - 32)) / 9 + 273.15;
                }
                break;
            case 2: // From Kelvin
                if(toIndex == 0) { // To Celsius
                    value -= 273.15;
                } else if (toIndex == 1) { // To Fahrenheit
                    value = 1.8 * (value - 273.15) + 32;
                }
                break;
        }
    }
    return value;
}

// Method that converts a value given its length unit, into its equivalent in another length unit. These units can be meters, foot, kilometers and miles
-(float)convertLength:(int)fromIndex to:(int)toIndex val:(float)value {
    if (value == 0) {
        value = -1;
    } else {
        switch (fromIndex) {
            case 0: // From kilometers
                if(toIndex == 1) { // To meters
                    value /= 1000;
                } else if (toIndex == 2) { // To foot
                    value *= 3281;
                } else if (toIndex == 3) { // To miles
                    value *= 0.6214;
                }
                break;
            case 1: // From meters
                if(toIndex == 0) { // To kilometers
                    value *= 1000;
                } else if (toIndex == 2) { // To foot
                    value *= 3.28;
                } else if (toIndex == 3) { // To miles
                    value *= 0.0006214;
                }
                break;
            case 2: // From foot
                if(toIndex == 0) { // To kilometers
                    value /= 3281;
                } else if (toIndex == 1) { // To meters
                    value /= 3.281;
                } else if (toIndex == 3) { // To miles
                    value *= 0.0001894;
                }
                break;
            case 3: // From miles
                if(toIndex == 0) { // To kilometers
                    value *= 1.60934;
                } else if (toIndex == 1) { // To meters
                    value *= 1609.34;
                } else if (toIndex == 2) { // To foot
                    value *= 5280;
                }
                break;
        }
    }
    return value;
}

@end
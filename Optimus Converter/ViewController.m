//
//  ViewController.m
//  Optimus Converter
//
//  Created by Favio on 6/10/16.
//  Copyright © 2016 Favio Tejada. All rights reserved.
//

#import "ViewController.h"
#import "Converter.h"

@interface ViewController ()

@property NSInteger pickerIndex;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Add elements to mutable array
    _measureArea = [[NSMutableArray alloc] init];
    [_measureArea addObject:@"Square km"];
    [_measureArea addObject:@"Square m"];
    [_measureArea addObject:@"Square ft"];
    
    _measureTemperature = [[NSMutableArray alloc] init];
    [_measureTemperature addObject:@"Celsius"];
    [_measureTemperature addObject:@"Farenheit"];
    [_measureTemperature addObject:@"Kelvin"];
    
    _measureLength = [[NSMutableArray alloc] init];
    [_measureLength addObject:@"km"];
    [_measureLength addObject:@"m"];
    [_measureLength addObject:@"ft"];
    [_measureLength addObject:@"mi"];
    
    // New instance of Converter
    itemConverter = [[Converter alloc] init];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Method that returns the number of components or columns in pickerview
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// Method that return the number of elements that mutable arrays have in order to set the number of rows in the pickerview
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if([_tab selectedSegmentIndex] == 0)
        return [_measureArea count];
    else if([_tab selectedSegmentIndex] == 1)
        return [_measureLength count];
    else
        return [_measureTemperature count];
}

// Method that add the content of pickerviews according to the tab selected
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if([_tab selectedSegmentIndex] == 0)
        return [_measureArea objectAtIndex:row];
    else if([_tab selectedSegmentIndex] == 1)
        return [_measureLength objectAtIndex:row];
    else
        return [_measureTemperature objectAtIndex:row];
}

// Method that captures the index and invokes the itemConverter methods
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%ld", (long)row);
    float result = 0;
    //if([_tab selectedSegmentIndex] == 0)
    
    switch ([_tab selectedSegmentIndex]) {
        case 0:
            result = [itemConverter convertArea:(int)[_picker selectedRowInComponent:0] to: (int)[_picker selectedRowInComponent:1] val: [_textFiled.text floatValue]];
            break;
        case 1:
            result = [itemConverter convertLength:(int)[_picker selectedRowInComponent:0] to: (int)[_picker selectedRowInComponent:1] val: [_textFiled.text floatValue]];
            break;
        case 2:
            result = [itemConverter convertTemperature:(int)[_picker selectedRowInComponent:0] to: (int)[_picker selectedRowInComponent:1] val: [_textFiled.text floatValue]];
            break;
            
    }
    NSLog(@"%f", result);
    if (result  == -1) {
        _outputText.textColor = [UIColor redColor];
        _outputText.text = @"Please insert only numbers"; // Print the error into the label
    } else {
        _outputText.textColor = [UIColor blackColor];
        _outputText.text = [NSString stringWithFormat:@"%.03f", result]; // Set the value into the label
    }
}

// Method that reloads components in pickerview when changing the tab bar
- (IBAction)TabEvent:(id)sender {
    [_picker reloadAllComponents];
}

@end


//
//  ViewController.h
//  Optimus Converter
//
//  Created by Favio on 6/10/16.
//  Copyright © 2016 Favio Tejada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Converter.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    Converter *itemConverter;
}
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@property (nonatomic) IBOutlet UIPickerView *picker;

@property NSMutableArray *measureArea;
@property NSMutableArray *measureTemperature;
@property NSMutableArray *measureLength;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tab;
@property (weak, nonatomic) IBOutlet UILabel *outputText;

@end


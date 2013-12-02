//
//  PickerViewController.h
//  Picker
//
//  Created by Gordon Leete on 12/2/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    IBOutlet UIPickerView * pickerView;
    IBOutlet UILabel * label;
    NSMutableArray * data;
}

-(void)saveDefaults;

-(void)loadDefaults;

@end

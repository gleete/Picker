//
//  PickerViewController.m
//  Picker
//
//  Created by Gordon Leete on 12/2/13.
//  Copyright (c) 2013 Gordon Leete. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

- (void)viewDidLoad
{
    // pickerView is going to get its data from this class
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    // pickerView's data will be all of the available fonts on this phone
    // stored in an array

    data  = [[ NSMutableArray   alloc ]  init ];
    for  ( NSString  *familyName  in  [ UIFont   familyNames ]) {
        for  ( NSString  *fontName  in  [ UIFont   fontNamesForFamilyName :familyName] ) {
            [ data   addObject :fontName];
        }
    }
    
    NSLog ( @"data=%@" , data );

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UIPickerViewDelegate methods
- ( NSString  *)pickerView:( UIPickerView  *) pickerView  titleForRow: ( NSInteger )row
forComponent:( NSInteger )component {
    
    // return data for current row
    
    //NSString *curRow =
    //NSLog(@"Current row: %@", curRow);

    
    //NSLog ( @"data for row #%d = %@" ,row,[ data   objectAtIndex :row]);
    return  [ data   objectAtIndex :row];
    
}

//Method to display currently picked item and display in UILabel text
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    label.text = [data objectAtIndex: row];
}


#pragma mark -


#pragma mark UIPickerViewDataSource methods
- ( NSInteger )numberOfComponentsInPickerView:( UIPickerView  *) pickerView {
	// we only have one column
	return   1 ;
}

- ( NSInteger )pickerView:( UIPickerView  *) pickerView  numberOfRowsInComponent:(NSInteger)component {
    // return the length of the array, which will be the total number of rows in the picker.
    
    // not all of these rows are visible, the user will need to scroll down to see them.
    
	return  [ data   count ];
}

#pragma mark -


#pragma mark NSUserDefaults methods
// The user has hit the home button, and the view is going away
// So let's save state
-(void)saveDefaults {
    NSLog(@"Save Defaults...");
    //grab index of currently selected row
    int row = [pickerView selectedRowInComponent:0];
    //access singleton NSUserDefaults instance and store the row
    //we'll retrieve it again later when the app starts up again
    [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"selectedRow"];
    NSLog(@"Storing row: %d",row);
    
}

-(void) loadDefaults {
    NSLog(@"Load Defaults...");
    int row = [[NSUserDefaults standardUserDefaults] integerForKey:@"selectedRow"];
    [pickerView selectRow:row inComponent:0 animated:NO];
    [label setText:[data objectAtIndex:row]];
    [label setFont:[UIFont fontWithName:[data objectAtIndex:row] size:[UIFont labelFontSize]]];
    NSLog(@"Retrieved Row: %d",row);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

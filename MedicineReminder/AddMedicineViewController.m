//
//  AddMedicineViewController.m
//  MedicineReminder
//
//  Created by Admin on 3/11/18.
//  Copyright © 2018 MCC. All rights reserved.
//

#import "AddMedicineViewController.h"

@interface AddMedicineViewController ()

@end

@implementation AddMedicineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)medTypeRegularAction:(UIButton *)sender {
    
    if(_isHourlySelected == YES)
    {
        _medTypeRegular.backgroundColor = UIColor.whiteColor;
        _medTypeHourly.backgroundColor = UIColor.lightGrayColor;
        _isHourlySelected = NO;
    }
}

- (IBAction)medTypeHourlyAction:(UIButton *)sender {
    
    //UIColor *btnColor = _medTypeHourly.backgroundColor;
    
    if(_isHourlySelected == NO)
    {
        _medTypeHourly.backgroundColor = UIColor.whiteColor;
        _medTypeRegular.backgroundColor = UIColor.lightGrayColor;
        _isHourlySelected = YES;
    }
}
- (IBAction)medTimeAction:(UIButton *)sender {
    
}
@end

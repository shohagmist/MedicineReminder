//
//  AddMedicineViewController.m
//  MedicineReminder
//
//  Created by Admin on 3/11/18.
//  Copyright © 2018 MCC. All rights reserved.
//

#import "AddMedicineViewController.h"
#import "ViewController.h"

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

- (IBAction)saveButton:(id)sender {
    
    ViewController *myViewController = [[ViewController alloc]init];
    
    [myViewController.myMutableArray insertObject:@{@"name": @"Napa", @"time": @"8:00"} atIndex:myViewController.myMutableArray.count];
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)medTypeRegularAction:(UIButton *)sender {
    
    if(_isHourlySelected == YES)
    {
        _medTypeRegular.backgroundColor = UIColor.whiteColor;
        _medTypeHourly.backgroundColor = UIColor.lightGrayColor;
        _isHourlySelected = NO;
        
        _morningTime.hidden = NO;
        _noonTime.hidden = NO;
        _nightTime.hidden = NO;
        
        _everyLabel.hidden = YES;
        _hourLabel.hidden = YES;
        _hourInputBox.hidden = YES;

    }
}

- (IBAction)medTypeHourlyAction:(UIButton *)sender {
    
    //UIColor *btnColor = _medTypeHourly.backgroundColor;
    
    if(_isHourlySelected == NO)
    {
        _medTypeHourly.backgroundColor = UIColor.whiteColor;
        _medTypeRegular.backgroundColor = UIColor.lightGrayColor;
        _isHourlySelected = YES;
        
        _morningTime.hidden = YES;
        _noonTime.hidden = YES;
        _nightTime.hidden = YES;
        
        _everyLabel.hidden = NO;
        _hourLabel.hidden = NO;
        _hourInputBox.hidden = NO;
    }
}

- (IBAction)beforeAfterEating:(UIButton *)sender {
    if(sender.tag == 10) //Before Eating Tag = 10
    {
        if(_isBeforeEatingSelected == NO)
        {
            _beforeEating.backgroundColor = UIColor.whiteColor;
            _afterEating.backgroundColor = UIColor.lightGrayColor;
            _isBeforeEatingSelected = YES;
        }
    }
    else //After Eating Tag = 11
    {
        if(_isBeforeEatingSelected == YES)
        {
            _afterEating.backgroundColor = UIColor.whiteColor;
            _beforeEating.backgroundColor = UIColor.lightGrayColor;
            _isBeforeEatingSelected = NO;
        }
    }
}
- (IBAction)medTimeAction:(UIButton *)sender {
    
    if(sender.tag == 1)
    {
        if(_isMorningSelected ==  NO)
        {
            _morningTime.backgroundColor = UIColor.whiteColor;
            _isMorningSelected = YES;
        }
        else
        {
            _morningTime.backgroundColor = UIColor.lightGrayColor;
            _isMorningSelected = NO;

        }
    }
    else if(sender.tag == 2)
    {
        if(_isNoonSelected == NO)
        {
            _noonTime.backgroundColor = UIColor.whiteColor;
            _isNoonSelected = YES;
        }
        else
        {
            _noonTime.backgroundColor = UIColor.lightGrayColor;
            _isNoonSelected = NO;
        }
    }
    else
    {
        if(_isNightSelected ==  NO)
        {
            _nightTime.backgroundColor = UIColor.whiteColor;
            _isNightSelected = YES;
        }
        else
        {
            _nightTime.backgroundColor = UIColor.lightGrayColor;
            _isNightSelected = NO;
            
        }
    }
    
}
@end

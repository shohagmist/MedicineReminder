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

@synthesize tvcdelegate; //Warning of delegate

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
    
    if(_viewController.myMutableArray == nil)
    {
        if(!_isHourlySelected)
        {
            NSMutableArray *temp = [NSMutableArray arrayWithObject:
                                    @{@"name" : _medicineName.text,
                                      @"isRegular" : _isHourlySelected ? @"0" : @"1",
                                      @"quantity" : _quantityField.text,
                                      @"morning" : _isMorningSelected ? @"1" : @"0",
                                      @"noon" : _isNoonSelected ? @"1" : @"0",
                                      @"night" : _isNightSelected ? @"1" : @"0",
                                      @"beforeEating" : _isBeforeEatingSelected ? @"1" : @"0"
                                      }];
            _viewController.myMutableArray = temp;
        }
        else
        {
            NSMutableArray *temp = [NSMutableArray arrayWithObject:
                                    @{@"name" : _medicineName.text,
                                      @"isRegular" : _isHourlySelected ? @"0" : @"1",
                                      @"quantity" : _quantityField.text,
                                      @"beforeEating" : _isBeforeEatingSelected ? @"1" : @"0",
                                      @"hour" : _hourInputBox.text
                                      }];
            _viewController.myMutableArray = temp;
        }
    }
    else
    {
        if(!_isHourlySelected)
        {
            [_viewController.myMutableArray addObject: @{@"name" : _medicineName.text,
                           @"isRegular" : _isHourlySelected ? @"0" : @"1",
                           @"quantity" : _quantityField.text,
                           @"morning" : _isMorningSelected ? @"1" : @"0",
                           @"noon" : _isNoonSelected ? @"1" : @"0",
                           @"night" : _isNightSelected ? @"1" : @"0",
                           @"beforeEating" : _isBeforeEatingSelected ? @"1" : @"0"
                           }];
        }
        else
        {
            [_viewController.myMutableArray addObject:
                        @{@"name" : _medicineName.text,
                          @"isRegular" : _isHourlySelected ? @"0" : @"1",
                          @"quantity" : _quantityField.text,
                          @"beforeEating" : _isBeforeEatingSelected ? @"1" : @"0",
                          @"hour" : _hourInputBox.text
                          }];

        }
    }
    NSLog(@"In Medicine View : %lu",(unsigned long)[_viewController.myMutableArray count]);

    
    [self.tvcdelegate didUpdateData]; //Fire the delegate before dismissing
    
    [self fireNotification];
    
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

- (void) fireNotification
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc]init];
    
    content.title = @"Medicine Reminder";
    content.subtitle = @"Your Health Partner";
    content.body = [@"You will be reminded about " stringByAppendingString:_medicineName.text];
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"MedicineReminder" content:content trigger:trigger];
    [center addNotificationRequest:request withCompletionHandler:nil];
}

- (void) fireNotificationAtSpecificTimeDaily
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:20];
    NSDateComponents *triggerDate = [[NSCalendar currentCalendar]
                                     components: NSCalendarUnitHour + NSCalendarUnitMinute +
                                     NSCalendarUnitSecond fromDate:date];
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerDate repeats:YES];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc]init];
    
    content.title = @"Medicine Reminder";
    content.subtitle = @"Your Health Partner";
    content.body = [@"It is time for " stringByAppendingString:_medicineName.text];
    content.sound = [UNNotificationSound defaultSound];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"MedicineReminder" content:content trigger:trigger];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Something went wrong: %@",error);
        }
    }];
}

@end

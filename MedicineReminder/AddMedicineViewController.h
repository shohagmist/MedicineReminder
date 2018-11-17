//
//  AddMedicineViewController.h
//  MedicineReminder
//
//  Created by Admin on 3/11/18.
//  Copyright © 2018 MCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

@class ViewController;

@protocol TargetViewDelegate <NSObject>
- (void) didUpdateData;
@end


@interface AddMedicineViewController : UIViewController {
    __unsafe_unretained id tvcdelegate;
    BOOL hasAccess;
}

@property (nonatomic, assign) id <TargetViewDelegate> tvcdelegate;

@property (nonatomic, strong) ViewController *viewController;

@property (strong, nonatomic) IBOutlet UITextField *medicineName;

@property (strong, nonatomic) IBOutlet UITextField *quantityField;


- (IBAction)saveButton:(id)sender;

- (IBAction)cancelButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *medTypeRegular;
@property (strong, nonatomic) IBOutlet UIButton *medTypeHourly;
@property (strong, nonatomic) IBOutlet UIButton *beforeEating;
@property (strong, nonatomic) IBOutlet UIButton *afterEating;
@property (strong, nonatomic) IBOutlet UILabel *everyLabel;
@property (strong, nonatomic) IBOutlet UITextField *hourInputBox;
@property (strong, nonatomic) IBOutlet UILabel *hourLabel;



- (IBAction)medTypeRegularAction:(UIButton *)sender;
- (IBAction)medTypeHourlyAction:(UIButton *)sender;
- (IBAction)beforeAfterEating:(UIButton *)sender;

@property BOOL isHourlySelected;
@property BOOL isMorningSelected;
@property BOOL isNoonSelected;
@property BOOL isNightSelected;
@property BOOL isBeforeEatingSelected;


@property (strong, nonatomic) IBOutlet UIButton *morningTime;
@property (strong, nonatomic) IBOutlet UIButton *noonTime;
@property (strong, nonatomic) IBOutlet UIButton *nightTime;
- (IBAction)medTimeAction:(UIButton *)sender;


@end

//
//  AddMedicineViewController.h
//  MedicineReminder
//
//  Created by Admin on 3/11/18.
//  Copyright © 2018 MCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMedicineViewController : UIViewController
- (IBAction)cancelButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *medTypeRegular;
@property (strong, nonatomic) IBOutlet UIButton *medTypeHourly;
- (IBAction)medTypeRegularAction:(UIButton *)sender;
- (IBAction)medTypeHourlyAction:(UIButton *)sender;

@property BOOL isHourlySelected;
@property (strong, nonatomic) IBOutlet UIButton *morningTime;
@property (strong, nonatomic) IBOutlet UIButton *noonTime;
@property (strong, nonatomic) IBOutlet UIButton *nightTime;
- (IBAction)medTimeAction:(UIButton *)sender;


@end

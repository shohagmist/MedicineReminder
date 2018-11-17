//
//  ViewController.h
//  MedicineReminder
//
//  Created by Admin on 3/11/18.
//  Copyright © 2018 MCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import "AddMedicineViewController.h"
#import "MyTableViewCell.h"

@interface ViewController : UIViewController <TargetViewDelegate>

@property NSMutableArray *myMutableArray;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end


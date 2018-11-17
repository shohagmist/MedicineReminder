//
//  ViewController.m
//  MedicineReminder
//
//  Created by Admin on 3/11/18.
//  Copyright © 2018 MCC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    NSArray *myArray = @[
                        @{@"name" : @"Test", @"time" : @"Null"}
                        ];
    _myMutableArray = [NSMutableArray arrayWithArray: myArray];
     */
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        //self->isGrantedNotAccess = granted;
    }];
    
    [self loadDataFromStorage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"TVC"])
    {
        AddMedicineViewController *myTVC = (AddMedicineViewController *) [segue.destinationViewController topViewController];
        myTVC.tvcdelegate = self; //Assign this ViewController to tvcdelegate for calling function to reload TableView data
        myTVC.viewController = self;
    }
}

//implement delegate of TargetViewController
- (void)didUpdateData
{
    [_myTableView reloadData];
    
    [self saveDataToStorage];
    
    NSLog(@"%lu", (unsigned long)[_myMutableArray count]);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return !_myMutableArray ? 0 : _myMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    
    if(_myMutableArray)
    {
        NSDictionary *dict = _myMutableArray[indexPath.row];
        
        cell.medicineName.text = [dict objectForKey:@"name"];
        NSString *q = [dict objectForKey:@"quantity"];
        NSString *med = @"";
        if([[dict objectForKey:@"isRegular"] isEqualToString:@"1"])
        {            
            med = [med stringByAppendingString:[NSString stringWithFormat:@"%li + ",[dict[@"morning"] integerValue]*[q integerValue]
                                                ]];
            med = [med stringByAppendingString:[NSString stringWithFormat:@"%li + ",[dict[@"noon"] integerValue]*[q integerValue]
                                                ]];
            med = [med stringByAppendingString:[NSString stringWithFormat:@"%li",[dict[@"night"] integerValue]*[q integerValue]
                                                ]];
        }
        else
        {
            med = [med stringByAppendingString:[NSString stringWithFormat:@"Take %@ Every %@ Hour", q, dict[@"hour"]]];
        }
        cell.quantityTimeState.text = med;
        cell.eatingState.text = [dict[@"beforeEating"] isEqualToString:@"1"] ? @"Before Eating" : @"After Eating";
    }
    else
    {
        cell.textLabel.text = @"abc";
        cell.detailTextLabel.text = @"shs";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_myMutableArray removeObjectAtIndex:indexPath.row];
        [_myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self saveDataToStorage];
    }
}

- (void) loadDataFromStorage
{
    NSUserDefaults *myData = [NSUserDefaults standardUserDefaults];
    
    if([myData arrayForKey:@"medicines"] != nil)
    {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:[myData arrayForKey:@"medicines"]];
        _myMutableArray = temp;
    }
}

-(void) saveDataToStorage
{
    NSUserDefaults *myData = [NSUserDefaults standardUserDefaults];
    
    NSArray *justArray = [[NSArray alloc]initWithArray:_myMutableArray];
    
    [myData setObject:justArray forKey:@"medicines"];
    
    [myData synchronize];
}



@end

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
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    [preferences setBool:YES forKey:@"score"];
    //[preferences ]
    [preferences synchronize];
    
    /*
    NSArray *myArray = @[
                        @{@"name" : @"Test", @"time" : @"Null"}
                        ];
    _myMutableArray = [NSMutableArray arrayWithArray: myArray];
     */
    NSLog(@"%@", _myMutableArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

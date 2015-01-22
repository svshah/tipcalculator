//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Sameer Shah on 1/21/15.
//  Copyright (c) 2015 Sameer Shah. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipValueControl;
- (void)saveDefault;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)saveDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // NSString* defaulttipValue = [NSString stringWithFormat:@"%i", self.tipValueControl.selectedSegmentIndex];
    NSInteger selectedDefault = self.tipValueControl.selectedSegmentIndex;
    [defaults setInteger:selectedDefault forKey:@"default"];
    //[defaults setObject:defaulttipValue forKey:@"default_tip_value"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self saveDefault];
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultValue = [defaults integerForKey:@"default"];
    self.tipValueControl.selectedSegmentIndex = defaultValue;
}

@end

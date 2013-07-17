//
//  AAAViewController.h
//  Discovering Objective C
//
//  Created by ios3644 on 16/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>

// Conta 1

@interface AAAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *texto1;

@property (weak, nonatomic) IBOutlet UITextField *texto2;

@property (weak, nonatomic) IBOutlet UILabel *label1;

- (IBAction)calculaSoma:(id)sender;

// Conta 2

@property (weak, nonatomic) IBOutlet UITextField *texto3;

@property (weak, nonatomic) IBOutlet UITextField *texto4;

@property (weak, nonatomic) IBOutlet UILabel *label2;

- (IBAction)slider1_mudou:(UISlider *)sender;

//- (IBAction)slider2_mudou:(UISlider *)sender;

- (IBAction)calculaSoma2:(UIButton *)sender;


@end

//
//  XORViewController.m
//  HelloWorld
//
//  Created by ios3644 on 15/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "XORViewController.h"

@interface XORViewController ()

@end

@implementation XORViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mudarTexto:(id)sender{
    // Log é do dispositivo, e não do Xcode
    // @"minhaString" = NSString
    NSLog(@"Tocou no botão");
}

@end

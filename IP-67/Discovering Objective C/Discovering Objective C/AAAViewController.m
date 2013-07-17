//
//  AAAViewController.m
//  Discovering Objective C
//
//  Created by ios3644 on 16/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAViewController.h"

@interface AAAViewController ()

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slider1_mudou:(UISlider*)sender {
    
    NSString * strRes = [NSString stringWithFormat:@"%.2f",sender.value];
    
    if(sender.tag == 1){
        self.texto3.text = strRes;
    } else if(sender.tag == 2){
        self.texto4.text = strRes;
    } else {
        NSLog(@"%d", sender.tag);
    }
}

/*
- (IBAction)slider2_mudou:(UISlider*)sender {
    self.texto4.text = [NSString stringWithFormat:@"%.2f",sender.value];
}
*/

- (IBAction)calculaSoma2:(UIButton *)sender {
    NSString * str1 = self.texto3.text;
    NSString * str2 = self.texto4.text;
    float valor1 = [str1 floatValue];
    float valor2 = [str2 floatValue];
    float resultado = valor1 + valor2;
    
    self.label2.text = [NSString stringWithFormat:@"O resultado da soma é %.2f %@",resultado,@"float"];
    //NSLog(@"O resultado da soma é %d %@",resultado,@"inteiro");
}


- (IBAction) calculaSoma:(id)sender{
    NSString * str1 = self.texto1.text;
    NSString * str2 = self.texto2.text;
    int valor1 = [str1 intValue];
    int valor2 = [str2 intValue];
    int resultado = valor1 + valor2;
    
    self.label1.text = [NSString stringWithFormat:@"O resultado da soma é %d %@",resultado,@"inteiro"];
    //NSLog(@"O resultado da soma é %d %@",resultado,@"inteiro");
}

@end

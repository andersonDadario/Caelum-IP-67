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

- (IBAction)mudarTexto:(id)sender{
    // Log é do dispositivo, e não do Xcode
    // @"minhaString" = NSString
    NSLog(@"Tocou no botão");
    
    // self.texto = Utilizar outlet
    // enviar mensagem setText
    // passar parâmetro (string)
    //
    // Açúcar sintático
    // ou (dot notation)
    //self.texto.text = @"Nice, Xamps";
    // 
    // [self.texto setText:@"Nice, Xamps"];
    // ou
    // [[self texto] setText:@"Nice, Xamps"];
    
    self.texto.text = self.campo.text;
}

@end

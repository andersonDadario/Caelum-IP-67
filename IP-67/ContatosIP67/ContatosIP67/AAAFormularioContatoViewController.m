//
//  AAAFormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAFormularioContatoViewController.h"

@interface AAAFormularioContatoViewController ()

@end

@implementation AAAFormularioContatoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pegaDadosFormulario:(id)sender {
    
    NSMutableDictionary * contato = [[NSMutableDictionary alloc] init];
    
    [contato setObject:self.nome.text forKey:@"nome"];
    // ou pode-se utilizar o Açúcar Sintático provido pelos Xcodes recentes
    contato[@"telefone"] = self.telefone.text;
    contato[@"email"] = self.email.text;
    contato[@"endereco"] = self.endereco.text;
    contato[@"site"] = self.site.text;
    
    NSLog(@"Contato: %@", contato);
}
@end

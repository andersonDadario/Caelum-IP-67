//
//  AAAFormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAContato.h"
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

- (IBAction)ReturnAction:(UITextField *)sender {
    UIResponder * nextView = [self.view viewWithTag:sender.tag+1];
    
    if(nextView){
        // aperta botão Gravar
        [self pegaDadosFormulario:nil];
    } else {
        // dá foco na próxima View
        [nextView becomeFirstResponder];
    }
}

- (IBAction)pegaDadosFormulario:(id)sender {
    
    AAAContato * contato = [[AAAContato alloc] init];
    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.endereco.text;
    
    // Desabilitar Teclado
    //
    // Como se fosse o Blur()
    // [self.site resignFirstResponder];
    //
    // Pedir para a view aniquilar o teclado
    [self.view endEditing:YES];
    
    NSLog(@"Contato: %@", contato);
}
@end

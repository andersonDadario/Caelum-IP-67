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

- (id)init{
    // Garantir que a cadeia de INITs
    // Seja chamada
    // Obs: self pode ser alterado apenas no init
    self = [super init];
    
    // Custom init começa aqui
    // 1) Validando se o self não é Nulo
    // Porque pode dar algum toto nos inits acima
    // 2) Nil tem o valor de 0
    // Portanto, nao é necessário "self != nil"
    if(self){
        // Titulo
        self.navigationItem.title = @"Cadastro";
        
        // Botao Voltar
        UIBarButtonItem * btnVoltar = [[UIBarButtonItem alloc]
                initWithTitle:@"Cancelar"
                style:(UIBarButtonItemStylePlain)
                target:self
                action:@selector(escondeFormulario)
        ];
        self.navigationItem.leftBarButtonItem = btnVoltar;
        
        // Botao Add
        UIBarButtonItem * btnAdd = [[UIBarButtonItem alloc]
               initWithTitle:@"Add"
               style:(UIBarButtonItemStylePlain)
               target:self
               action:@selector(criaContato)
        ];
        self.navigationItem.rightBarButtonItem = btnAdd;
    }
    
    // Retornar o próprio objeto
    return self;
}

- (void)escondeFormulario{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) criaContato{
    AAAContato * contato = [self pegaDadosFormulario];

    // Adicionar na Lista
    [self.contatos addObject:contato];

    // Gravar no Log
    NSLog(@"Contato: %@", contato);
    NSLog(@"Quantidade: %d\nContatos: %@"
          , [self.contatos count]
          , self.contatos
    );
    
    for(AAAContato *c in self.contatos){
        NSLog(@"Iterando: %@", c);
    }
    
    // Esconde Formulario
    [self escondeFormulario];
}

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
        //[self pegaDadosFormulario:nil];
    } else {
        // dá foco na próxima View
        [nextView becomeFirstResponder];
    }
}

- (AAAContato*)pegaDadosFormulario {
    AAAContato * contato = [[AAAContato alloc] init];
    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.endereco.text;
    
    return contato;
}
@end

//
//  AAAFormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "TPKeyboardAvoidingScrollView.h"
#import "AAAContato.h"
#import "AAAFormularioContatoViewController.h"

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
        self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;
    
        // Botao Add
        UIBarButtonItem * btnAdd = [
            [UIBarButtonItem alloc]
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

- (id) initWithContato:(AAAContato *)contato{
    self = [self init];
    if(self){
        self._contato = contato;
        
        // Botao Confirmar
        UIBarButtonItem * btnConfirmar = [
            [UIBarButtonItem alloc]
            initWithTitle:@"Confirmar"
            style:(UIBarButtonItemStylePlain)
            target:self
            action:@selector(atualizaContato)
        ];

        self.navigationItem.rightBarButtonItem = btnConfirmar;
}
    
    return self;
}

- (void) atualizaContato{
    AAAContato * contato = [self pegaDadosFormulario];
    
    if(self.delegate){
        [self.delegate contatoAtualizado:contato];
    }
}

- (void) criaContato{
    AAAContato * contato = [self pegaDadosFormulario];

    // Adicionar na Lista
    if(self.delegate){
        [self.delegate contatoAdicionado:contato];
    }
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
    NSLog(@"Funfando:%@", [TPKeyboardAvoidingScrollView class]);
    
    // Do any additional setup after loading the view from its nib.
    if(self._contato){
        self.nome.text = self._contato.nome;
        self.telefone.text = self._contato.telefone;
        self.email.text = self._contato.email;
        self.endereco.text = self._contato.endereco;
        self.site.text = self._contato.site;
    }
    
    //UIButton * botao = [UIButton new];
    //UITapGestureRecognizer * reco = [[UITapGestureRecognizer alloc] initWithTarget:self action:<#(SEL)#>]
    //botao.addG
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
    if(!self._contato){
        self._contato = [AAAContato contatoInManagedObjectContext:self.context];
    }

    self._contato.nome = self.nome.text;
    self._contato.telefone = self.telefone.text;
    self._contato.email = self.email.text;
    self._contato.endereco = self.endereco.text;
    self._contato.site = self.endereco.text;
    return self._contato;
}
@end

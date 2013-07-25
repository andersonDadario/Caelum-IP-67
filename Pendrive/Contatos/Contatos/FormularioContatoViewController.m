//
//  FormularioContatoViewController.m
//  Contatos
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

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
    if (self.contato)
    {
        self.nome.text = self.contato.nome;
        self.email.text = self.contato.email;
        self.telefone.text = self.contato.telefone;
        self.site.text = self.contato.site;
        self.endereco.text = self.contato.endereco;
    }
    
    // programando botao para reconhecer alguma coisa
    /*
    UIButton * botao = [UIButton new];
    UITapGestureRecognizer * recog = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(botaoClicado)];
    [botao addGestureRecognizer: recog];
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)init
{
    if (self = [super init]) {
        
        // configura nome da view
        self.navigationItem.title = @"Cadastro";
        
        // cria botoes
        UIBarButtonItem * btnCancela = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar"
                                                                    style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(cancelaOperacao)];
        
        UIBarButtonItem * btnConfirma = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar"
                                                                      style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(adicionaContato)];
        
        // posiciona o botao
        self.navigationItem.leftBarButtonItem = btnCancela;
        self.navigationItem.rightBarButtonItem = btnConfirma;
        
    }
    return self;
}

- (id)initWithContato : (Contato *)contato
{
    if (self = [super init])
    {
        self.contato = contato;
        self.navigationItem.title = @"Cadastro";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar"
                                                                          style:UIBarButtonItemStylePlain
                                                                          target:self action:@selector(atualizaContato)];
    }
    return self;
}

- (void)cancelaOperacao
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)adicionaContato
{
    [self pegaDadosDoFormulario];
    [self.delegate adicionaContato:self.contato];
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)atualizaContato
{
    [self pegaDadosDoFormulario];
    [self.delegate atualizaContato:self.contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selecionaImagem:(id)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController * picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage * img = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.foto setImage:img forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pegaDadosDoFormulario
{
    if (!self.contato)
    {
        //self.contato = [[Contato alloc] init];
        self.contato = [Contato new];
    }
    self.contato.nome        = self.nome.text;
    self.contato.telefone    = self.telefone.text;
    self.contato.email       = self.email.text;
    self.contato.endereco    = self.endereco.text;
    self.contato.site        = self.site.text;


    /*
    NSMutableDictionary * contato = [[NSMutableDictionary alloc]init];
    contato[@"nome"] = self.nome.text;
    contato[@"telefone"] = self.telefone.text;
    contato[@"email"] = self.email.text;
    contato[@"endereco"] = self.endereco.text;
    contato[@"site"] = self.site.text;
    */
    
    /*
    [contato setObject:self.nome.text forKey:@"nome"];
    [contato setObject:self.telefone.text forKey:@"telefone"];
    [contato setObject:self.email.text forKey:@"email"];
    [contato setObject:self.endereco.text forKey:@"endereco"];
    [contato setObject:self.site.text forKey:@"site"];
    */
    
    //NSLog(@"Contato: %@", contato);    
    //NSLog(@"Quantidade: %d contatos\n: %@", [self.contatos count], self.contatos);
    
    // for(Contato * c in self.contatos) {}
    
    //[self.site resignFirstResponder];
    //[self.view endEditing:YES];

}

- (IBAction)proximoCampo:(id)sender
{    
    UITextField * txt = (UITextField *)sender;
    NSInteger tag = txt.tag + 1;
    UIResponder * proximo = [self.view viewWithTag:tag];
    if (proximo != nil)
    {
        [proximo becomeFirstResponder];
    }
    else
    {
        [self.view endEditing:YES];
        //[self pegaDadosDoFormulario];
    }
}

@end

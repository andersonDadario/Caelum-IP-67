//
//  AAAListaContatoViewController.m
//  ContatosIP67
//
//  Created by ios3644 on 18/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAContato.h"
#import "AAAListaContatoViewController.h"
#import "AAAFormularioContatoViewController.h"

@implementation AAAListaContatoViewController

- (id)init{
    self = [super init];
    
    if(self){
        // Linha Destaque
        self.linhaDestaque = -1;
        
        // Título da barra
        self.navigationItem.title = @"Contatos";
        
        // Botões       
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        
        UIBarButtonItem * btn = [
                [UIBarButtonItem alloc]
                                 
                    initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd)
                    target:self
                    action:@selector(exibeFormularioEmBranco)
                                 
        ];
        
        self.navigationItem.rightBarButtonItem = btn;
        
    }
    
    return self;
}
#pragma mark -
#pragma mark Ciclo de Vida
- (void) viewDidLoad{
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [
        [UILongPressGestureRecognizer alloc]
        initWithTarget:self action:@selector(exibeMaisAcoes:)
    ];
    
    [self.tableView addGestureRecognizer:longPress];
}

- (void) viewDidAppear:(BOOL)animated{
    if(self.linhaDestaque != -1){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaDestaque inSection:0];
        
        [self.tableView
            selectRowAtIndexPath:indexPath
            animated:YES
             scrollPosition:UITableViewScrollPositionNone];
        
        [self.tableView
            scrollToRowAtIndexPath:indexPath
            atScrollPosition:UITableViewScrollPositionNone
            animated:YES];
        
        self.linhaDestaque = -1;
    }
}

- (void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark Actions da View
- (void) exibeMaisAcoes:(UIGestureRecognizer *) gesture{
    if(gesture.state == UIGestureRecognizerStateBegan){
        // Obter Ponto (X,Y)
        CGPoint ponto = [gesture locationInView:self.tableView];
        
        // Obter IndexPath a partir de um Ponto
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:ponto];
        
        // Obter Contato a partir de um Index Path
        AAAContato * contato = [self.contatos objectAtIndex:indexPath.row];
        contatoSelecionado = contato;
        
        // Mensagem p/ Action Sheet
        UIActionSheet *opcoes = [
            [UIActionSheet alloc]
            initWithTitle:contato.nome delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar",@"Enviar Email", @"Visualizar Site", @"Abrir Mapa", nil
        ];
        [opcoes showInView:self.view];
    }
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self exibeFormulario:indexPath];
}

- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    // 1) Armazenar referência do contato
    AAAContato * c = self.contatos[sourceIndexPath.row];
    
    // 2) Apagar contato do array
    [self.contatos removeObjectAtIndex:sourceIndexPath.row];
    
    // 3) Inserir referência do contato na nova posição
    [self.contatos insertObject:c atIndex:destinationIndexPath.row];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // Apenas Exclusão
    if(editingStyle == UITableViewCellEditingStyleDelete){
        // 1) Remover do Array
        [self.contatos removeObjectAtIndex:indexPath.row];
        
        /* 2) Remover a Linha
         * 2.1) Recarregar todas as linhas
         *      [self.tableView  reloadData];
         * 2.2) Remover linha específica
         *
         * (Modo Feio)
         * [tableView deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
         * 
         * (Modo Bonito) { com açúcar sintático para arrays }
         * Lembrando que para dicionários é @{}
         */
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }
}
#pragma mark -
#pragma mark ActionSheetDelegate
- (void) abrirAplicativoComURL:(NSString *)url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void) ligar{
    UIDevice *device = [UIDevice currentDevice];
    
    // Tenta fazer ligacao
    if([device.model isEqualToString:@"iPhone"]){
        NSString *numero = [NSString stringWithFormat:@"tel%@",contatoSelecionado.telefone];
        [self abrirAplicativoComURL:numero];
    } else {
        [[[UIAlertView alloc]
          initWithTitle:@"Impossível fazer ligação"
          message:@"Seu dispositivo não é um iPhone"
          delegate:nil
          cancelButtonTitle:@"Ok"
          otherButtonTitles:nil] show];
    }
}

- (void) enviarEmail{
    
}

- (void) abrirSite{
    NSString *url = contatoSelecionado.site;
    [self abrirAplicativoComURL:url];
}

- (void) mostrarMapa{
    NSString *url = [
        [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", contatoSelecionado.endereco]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [self abrirAplicativoComURL:url];
}

#pragma mark -
#pragma mark Protocolo <UIActionSheetDelegate>

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch(buttonIndex){
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;
        default:
            break;
    }
    
    contatoSelecionado = nil;
}

#pragma mark -
#pragma mark Protocolo <ListaContatosProtocol>

- (void) contatoAdicionado:(AAAContato *)contato{
    NSLog(@"contatoAdicionado");
    [self.contatos addObject:contato];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    // Pintar linha
    self.linhaDestaque = [self.contatos indexOfObject:contato];
}

- (void) contatoAtualizado:(AAAContato *)contato{
    NSLog(@"contatoAtualizado");
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.linhaDestaque = [self.contatos indexOfObject:contato];
}

#pragma mark -
#pragma mark Interação com o Formulário
- (void)exibeFormularioEmBranco{
    [self exibeFormulario:nil];
}

- (void)exibeFormulario:(NSIndexPath *)indexPath{
    AAAFormularioContatoViewController *form = nil;
    
    // Busca Contato (se tiver)
    // Carrega Form
    if(indexPath){
        AAAContato *contato = self.contatos[indexPath.row];
        form = [[AAAFormularioContatoViewController alloc] initWithContato:contato];
    } else {
        form = [[AAAFormularioContatoViewController alloc] init];
    }
    
    // Seta o delegate
    form.delegate = self;
    
    // Empurra View
    [self.navigationController pushViewController:form animated:YES];
}

#pragma mark -
#pragma mark Metodos da UITableView
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatos count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * pool = @"pool";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:pool];
    
    if(!cell){
        cell = [[UITableViewCell alloc]
                    initWithStyle:(UITableViewCellStyleDefault)
                    reuseIdentifier:pool
        ];
    }
    
    AAAContato *c = self.contatos[indexPath.row];
    cell.textLabel.text = c.nome;
    return cell;
}
@end

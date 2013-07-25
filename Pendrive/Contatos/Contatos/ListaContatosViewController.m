//
//  ListaContatosViewController.m
//  Contatos
//
//  Created by ios3644 on 18/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import "ListaContatosViewController.h"

@interface ListaContatosViewController()

@property NSInteger linhaSelecionada;

@end

@implementation ListaContatosViewController

- (id)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped])
    {
        // configura nome da view
        self.navigationItem.title = @"Contatos";
        
        // cria botao
        UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                              target:self
                                                                              action:@selector(exibeFormulario)];
        
        // posiciona o botao
        self.navigationItem.rightBarButtonItem = btn;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.linhaSelecionada = -1;        
    }
    return self;
}

- (void)viewDidLoad
{
    UILongPressGestureRecognizer * recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisOpcoes:)];
    [self.tableView addGestureRecognizer:recognizer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.linhaSelecionada >= 0) {
        NSIndexPath * path = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
        [self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionNone];
        self.linhaSelecionada = -1;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.linhaSelecionada = -1; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contatos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * pool = @"pool";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:pool];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pool];
    }
    Contato * contato = self.contatos[indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

#pragma mark -
#pragma mark Mensagens da UITableViewController

- (void)exibeMaisOpcoes : (UIGestureRecognizer *)sender
{
    // acontece no inicio do long pressure
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"Opcoes"
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancelar"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"Ligar", @"Ver o site", @"Enviar e-mail", nil];
        [sheet showInView:self.tableView];
        
        CGPoint ponto = [sender locationInView:self.tableView];
        NSIndexPath * path = [self.tableView indexPathForRowAtPoint:ponto];
        self.contatoSelecionado = self.contatos[path.row];
    }
}

- (void)exibeFormulario
{
    // DELEGATE
    FormularioContatoViewController * formulario = [[FormularioContatoViewController alloc] init];
    formulario.delegate = self;
    [self.navigationController pushViewController:formulario animated:YES];
    
    /*
    FormularioContatoViewController * formulario = [[FormularioContatoViewController alloc] init];
    formulario.contatos = self.contatos;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:formulario];
    [self presentViewController:nav animated:YES completion:nil];
    */
}

// Excluir
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.contatos removeObjectAtIndex:indexPath.row];
        //[tableView deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Mover o item na lista
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Contato * contatoSelecionado = self.contatos[sourceIndexPath.row];
    [self.contatos removeObjectAtIndex:sourceIndexPath.row];
    [self.contatos insertObject:contatoSelecionado atIndex:destinationIndexPath.row];
}

// Editar
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contato * contatoSelecionado = self.contatos[indexPath.row];
    NSString * mensagem = NSLocalizedString(@"Contato Selecionado:", @"Selected Contact");
    NSLog(@"%@ %@", mensagem, contatoSelecionado);
    
    FormularioContatoViewController *controller = [[FormularioContatoViewController alloc] initWithContato: contatoSelecionado];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark FormularioContatoDelegate

- (void)adicionaContato : (Contato *) contato
{
    [self.contatos addObject:contato];
    int posicao = [self.contatos indexOfObject:contato];
    NSLog(@"adicionaContato %i", posicao);
    self.linhaSelecionada = posicao;
    //NSIndexPath * path = [NSIndexPath indexPathForRow:posicao inSection:0];
    //[self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)atualizaContato : (Contato *) contato
{    
    int posicao = [self.contatos indexOfObject:contato];
    NSLog(@"atualizaContato %i", posicao);
    self.linhaSelecionada = posicao;
    //NSIndexPath * path = [NSIndexPath indexPathForRow:posicao inSection:0];
    //[self.tableView selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark -
#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", self.contatoSelecionado.telefone]]];
    }
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http:%@", self.contatoSelecionado.site]]];
    }
}

@end






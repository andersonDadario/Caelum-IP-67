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
        // Título da barra
        self.navigationItem.title = @"Contatos";
        
        // Botões
        UIBarButtonItem * btn = [
                [UIBarButtonItem alloc]
                                 
                    initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd)
                    target:self
                    action:@selector(exibeFormulario)
        ];
        
        self.navigationItem.rightBarButtonItem = btn;
        
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)exibeFormulario{
    // Carregar Form
    AAAFormularioContatoViewController * form = [[AAAFormularioContatoViewController alloc] init];
    form.contatos = self.contatos;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:form];
    
    // Enviar mensagem para mesma view
    // Para iniciar a janela Modal
    [self presentViewController:nav animated:YES completion:nil];
}

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

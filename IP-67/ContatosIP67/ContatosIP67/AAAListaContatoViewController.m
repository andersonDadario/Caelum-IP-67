//
//  AAAListaContatoViewController.m
//  ContatosIP67
//
//  Created by ios3644 on 18/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

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

- (void)exibeFormulario{
    // Carregar Form
    AAAFormularioContatoViewController * form = [[AAAFormularioContatoViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:form];
    
    // Enviar mensagem para mesma view
    // Para iniciar a janela Modal
    [self presentViewController:nav animated:YES completion:nil];
}

@end

//
//  AAAFormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAAContato.h"

@protocol ListaContatosProtocol <NSObject>
    @required
    - (void) contatoAdicionado:(AAAContato *) contato;
    - (void) contatoAtualizado:(AAAContato *) contato;
    @optional
    - (void) metodoOpcional;
@end

@interface AAAFormularioContatoViewController : UIViewController
@property (weak, atomic) AAAContato * _contato;
@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, atomic) id<ListaContatosProtocol> delegate;

- (id) initWithContato:(AAAContato *) contato;
- (IBAction)ReturnAction:(UITextField *)sender;
@end


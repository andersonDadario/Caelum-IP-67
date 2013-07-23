//
//  AAAFormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAAContato.h"

@interface AAAFormularioContatoViewController : UIViewController

@property (weak, atomic) NSMutableArray *contatos;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;

@property (weak, atomic) AAAContato *_contato;

- (id) initWithContato:(AAAContato *) contato;
- (IBAction)ReturnAction:(UITextField *)sender;

@end


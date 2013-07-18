//
//  AAAFormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAAFormularioContatoViewController : UIViewController

@property (strong, atomic) NSMutableArray *contatos;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;

- (IBAction)ReturnAction:(UITextField *)sender;

- (IBAction)pegaDadosFormulario:(id)sender;

@end

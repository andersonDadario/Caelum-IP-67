//
//  FormularioContatoViewController.h
//  Contatos
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "FormularioContatoDelegate.h"

@interface FormularioContatoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField * nome;
@property (weak, nonatomic) IBOutlet UITextField * telefone;
@property (weak, nonatomic) IBOutlet UITextField * email;
@property (weak, nonatomic) IBOutlet UITextField * endereco;
@property (weak, nonatomic) IBOutlet UITextField * site;

@property (weak, nonatomic) IBOutlet UIButton * foto;

@property (weak) id<FormularioContatoDelegate> delegate;
@property (strong) Contato * contato;

- (id) initWithContato : (Contato *) contato;
- (IBAction)proximoCampo:(id)sender;

@end

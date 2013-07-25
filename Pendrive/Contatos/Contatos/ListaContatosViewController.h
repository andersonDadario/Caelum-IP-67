//
//  ListaContatosViewController.h
//  Contatos
//
//  Created by ios3644 on 18/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Contato.h"
#import "FormularioContatoViewController.h"
#import "FormularioContatoDelegate.h"

@interface ListaContatosViewController : UITableViewController <FormularioContatoDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate>

@property (weak)NSMutableArray * contatos;
@property (weak)Contato * contatoSelecionado;

@end

//
//  AAAListaContatoViewController.h
//  ContatosIP67
//
//  Created by ios3644 on 18/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAAFormularioContatoViewController.h"

@interface AAAListaContatoViewController : UITableViewController<ListaContatosProtocol, UIActionSheetDelegate>

@property (weak, atomic) NSMutableArray *contatos;
@property NSInteger linhaDestaque;

- (void) contatoAdicionado:(AAAContato *)contato;
- (void) contatoAtualizado:(AAAContato *)contato;
- (void) exibeMaisAcoes:(UIGestureRecognizer *)gesture;

@end

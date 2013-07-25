//
//  FormularioContatoDelegate.h
//  Contatos
//
//  Created by ios3644 on 22/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FormularioContatoDelegate <NSObject>

- (void)adicionaContato : (Contato *) contato;
- (void)atualizaContato : (Contato *) contato;

@end


//
//  Contato.h
//  Contatos
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 : -> heranca
 < xxx > -> interface
*/
@interface Contato : NSObject <NSCoding>

// Atributos
@property (strong) NSString * nome;
@property (strong) NSString * telefone;
@property (strong) NSString * email;
@property (strong) NSString * site;
@property (strong) NSString * endereco;

@end

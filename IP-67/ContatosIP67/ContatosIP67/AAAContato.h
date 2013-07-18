//
//  AAAContato.h
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAAContato : NSObject {
    // iVar (opcional)
    //NSString * _nome;
}

/* Getter e Setter
 * Obs: automatic register the iVar in the class
 *
 * Opcoes
 *          copy
 *          unsafe_unretained (ARC nao verifica malloc(), alloc(), etc)
 *          retain (antes do ARC)
 *          strong
 *          weak
 *          assign (antes do ARC)
 *              default:assign 
 *
 *          atomic/nonatomic | default:atomic
 *         readonly
 */
@property (strong) NSString * nome;
@property (strong) NSString * telefone;
@property (strong) NSString * email;
@property (strong) NSString * endereco;
@property (strong) NSString * site;

@end

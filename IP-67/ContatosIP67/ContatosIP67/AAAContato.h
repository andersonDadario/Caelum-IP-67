//
//  AAAContato.h
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAAContato : NSObject {
    // Variável de instância no Objective C
    // Sempre é Privada
    NSString * nome;
}

- (void) setNome:(NSString*) nome;
- (NSString*) nome;

@end

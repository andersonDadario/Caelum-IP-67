//
//  AAAContato.m
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAContato.h"

@implementation AAAContato

    // Getter e Setter manual

    - (void)setNome:(NSString*) umNome {
        // self.nome => loop infinito
        // pois "self.nome =" chama o setter
        nome = umNome;
    }
    
    - (NSString*) nome{
        return nome;
    }
    

@end

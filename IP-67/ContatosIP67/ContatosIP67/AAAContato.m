//
//  AAAContato.m
//  ContatosIP67
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAContato.h"

@implementation AAAContato

- (NSString*) description{
    return [NSString stringWithFormat:@"%@ <%@>", self.nome, self.email];
}

@end

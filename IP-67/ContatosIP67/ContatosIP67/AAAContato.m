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

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.telefone forKey:@"telefone"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.endereco forKey:@"endereco"];
    [aCoder encodeObject:self.site forKey:@"site"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self){
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.telefone = [aDecoder decodeObjectForKey:@"telefone"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.endereco = [aDecoder decodeObjectForKey:@"endereco"];
        self.site = [aDecoder decodeObjectForKey:@"site"];
        
    }
    return self;
}

@end

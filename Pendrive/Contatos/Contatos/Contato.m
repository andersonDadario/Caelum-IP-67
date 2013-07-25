//
//  Contato.m
//  Contatos
//
//  Created by ios3644 on 17/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

// ToString()
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ <%@>", self.nome, self.email];
}

/* Serialize
como assinou o protocolo NSCoding é obrigatorio criar os metodos encodeWithCoder e initWithCoder
*/
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.telefone forKey:@"telefone"];
    [aCoder encodeObject:self.endereco forKey:@"endereco"];
    [aCoder encodeObject:self.site forKey:@"site"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.nome       = [aDecoder decodeObjectForKey:@"nome"];
        self.email      = [aDecoder decodeObjectForKey:@"email"];
        self.telefone   = [aDecoder decodeObjectForKey:@"telefone"];
        self.endereco   = [aDecoder decodeObjectForKey:@"endereco"];
        self.site       = [aDecoder decodeObjectForKey:@"site"];
    }
    return self;
}

@end

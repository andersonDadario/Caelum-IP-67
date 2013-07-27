//
//  AAAContato.m
//  ContatosIP67
//
//  Created by ios3644 on 26/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import "AAAContato.h"


@implementation AAAContato

+ (AAAContato *) contatoInManagedObjectContext:(NSManagedObjectContext *)ctx{
    AAAContato * c = (AAAContato *) [NSEntityDescription insertNewObjectForEntityForName:@"AAAContato" inManagedObjectContext:ctx];
        
    return c;
}

+ (NSArray *) todosInContext:(NSManagedObjectContext *)ctx{
    NSFetchRequest *busca =[NSFetchRequest fetchRequestWithEntityName:@"AAAContato"];
    NSSortDescriptor *ordem = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    busca.sortDescriptors = @[ordem];
    
    NSError *error;
    NSArray * result = [ctx executeFetchRequest:busca error:&error];
    
    if(error){
        return @[];
    }
    
    return result;
}


@dynamic nome;
@dynamic email;
@dynamic endereco;
@dynamic foto;
@dynamic site;
@dynamic telefone;
@dynamic longitude;
@dynamic latitude;

@end

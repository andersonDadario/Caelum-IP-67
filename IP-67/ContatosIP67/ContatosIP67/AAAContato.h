//
//  AAAContato.h
//  ContatosIP67
//
//  Created by ios3644 on 26/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AAAContato : NSManagedObject

+ (AAAContato *) contatoInManagedObjectContext:(NSManagedObjectContext *)ctx;
+ (NSArray *) todosInContext:(NSManagedObjectContext *)ctx;

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * endereco;
@property (nonatomic, retain) id foto;
@property (nonatomic, retain) NSString * site;
@property (nonatomic, retain) NSString * telefone;
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;

@end

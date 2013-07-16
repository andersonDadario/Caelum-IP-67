//
//  XORViewController.h
//  HelloWorld
//
//  Created by ios3644 on 15/07/13.
//  Copyright (c) 2013 Dadario. All rights reserved.
//

#import <UIKit/UIKit.h>

// @interface declara uma classe
// O operador ":" significa Herança
// Leia XORViewController é UIViewController
@interface XORViewController : UIViewController


/* Estrutura sinal(retorno)nomeDoMetodo:(tipoDoSender)sender;
 * {View que manda Mensagem sempre}
 * O caracter * significa referência
 * Sinal + de Classe (Static)
 * Sinal - de Instância
 * id = NSObject *
 */
-(IBAction)mudarTexto:(id)sender;

@end

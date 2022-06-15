//
//  Alert.swift
//  SigaTrilha
//
//  Created by Thiago Valentim on 21/04/22.
//

import Foundation
import UIKit

// Onde irá conter todos os Alert
class Alert:NSObject{
    
    // criando uma variavel para utilzar ela instanciada e assim herder tudo da ViewController
    var controller:UIViewController
    
    //método construtor onde é passado um parametro do UIViewController
    // a variavel criada ficará igual ao parametro criado no metodo construtor
    init(controller:UIViewController){
        self.controller = controller
    }
    
    // Criando um método "Alert" com parametro.
    // titulo é o que vai em cima, dizendo sobre o que é o Alert
    // mensagem será uma descrição do porque o Alert
    // completion: será quem irá fazer alguma execução na ação
    func getAlert(titulo:String, mensagem:String, completion:(()->Void)? = nil){
    //
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        // criando botão do Alert
        let cancell = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        //Adicionando o botãoCancel dentro do AlertController
        alertController.addAction(cancell)
        // Atribuindo função para variavel "controller"
        // espera uma UIViewController -> utiliza o "alertController"
        // completion é opcional
        // quem faz a apresentação do Alert, é uma VIEWCONTROLLER, então é necessário a utilização do "present" para dizer quem é a view chamada. 
        self.controller.present(alertController, animated: true, completion: nil)
    
   }
}

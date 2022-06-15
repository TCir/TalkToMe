//
//  RegisterVC.swift
//  LoginViewCode-Curso
//
//  Created by Thiago Valentim on 17/04/22.
//

import UIKit
import Firebase


class RegisterVC: UIViewController {
    
    var registerScreen:RegisterScreen?
    var auth:Auth?
    var alert:Alert?
    
    
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.hideKeyboardWhenTappedAround()
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}

extension RegisterVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validationTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC:RegisterScreenProtocol{
    func actionBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton(){
        guard let register = self.registerScreen else {return}
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: {(result, error) in
            
            if error != nil{
                self.alert?.getAlert(titulo: "Atenção", mensagem:  "Email já cadastrado!")
                
            }else{
                self.alert?.getAlert(titulo: "Yes!", mensagem: "Seus dados foram salvos.", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
}



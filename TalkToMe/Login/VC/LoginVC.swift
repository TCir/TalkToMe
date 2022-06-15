//
//  ViewController.swift
//  LoginViewCode-Curso
//
//  Created by Thiago Valentim on 09/04/22.
//
import UIKit
import Firebase

class LoginVC: UIViewController {
    var auth:Auth?
    var loginScreen:LoginScreen?
    var alert:Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configtextFieldDelegate(delegate: self)
        hideKeyboardWhenTappedAround()
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}


//            MARK: Extension

extension LoginVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Keyboard was called")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validationTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("ShouldReturn work")
        return true
    }
}

//            MARK:  - Validation email and password

extension LoginVC:LoginScreenProtocol{
    func actionLoginButton() {
   
        let vc:TabBarVC = TabBarVC()
        self.navigationController?.pushViewController(vc, animated: true)
        guard  let login = self.loginScreen else{return}

        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados incorretos.Tente novamente")
                print("Dados incorretos.")
            }else{
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado. Tente mais tarde!")
                    print("Tivemos um problema inesperado. Tente mais tarde!")
                }else {
                }
            }
        })
    }
    
    func actionRegisterButton() {
        let vc:RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func actionForgotButton() {
        print("DeuCerto O botão esqueceuSenha foi acionado!")
    }
}

extension UIViewController {
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

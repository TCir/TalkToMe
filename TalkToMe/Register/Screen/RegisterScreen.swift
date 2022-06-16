//
//  RegisterScreen.swift
//  LoginViewCode-Curso
//
//  Created by Thiago Valentim on 17/04/22.
//

import UIKit

// Criando o protocol
protocol RegisterScreenProtocol:AnyObject{
    func actionBackButton()
    func actionRegisterButton()
}

// ABAIXO DE CLASS OS ELEMENTOS ESTÃO SENDO CRIADOS DE CIMA PARA BAIXO, O QUE ESTIVER EMBAIXO FOI CRIADO PRIMEIRO
// class responsável por tudo que estiver nessa view
class RegisterScreen: UIView {
    
    // Criando delegate apos montar o protocol
    // a variavel delegate herda RegisterScreenProtocol
    weak private var delegate:RegisterScreenProtocol?
    
    //é passado como se fosse uma função Get
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    
    // Criando o botão de voltar na parte de cima.
    // Porém o meu apareceu sem que fosse necessário adiciona-lo.
    lazy var backButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        // selecionando a imagem que ficará dentro do botão e seu status
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        //Adicionando o Target para dar funcionalidade para o button
        // criar metodo em objc para
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    // criando imagem que ficará no topo da View
    lazy var imageAddUser:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        // selecionando qual image vai ser utilizada, pegando ela pelo name.
        image.image = UIImage(named: "scloud")
        // definindo como a imagem vai preencer o espaço
        image.contentMode = .scaleAspectFill
        //        image.backgroundColor = UIColor(red: 151/255, green: 170/255, blue: 84/255, alpha: 1.0)
        return image
    }()
    
    lazy var nameUser:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu nome:"
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    
    // criando textField e-mail de cadastro
    lazy var emailTextField:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Digite seu e-mail"
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    // criando textField senha de cadastro
    lazy var passwordTextField:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .default
        textfield.placeholder = "Digite uma senha"
        textfield.isSecureTextEntry = false
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    // criando textField verificação da senha de cadastro
    lazy var confirmPasswordTextField:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .default
        textfield.placeholder = "Confirme sua senha"
        textfield.isSecureTextEntry = false
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.textColor = .darkGray
        return textfield
    }()
    
    // Criando RegisterButton
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        // depois que o clipsToBounds estiver true, passo qual será a curva em cornerRadius
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 69/255, green: 122/255, blue: 176/255, alpha: 1.0)
        //        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        // criar metodo em objc para
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    
    
    // Primeiro Passo : Criar o construtor
    // aqui dentro chamo todos os métodos criados
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setUpContraints()
        self.configButtonEnable(false) // dessa maneira o botão já inicia desativado
    }
    
    // responsável por conter todos os elementos adicionados na view
    private func configSuperView(){
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.nameUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.confirmPasswordTextField)
        self.addSubview(self.registerButton)
    }
    
    // metodo para configurar o background da View
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        //      self.backgroundColor = UIColor(red: 151/255, green: 170/255, blue: 84/255, alpha: 1.0)
        //        self.backgroundColor = .white
    }
    
    // método para configuração do Delegate / passando a propriedade UITextViewDelegate
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.confirmPasswordTextField.delegate = delegate
        self.nameUser.delegate = delegate
    }
    
    //metodo para dar funcionalidade para backButton
    @objc private func tappedBackButton(){
        //mostrando que foi disparado o botão
        self.delegate?.actionBackButton()
    }
    //metodo para dar funcionalidade para registar
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    //    MARK: VALIDAÇÃO DOS TEXTFIELD --------------------------------------------------------------------------
    //    //Será chamada dentro do protocolo dos TexTField / para validação de campo
    public func validationTextField(){
        
        // logica de validação
        // quando disparar vai verificar se email, password e confirmPass esta vazio ou não.
        if self.emailTextField.text != "" && self.confirmPasswordTextField.text != "" && self.passwordTextField.text != "" && self.nameUser.text != ""
        {
            if self.passwordTextField.text == self.confirmPasswordTextField.text
            {
                self.configButtonEnable(true) // se entrar no true, irá passar essa resposta para o método "configButtonEnable"  que irá enviar para o delegate
            }else{
                
                self.configButtonEnable(false)
            }
        }else{
            self.configButtonEnable(false)
        }
    }
    // metodo para ativar ou não o botão Cadastrar
    // Foi passado um parametro Bool
    private func configButtonEnable(_ enable:Bool){
        if enable{ // se enable for "true" -> a cor do texto será branca e o estado do botão será habilitado
            self.registerButton.setTitleColor( .white, for: .normal)
            self.registerButton.isEnabled = true
            self.registerButton.layer.borderColor = UIColor.red.cgColor
        }else { // se for "false" -> a será lightGray e o botão não será habilitado
            self.registerButton.setTitleColor( .lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    
    //  MARK: Métodos para simplificar a validação passado em RegisterVC
    public func getUserName()->String{
        return self.nameUser.text ?? ""
    }
    public func getEmail()->String{
        return self.emailTextField.text ?? ""
    }
    public func getPassword()->String{
        return self.passwordTextField.text ?? ""
    }
    public func getConfirmPass()->String{
        return self.confirmPasswordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: SetUP Constraints
    // Criando método para config as CONSTRAINTS  (foi criado depois que criei o backButton)
    private func setUpContraints(){
        // chamo o NSLayout... e passo todos as constraints de todos elementos dentro do Array
        NSLayoutConstraint.activate([
            
            //ImageButton
            //Pegando como referencia a safeArea na parte de cima (top)
            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            //deixar centralizada sobre a view / utilizando como referencia o centro da própria view
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // definido a largura da image
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 250),
            // definindo a altura da image
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 250),
            
            //backButton
            // setando para o botão ter a mesma ALTURA da image
            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
            // distancia do lado esquerdo
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            
            //userNameTextField
            // Top pegando referencia da image
            self.nameUser.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor,constant: 10),
            //Pegando referencia da esquerda sendo o proprio leading
            self.nameUser.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            //pegando referencia da direita sendo proprio trailing
            self.nameUser.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            //definindo o height ou seja a altura do textField
            self.nameUser.heightAnchor.constraint(equalToConstant: 45),
            
            
            //emailTextFiel
            // Top pegando referencia da image
            self.emailTextField.topAnchor.constraint(equalTo: self.nameUser.bottomAnchor,constant: 10),
            //Pegando referencia da esquerda sendo o proprio leading
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            //pegando referencia da direita sendo proprio trailing
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            //definindo o height ou seja a altura do textField
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            //passwordTextField
            // Top pegando referencia da emailTextField
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 10),
            //Pegando referencia da esquerda sendo o proprio leading
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //pegando referencia da direita sendo proprio trailing
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            //definindo o height ou seja a altura do textField
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            //confirmPassowrdTextField
            // Top pegando referencia da passwordTextField
            self.confirmPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,constant: 10),
            //Pegando referencia da esquerda sendo o proprio leading
            self.confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //pegando referencia da direita sendo proprio trailing
            self.confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            //definindo o height ou seja a altura do textField
            self.confirmPasswordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            //registerButton
            // Top pegando referencia da confirmPasswordTextField
            self.registerButton.topAnchor.constraint(equalTo: self.confirmPasswordTextField.bottomAnchor,constant: 40),
            //Pegando referencia da esquerda sendo o proprio leading
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //pegando referencia da direita sendo proprio trailing
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            //definindo o height ou seja a altura do textField
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            
        ])
        
    }
}


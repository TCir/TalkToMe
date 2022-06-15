//
//  LoginScreen.swift
//  LoginViewCode-Curso
//
//  Created by Thiago Valentim on 09/04/22.
//

import UIKit

protocol LoginScreenProtocol:AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
    func actionForgotButton()
}
class LoginScreen: UIView {
    
    weak var delegate:LoginScreenProtocol?
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Uma nova meneira de conectar."
        return label
    }()
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"talkToMe")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var emailTextField:UITextField = {
        let textFiel = UITextField()
        textFiel.translatesAutoresizingMaskIntoConstraints = false
        textFiel.autocorrectionType = .no
        textFiel.backgroundColor = .white
        textFiel.borderStyle = .roundedRect
        textFiel.keyboardType = .emailAddress
        textFiel.placeholder = "Digite seu e-mail: "
        textFiel.textColor = .darkGray
        return textFiel
    }()
    
    lazy var passwordTextField:UITextField = {
        let textFiel = UITextField()
        textFiel.translatesAutoresizingMaskIntoConstraints = false
        textFiel.autocorrectionType = .no
        textFiel.backgroundColor = .white
        textFiel.borderStyle = .roundedRect
        textFiel.keyboardType = .default
        textFiel.isSecureTextEntry = true
        textFiel.placeholder = "Digite sua senha: "
        textFiel.textColor = .darkGray
        return textFiel
    }()
    
    
    // Criando botão Logar
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        // função para fazer o botão arredondar
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 43/255, green: 66/255, blue: 82/255, alpha: 1.0)
        // Criando a Action do botao
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    // Criando botão RegisterButton
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    
    // Criando botão esqueceu senha
    lazy var forgotPassword:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedForgotButton), for: .touchUpInside)
        return button
    }()
    
    // Para adicionar os elementos na View
    // MÉTODO CONTRUTOR
    // ONDE SE ADICIONA OS ELEMENTOS NA VIEW
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround() // config cor de fundo
        self.configSuperView() // configurar os elementos adicionados
        self.setUpConstraints() // setado as constraints
        self.configButtonEnable(false) // dessa maneira o botão já inicia desativado
       
    }
    
    // Para deixar o Construtor mais limpo, pode criar métodos para deixar tudo separado
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
    }
    // Criado um método para limpar a Construtor..// Aqui será adicionado todos os elementos
    private func configSuperView(){
        // adicionando a imageView dentro da view
        self.addSubview(self.logoAppImageView)
        // adicionando a label dentro da View
        self.addSubview(self.loginLabel)
        // adicionando textfield e-mail dentro da View
        self.addSubview(self.emailTextField)
        // aidicionando textField senha
        self.addSubview(self.passwordTextField)
        // adicionando o button
        self.addSubview(self.loginButton)
        // adicionando o button Cadastrar
        self.addSubview(self.registerButton)
        // adicionando o button esqueceuSenha
        self.addSubview(self.forgotPassword)
    }
    
    
    // Setando método para textField Delegate
    public func configtextFieldDelegate(delegate:UITextFieldDelegate){
        // Assinatura dos métodos Delegate
        // quem ira assinar sera a viewController em DidLoad
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    // Criando metodo para o botaoLogin objet
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }
    
    // Criando metodo para o botaoRegister  objet
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    // Criando metodo para o botaoForgot  objet
    @objc private func tappedForgotButton(){
        self.delegate?.actionForgotButton()
    }
    
    //    MARK: VALIDAÇÃO DOS TEXTFIELD _____________________________________________________________________________________________
    // Será chamada dentro do protocolo dos TexTField / para validação de campo
    public func validationTextField(){
        // logica de validação
        // quando disparar vai verificar se email, password e confirmPass esta vazio ou não.
        if self.emailTextField.text != "" && self.passwordTextField.text != ""
        {
            self.configButtonEnable(true) // se entrar no true, irá passar essa resposta para o método "configButtonEnable"  que irá enviar para o delegate
        }else{
            self.configButtonEnable(false)
        }
    }
    // metodo para ativar ou não o botão Cadastrar
    // Foi passado um parametro Bool
    private func configButtonEnable(_ enable:Bool){
        if enable{ // se enable for "true" -> a cor do texto será branca e o estado do botão será habilitado
            self.loginButton.setTitleColor( .white, for: .normal)
            self.loginButton.isEnabled = true
            self.loginButton.layer.borderColor = UIColor.red.cgColor
        }else { // se for "false" -> a será lightGray e o botão não será habilitado
            self.loginButton.setTitleColor( .lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
   
    
//
    public func getEmail()->String{
        return self.emailTextField.text ?? ""
    }
    public func getPassword()->String{
        return self.passwordTextField.text ?? ""
    }
    
    
    
    // O required seria como um Else do init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Sobre Constraints
    // equalto. -> apos o "." vem o elemento que quero me basear dele
    // constant: -> onde informo a distância que quero estar do elemento que estou referenciando no equalTo.
    // equalToConstant -> quando quero uma distância fixa desse elemento
    
    // MARK: SetUP Constraints
    private func setUpConstraints(){
        // ao chamar a ferrmenta nativa NSLayout e ativalo é criado um array onde iremos entrar com as contraints
        NSLayoutConstraint.activate([
            // Setando a constraint Horizontal in Container(equivalente no StoryBoard)
            //            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //            self.loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            // Se estivesse passando esse método dentro de outro arquivo, teria que adicionar o view apos o self, dessa maneira abaixo:
            //self.loginLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
            // Setando as constraints
            //referenciando qual safeArea desejo
            // ImageView
            // pegando como referencia a parte inferior da loginLabel
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 20),
            //o leadin esta no lado POSITIVO do EIXO X
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            // o trailing esta no lado NEGATIVO do EIXO X
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            // para ter uma altura fixa: preciso setar o width ou o heigth
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 300),
            
            
            // Label
            //TopAnchor -> parte superior da View, constant = o valor que adicionamos, então será 20 abaixo da safeArea
            self.loginLabel.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor,constant: 10),
            //centerXAnchor será o meio da tela no eixo X.
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            //TextField email
            self.emailTextField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            // Definindo a altura da textField
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            //TextField Password
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            //Setando a distância da esquerda em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //Setando a distância da direita em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            // Definindo a altura da textField // referenciando a mesma altura da TexTField
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            // Button login
            //TextField Password   // alterar a referencia para ficar abaixo do textFiel Login
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            //Setando a distância da esquerda em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //Setando a distância da direita em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            // Definindo a altura da textField // referenciando a mesma altura da TexTField
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            // Button ForgotPassword
            //TextField Password   // alterar a referencia para ficar abaixo do textFiel Login
            self.forgotPassword.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20),
            //Setando a distância da esquerda em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.forgotPassword.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //Setando a distância da direita em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.forgotPassword.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            // Definindo a altura da textField // referenciando a mesma altura da TexTField
            self.forgotPassword.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            // Button RegisterButton
            //TextField Password   // alterar a referencia para ficar abaixo do textFiel Login
            self.registerButton.topAnchor.constraint(equalTo: self.forgotPassword.bottomAnchor, constant: 40),
            //Setando a distância da esquerda em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            //Setando a distância da direita em relação ao valor setado no textField Email, dessa forma alterando um, já tenho o outro acompanhando seu valor
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            // Definindo a altura da textField // referenciando a mesma altura da TexTField
            self.registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
            
        
        ])
    }
    
    
}

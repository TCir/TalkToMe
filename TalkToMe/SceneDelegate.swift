//
//  SceneDelegate.swift
//  TalkToMe
//
//  Created by Thiago Valentim on 14/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // criado a windowScene
        guard let windowScene  = (scene as? UIWindowScene) else { return }
        // criando a constante window, definindo que será a propria windowScene criado acima
        let window  = UIWindow(windowScene: windowScene)
        // Criando quem será o responsel pela View, herdando as propriedades da ViewController instanciando com a propria ViewController
        let vc:LoginVC = LoginVC()
        //                      Iniciando o app já com a TabBar
//        let vc:TabBarController = TabBarController()
        // criando a navegação e passando como parametro o rootViewController e a raiz será a propria vc (ViewController)
        // Caso não queira uma navigationController não preciso criar essa constante
        // sem um elemento de visualização não irá ter nada na View
        let navVC = UINavigationController(rootViewController: vc)
        // atribuindo valor para a root
        window.rootViewController = navVC
        // Habilitando o window para a parte de visualização
        window.makeKeyAndVisible()
        // Como foi criado a View(window) vamos fazer a utilização dela, para acessar a window externa, faço:
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


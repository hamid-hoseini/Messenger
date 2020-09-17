//
//  ViewController.swift
//  Messenger
//
//  Created by Hamid Hoseini on 8/30/20.
//  Copyright © 2020 Hamid Hoseini. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        validateAuth()
    }

    private func validateAuth() {
        if  FirebaseAuth.Auth.auth().currentUser == nil{
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }
}


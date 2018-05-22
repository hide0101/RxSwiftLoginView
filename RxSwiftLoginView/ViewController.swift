//
//  ViewController.swift
//  RxSwiftLoginView
//
//  Created by hideakikomori on 2018/05/22.
//  Copyright © 2018年 Hideaki Komori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var validationsLabel: UILabel!
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = usernameTextField.rx.text.map { $0 ?? "" }
            .bind(to: loginViewModel.username)
        _ = passwordTextField.rx.text.map { $0 ?? "" }
            .bind(to: loginViewModel.password)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        _ = loginViewModel.isValid.subscribe(onNext: {[unowned self] isValid in
            self.validationsLabel.text = isValid ? "Enabled" : "Disabled"
            self.validationsLabel.textColor = isValid ? .green : .red
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


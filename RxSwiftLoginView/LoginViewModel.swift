//
//  LoginViewModel.swift
//  RxSwiftLoginView
//
//  Created by hideakikomori on 2018/05/22.
//  Copyright © 2018年 Hideaki Komori. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid: Observable <Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()) { usernameString,passwordString in
            usernameString.count >= 4 && passwordString.count >= 4
        }
    }
}

//
//  Pessoa.swift
//  ultimateAlgo
//
//  Created by Vicente Patricio on 06/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class Pessoa: NSObject {
    let nome: String
    let email: String
    let telefone: String
    let endereco: String
    
    
    
    init(_ nome: String, _ email: String, _ telefone: String, _ endereco: String) {
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.endereco = endereco
    }
}

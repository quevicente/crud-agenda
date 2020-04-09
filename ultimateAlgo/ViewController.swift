//
//  ViewController.swift
//  ultimateAlgo
//
//  Created by Vicente Patricio on 06/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNome: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputTelefone: UITextField!
    @IBOutlet weak var inputEndereco: UITextField!
    
    @IBAction func buttonCadastrar(_ sender: Any) {
        
        if inputNome.text!.isEmpty {
            print("Nome")
            return
        }
        if inputEmail.text!.isEmpty {
            print("E-mail")
            return
        }
        if inputTelefone.text!.isEmpty {
            print("Telefone")
            return
        }
        if inputEndereco.text!.isEmpty {
            print("Endereço")
            return
        }
        
        guard let nome = inputNome.text else { return }
        guard let email = inputEmail.text else { return }
        guard let telefone = inputTelefone.text else { return }
        guard let endereco = inputEndereco.text else { return }
        
        let novaPessoa = Pessoa(nome, email, telefone, endereco)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "ListaViewController") as! ListaViewController
        
        PessoaDAO.DAO.addLista(pessoa: novaPessoa)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func buttonAgenda(_ sender: Any) {
        if PessoaDAO.DAO.getCountLista() > 0 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(identifier: "ListaViewController") as! ListaViewController
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            let alerta = UIAlertController(title: "Agenda vazia", message: "Não há pessoas em sua agenda. :/", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
    }
}

//
//  EditarViewController.swift
//  ultimateAlgo
//
//  Created by Vicente Patricio on 07/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

protocol tabelaDelegate {
    func reloadTabela()
}

class EditarViewController: UIViewController {
    
    var delegate: tabelaDelegate?
    var posicao: Int?
    var pessoaEditar: Pessoa?
    
    @IBAction func buttonCancelar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonOk(_ sender: Any) {
        guard let nome = inputNome.text else { return }
        guard let email = inputEmail.text else { return }
        guard let telefone = inputTelefone.text else { return }
        guard let endereco = inputEndereco.text else { return }
        
        let pessoaEditada = Pessoa(nome, email, telefone, endereco)
        guard let teste = posicao else { return }
        PessoaDAO.DAO.replacePessoaInPosition(posicao: teste, pessoa: pessoaEditada)
        delegate?.reloadTabela()
        //FAZER FUNCAO PARA EIDTAR NA DAO A LISTA DA DAO COM UM NOVO DADO
        // USAR O ELEMENT INSERT NA POSICAO INDEX VAMO VE
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        inputNome.text = pessoaEditar?.nome
        inputEmail.text = pessoaEditar?.email
        inputTelefone.text = pessoaEditar?.telefone
        inputEndereco.text = pessoaEditar?.endereco
        
        
    }

    
    @IBOutlet weak var inputNome: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputTelefone: UITextField!
    @IBOutlet weak var inputEndereco: UITextField!
    
}

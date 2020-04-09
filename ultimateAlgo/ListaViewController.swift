//
//  ListaViewController.swift
//  ultimateAlgo
//
//  Created by Vicente Patricio on 06/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PessoaDAO.DAO.getCountLista()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let pessoa = PessoaDAO.DAO.getPessoaByIndex(indexPath: indexPath)
        
        let alerta = UIAlertController(title: "Teste", message: "seiuahsiuea", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok" , style: .cancel, handler: nil)
        alerta.addAction(ok)
        
        celula.textLabel?.text = pessoa.nome
        
        
        return celula
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let pessoa = PessoaDAO.DAO.getPessoaByIndex(indexPath: indexPath)
        
        let mensagem = "Nome: \(pessoa.nome) \n E-mail: \(pessoa.email) \n Telefone: \(pessoa.telefone) \n Endereço: \(pessoa.endereco)"
        
        let alerta = UIAlertController(title: "Informações", message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Voltar", style: .cancel, handler: nil)
        
        let editar = UIAlertAction(title: "Editar", style: .default) { (response) in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(identifier: "EditarViewController") as! EditarViewController
            
            viewController.pessoaEditar = pessoa
            viewController.posicao = indexPath.row
            viewController.delegate = self
            
            self.present(viewController, animated: true, completion: nil)
        }
        let excluir = UIAlertAction(title: "Excluir", style: .destructive) { (response) in
            PessoaDAO.DAO.deletePessoaIn(position: indexPath.row)
            self.tableLista.reloadData()
        }
        
        alerta.addAction(editar)
        alerta.addAction(excluir)
        alerta.addAction(cancelar)
        
        self.present(alerta, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableLista: UITableView!
    
    //ao ficar apertado, abrir uma nova tela para edicao do dado
}

extension ListaViewController: tabelaDelegate {
    func reloadTabela(){
        self.tableLista.reloadData()
    }
}

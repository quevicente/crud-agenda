//
//  PessoaDAO.swift
//  ultimateAlgo
//
//  Created by Vicente Patricio on 08/04/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class PessoaDAO: NSObject {
    static var DAO: PessoaDAO = PessoaDAO()
    
    private var listaPessoa: [Pessoa] = []
    
    public func addLista(pessoa: Pessoa){
        self.listaPessoa.append(pessoa)
    }
    
    public func getCountLista() -> Int {
        return self.listaPessoa.count
    }
    
    public func getPessoaByIndex(indexPath: IndexPath) -> Pessoa{
        return self.listaPessoa[indexPath.row]
    }
    
    public func replacePessoaInPosition(posicao: Int, pessoa: Pessoa){
        self.listaPessoa[posicao] = pessoa
    }
    
    public func deletePessoaIn(position: Int){
        self.listaPessoa.remove(at: position)
    }
}

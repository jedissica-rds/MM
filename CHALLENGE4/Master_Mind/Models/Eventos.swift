//
//  Eventos.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 23/05/24.
//

import Foundation
import SwiftData


@Model
final class Eventos {
    
    var nome : String
    var descricao : String
    var capa : Data?
    var campanha : Campanha?
    var order : Int?
    
    init(nome: String, descricao: String, campanha: Campanha? = nil, capa: Data?, order: Int?) {
        self.nome = nome
        self.descricao = descricao
        self.campanha = campanha
        self.capa = capa
        self.order = order
    }
    
    
    init(nome: String, descricao: String, campanha: Campanha? = nil, capa: Data?) {
        self.nome = nome
        self.descricao = descricao
        self.campanha = campanha
        self.capa = capa
    }
    
    
    init(nome: String, descricao: String, campanha: Campanha? = nil) {
        self.nome = nome
        self.descricao = descricao
        self.campanha = campanha
    }
    
}

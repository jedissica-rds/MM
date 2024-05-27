//
//  Campanha.swift
//  Master_Mind
//
//  Created by Jessica Rodrigues on 21/05/24.
//

import Foundation
import SwiftData

@Model
final class Campanha {
    var id = UUID()
    var titulo : String
//    var historia : String
    var capa : Data?
    
    @Relationship(deleteRule: .cascade, inverse: \Eventos.campanha) var eventos: [Eventos] = []
    
    init(titulo: String/*, historia: String*/, capa: Data?) {
        self.id = UUID()
        self.titulo = titulo
//        self.historia = historia
        self.capa = capa
    }
    
    init(titulo: String/*, historia: String*/) {
        self.id = UUID()
        self.titulo = titulo
//        self.historia = historia
    }
}



//
//extension Campanha : PersistentModel {}
//extension Campanha : ObservableObject {}

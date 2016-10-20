//
//  Locais.swift
//  ListaTelefonica
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//
import Gloss

struct Local : Decodable {
    
    var id : String?
    var name: String?
    var image: String?
    var category: String?
    var phones: [String]?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.image = "image" <~~ json
        self.category = "category" <~~ json
        self.phones = "phones" <~~ json
    }
}

//
//  Response.swift
//  ListaTelefonica
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Gloss

struct Response : Decodable {
    
    let status: Status?
    let locais: [Local]?
    
    init?(json: JSON) {
        self.status = "status" <~~ json
        self.locais = "companies" <~~ json
    }
}

//
//  Response.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Gloss

struct Response: Decodable {
    let docs: Doc?
    
    init?(json: JSON) {
        self.docs = "response" <~~ json
    }
    
}

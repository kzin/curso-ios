//
//  Doc.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Gloss

struct Doc: Decodable {

    let eventos: [Evento]?
    
    init?(json: JSON) {
        self.eventos = "docs" <~~ json
    }
    
}

//
//  Status.swift
//  ListaTelefonica
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Gloss

struct Status : Decodable {
    
    let code : Int?
    let message: String?
    
    init?(json: JSON) {
        self.code = "code" <~~ json
        self.message = "message" <~~ json
    }
}

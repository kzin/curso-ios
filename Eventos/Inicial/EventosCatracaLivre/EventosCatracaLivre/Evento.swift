//
//  Evento.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Gloss

struct Evento: Decodable {
    
    let geolocation: [String]?
    let name: [String]?
    let title: String?
    let html: String?
    
    init?(json: JSON) {
        self.name = "place_name" <~~ json
        self.title = "post_title" <~~ json
        self.geolocation = "place_geolocation" <~~ json
        self.html = "post_content" <~~ json
    }
    
    func getSubtitle() -> String {
        
        if self.name == nil {
            return ""
        }
        
        if self.name?.count > 0 {
            return self.name![0]
        }
        
        return ""
    }
    
    func getLatitude() -> Double {
        if(self.geolocation == nil) {
            return -23.5804482
        }
        
        let coord = self.geolocation![0].componentsSeparatedByString(",")
        return Double(coord[0])!
    }
    
    func getLongitude() -> Double {
        if(self.geolocation == nil) {
            return 	-46.6638124
        }
        
        let coord = self.geolocation![0].componentsSeparatedByString(",")
        return Double(coord[1])!
    }
    
}

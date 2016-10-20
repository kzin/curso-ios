//
//  Pino.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//
import MapKit

class Pino: NSObject, MKAnnotation {

    let title: String?
    let subtitle: String?
    var data: String = ""
    let coordinate: CLLocationCoordinate2D
    
    init(evento: Evento) {
        self.title = evento.title
        self.subtitle = evento.getSubtitle()
        
        if let d = evento.html {
            self.data = d
        }
        
        self.coordinate = CLLocationCoordinate2D(latitude:  evento.getLatitude(), longitude: evento.getLongitude())
        
        super.init()
    }
}

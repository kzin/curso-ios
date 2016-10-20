//
//  ViewController.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Service.sharedInstance.getLocais { (result) in
            for evento in result {
                self.addEvento(evento)
            }
            
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        }
    }
    
    func addEvento(evento: Evento) {
        let point = Pino(evento: evento)
        self.mapView.addAnnotation(point)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
        }
        
        let button = UIButton(type: .DetailDisclosure) as UIButton
        
        pinView?.rightCalloutAccessoryView = button
        
        
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let pino = view.annotation as? Pino {
            let webView = self.storyboard?.instantiateViewControllerWithIdentifier("webView") as! WebViewController
            webView.data = pino.data
            self.navigationController?.pushViewController(webView, animated: true)
        }
    }
    
}


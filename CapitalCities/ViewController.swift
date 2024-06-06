//
//  ViewController.swift
//  CapitalCities
//
//  Created by Rodrigo Cavalcanti on 05/06/24.
//

import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        mapView.addAnnotations(Capital.all)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        // If the annotation isn't from a capital city, it must return nil so iOS uses a default view.
        guard let annotation = annotation as? Capital else { return nil }
        
        // Define a reuse identifier. This is a string that will be used to ensure we reuse annotation views as much as possible.
        let identifier = "Capital"
        
        // Try to dequeue an annotation view from the map view's pool of unused view
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            // If it isn't able to find a reusable view, create a new one using MKPinAnnotationView and sets its canShowCallout property to true. This triggers the popup with the city name.
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            // Create a new UIButton using the built-in .detailDisclosure type. This is a small blue "i" symbol with a circle around it.
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            let label1 = UILabel()
            label1.text = annotation.info
            label1.textColor = .secondaryLabel
            label1.numberOfLines = 0
            annotationView?.detailCalloutAccessoryView = label1
            
        } else {
            // If it can reuse a view, update that view to use a different annotation.
            annotationView?.annotation = annotation
            if let subHeader = annotationView?.detailCalloutAccessoryView as? UILabel {
                subHeader.text = annotation.info
            }
        }
        
        annotationView?.markerTintColor = annotation.region.color
        annotationView?.tintColor = annotation.region.color
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupNavBar() {
        title = "CapitalCities"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let mapSettingsButton = UIBarButtonItem(
            image: UIImage(systemName: "map"),
            style: .plain,
            target: self,
            action: #selector(onSettingsTapped)
        )
        
        navigationItem.rightBarButtonItem = mapSettingsButton
    }
    
    @objc func onSettingsTapped() {
        let ac = UIAlertController(title: "Select terrain type", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Satelite", style: .default) { _ in
            self.mapView.preferredConfiguration = MKImageryMapConfiguration(elevationStyle: .realistic)
        })
        
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default) { _ in
            self.mapView.preferredConfiguration = MKHybridMapConfiguration(elevationStyle: .realistic)
        })
        
        ac.addAction(UIAlertAction(title: "Standard", style: .default) { _ in
            self.mapView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: .realistic)
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
}


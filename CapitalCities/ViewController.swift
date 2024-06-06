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
        
        let rioDeJaneiro = Capital(title: "Rio de Janeiro", coordinate: CLLocationCoordinate2D(latitude: -22.9068, longitude: -43.1729), info: "Famous for its Carnival festival.", region: .southeast)
        let saoPaulo = Capital(title: "São Paulo", coordinate: CLLocationCoordinate2D(latitude: -23.5505, longitude: -46.6333), info: "Largest city in Brazil.", region: .southeast)
        let brasilia = Capital(title: "Brasília", coordinate: CLLocationCoordinate2D(latitude: -15.7942, longitude: -47.8822), info: "Capital of Brazil since 1960.", region: .centralWest)
        let salvador = Capital(title: "Salvador", coordinate: CLLocationCoordinate2D(latitude: -12.9714, longitude: -38.5014), info: "Known for its Portuguese colonial architecture.", region: .northeast)
        let fortaleza = Capital(title: "Fortaleza", coordinate: CLLocationCoordinate2D(latitude: -3.7172, longitude: -38.5434), info: "Has one of the largest Carnival celebrations in Brazil.", region: .northeast)
        let beloHorizonte = Capital(title: "Belo Horizonte", coordinate: CLLocationCoordinate2D(latitude: -19.9167, longitude: -43.9345), info: "First modern Brazilian city to be planned and built.", region: .southeast)
        let manaus = Capital(title: "Manaus", coordinate: CLLocationCoordinate2D(latitude: -3.1190, longitude: -60.0217), info: "Gateway to the Amazon Rainforest.", region: .north)
        let curitiba = Capital(title: "Curitiba", coordinate: CLLocationCoordinate2D(latitude: -25.4284, longitude: -49.2733), info: "Known for its innovative urban planning.", region: .south)
        let recife = Capital(title: "Recife", coordinate: CLLocationCoordinate2D(latitude: -8.0476, longitude: -34.8770), info: "Called the 'Venice of Brazil' for its many rivers and bridges.", region: .northeast)
        let portoAlegre = Capital(title: "Porto Alegre", coordinate: CLLocationCoordinate2D(latitude: -30.0346, longitude: -51.2177), info: "Famous for its rich cultural life and Gaucho traditions.", region: .south)
        let goiania = Capital(title: "Goiânia", coordinate: CLLocationCoordinate2D(latitude: -16.6869, longitude: -49.2648), info: "One of the best-planned cities in Brazil.", region: .centralWest)
        let belem = Capital(title: "Belém", coordinate: CLLocationCoordinate2D(latitude: -1.4558, longitude: -48.4902), info: "Known for its colonial architecture and the Círio de Nazaré festival.", region: .north)
        let cuiaba = Capital(title: "Cuiabá", coordinate: CLLocationCoordinate2D(latitude: -15.6010, longitude: -56.0979), info: "Gateway to the Pantanal, the world's largest tropical wetland.", region: .centralWest)
        let natal = Capital(title: "Natal", coordinate: CLLocationCoordinate2D(latitude: -5.7945, longitude: -35.2110), info: "Known for its beautiful beaches and sand dunes.", region: .northeast)
        let teresina = Capital(title: "Teresina", coordinate: CLLocationCoordinate2D(latitude: -5.0892, longitude: -42.8019), info: "Only inland capital in the Brazilian Northeast.", region: .northeast)
        let joaoPessoa = Capital(title: "João Pessoa", coordinate: CLLocationCoordinate2D(latitude: -7.1150, longitude: -34.8641), info: "Easternmost city in the Americas.", region: .northeast)
        let maceio = Capital(title: "Maceió", coordinate: CLLocationCoordinate2D(latitude: -9.6658, longitude: -35.7350), info: "Known for its clear water beaches.", region: .northeast)
        let aracaju = Capital(title: "Aracaju", coordinate: CLLocationCoordinate2D(latitude: -10.9472, longitude: -37.0731), info: "Considered one of the best cities to live in Brazil.", region: .northeast)
        let palmas = Capital(title: "Palmas", coordinate: CLLocationCoordinate2D(latitude: -10.1844, longitude: -48.3336), info: "Youngest state capital in Brazil, founded in 1989.", region: .north)
        let macapa = Capital(title: "Macapá", coordinate: CLLocationCoordinate2D(latitude: 0.0349, longitude: -51.0694), info: "Located right on the Equator.", region: .north)
        let rioBranco = Capital(title: "Rio Branco", coordinate: CLLocationCoordinate2D(latitude: -9.9747, longitude: -67.8243), info: "Largest city in the state of Acre.", region: .north)
        let portoVelho = Capital(title: "Porto Velho", coordinate: CLLocationCoordinate2D(latitude: -8.7608, longitude: -63.8999), info: "Serves as an important transport hub in the region.", region: .north)
        let saoLuis = Capital(title: "São Luís", coordinate: CLLocationCoordinate2D(latitude: -2.5387, longitude: -44.2829), info: "Known for its colonial Portuguese architecture.", region: .northeast)
        let boaVista = Capital(title: "Boa Vista", coordinate: CLLocationCoordinate2D(latitude: 2.8235, longitude: -60.6758), info: "Only Brazilian capital north of the Equator.", region: .north)
        let floripa = Capital(title: "Florianópolis", coordinate: CLLocationCoordinate2D(latitude: -27.5954, longitude: -48.5480), info: "Island city known for its beaches and surf spots.", region: .south)
        let campoGrande = Capital(title: "Campo Grande", coordinate: CLLocationCoordinate2D(latitude: -20.4697, longitude: -54.6201), info: "Known for its green spaces and parks.", region: .centralWest)
        let vitoria = Capital(title: "Vitória", coordinate: CLLocationCoordinate2D(latitude: -20.3155, longitude: -40.3128), info: "Located on a small island within a bay.", region: .southeast)

        mapView.addAnnotations([rioDeJaneiro, saoPaulo, brasilia, salvador, fortaleza, beloHorizonte, manaus, curitiba, recife, portoAlegre, goiania, belem, cuiaba, natal, teresina, joaoPessoa, maceio, aracaju, palmas, macapa, rioBranco, portoVelho, saoLuis, boaVista, floripa, campoGrande, vitoria])

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
            
        } else {
            // If it can reuse a view, update that view to use a different annotation.
            annotationView?.annotation = annotation
        }
        
        annotationView?.markerTintColor = annotation.region.color
        annotationView?.tintColor = annotation.region.color
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // what map view sent it (There's only one in this project), what annotation view the button came from (this is useful), what button was tapped.
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
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




import UIKit
import MapKit
import AddressBook
import Contacts

class MapasViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate{
    
    var todo = [Direccion]()
    
    
    let locainicial = CLLocation(latitude: 19.324077, longitude: -99.187594)
    
    
    @IBOutlet weak var RUTA: UIButton!
    @IBOutlet weak var Regresar: UIButton!
    @IBOutlet weak var Atras: UIButton!
    
    
    
   
    
    @IBOutlet weak var selector: UISegmentedControl!
    
    @IBOutlet weak var mapa: MKMapView!
    @IBAction func INICIO(sender: Any){
        zoom(location: locainicial)
        self.mapa.removeOverlays(self.mapa.overlays)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoom(location: locainicial)
        mapa.delegate = self
        loadInitialData()
        mapa.addAnnotations(todo)
        
        //INSTRUCCIONES2.text = "2. Presiona TRAZAR RUTA"
        
        mapa.register(ArtworkView.self,            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        setupElements()
        
    }
    func setupElements(){
        
        Utilidades.styleHollowButton(Regresar)
        Utilidades.styleHollowButton(RUTA)
        Utilidades.styleHollowButton(Atras)
        
    }
        func loadInitialData() {
            guard let fileName = Bundle.main.path(forResource: "Lugares", ofType: "json")
            else { return }
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
    
        guard
        let data = optionalData,
            // 2
            let json = try? JSONSerialization.jsonObject(with: data),            // 3
            let dictionary = json as? [String: Any],
            // 4
            let direcciones = dictionary["data"] as? [[Any]]
            else { return }
        // 5
        let validWorks = direcciones.compactMap { Direccion(json: $0) }
        todo.append(contentsOf: validWorks)
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocation()
    }
    
    private let region: CLLocationDistance = 2000
    func zoom(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion (center: location.coordinate,latitudinalMeters: region * 0.4, longitudinalMeters: region * 0.4)
        mapa.setRegion(coordinateRegion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if  let location = view.annotation as? Direccion{
            self.currentPlacemark = MKPlacemark(coordinate: location.coordinate)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let linea = MKPolylineRenderer(overlay: overlay)
        linea.strokeColor = UIColor.black
        linea.lineWidth = 6.0
        
        return linea
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Direccion
        let launchoptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchoptions)
        
    }
    
    // MARK: - CURRENT LOCATION
    
    var locationManager = CLLocationManager()
    func checkLocation (){
        
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapa.showsUserLocation = true
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
    }
    
    var currentPlacemark: CLPlacemark?
    @IBAction func showDirecciones(sender: Any){
        guard  let  currentPlacemark = currentPlacemark else {
            return
        }
        let directionRequest = MKDirections.Request()
        let destinationPlacemark = MKPlacemark(placemark: currentPlacemark)
        
        directionRequest.source = MKMapItem.forCurrentLocation()
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .walking
        
        
        //CALCULAR RUTAS
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {(directionsResponse,error ) in
            guard directionsResponse != nil else {
                if error != nil{
                    print ("Error , no hay direcciones")
                }
                return
            }
            let ruta = directionsResponse!.routes[0]
            self.mapa.removeOverlays(self.mapa.overlays)
            self.mapa.addOverlay(ruta.polyline,level: .aboveRoads)
            
            let rutazoom = ruta.polyline.boundingMapRect
            self.mapa.setRegion(MKCoordinateRegion(rutazoom), animated: true)
                    }
    }
    @IBAction func cambiarVista(_ sender: Any) {
        
        switch selector.selectedSegmentIndex {
        case 0:
            mapa.mapType = .standard
            
        case 1:
            mapa.mapType = .satellite
            
        default:
            break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        self.mapa.showsUserLocation = true
        zoom(location: location)
    }
    
    
    
    @IBAction func AtrasMENU(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
}

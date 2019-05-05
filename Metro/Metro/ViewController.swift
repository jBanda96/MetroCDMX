//
//  ViewController.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit
import NMAKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: NMAMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var mapRoute: NMAMapRoute!
    
    var images: [(UIImage, NMAGeoCoordinates)] = []
    
    var stops = [NMAGeoCoordinates]()
    
    var firstTapped: NMAGeoCoordinates?
    var lastTapped: NMAGeoCoordinates?
    
    var firstIndex: Int?
    var secondIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRoute()
        registerUserMovedNotification()
        printStations()
        loadMap()
    }
    
    func registerUserMovedNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didMoveNotification), name: NSNotification.Name.NMAPositioningManagerDidUpdatePosition, object: nil)
    }

    @objc func didMoveNotification() {
    }
    
    func printStations(){
        images = [(#imageLiteral(resourceName: "Imagen 1"), coordinates: NMAGeoCoordinates(latitude: 19.5040049, longitude: -99.2022432)),
                      (#imageLiteral(resourceName: "Imagen 2"), coordinates: NMAGeoCoordinates(latitude: 19.4904081, longitude: -99.1972776)),
                      (#imageLiteral(resourceName: "Imagen 3"), coordinates: NMAGeoCoordinates(latitude: 19.479104, longitude: -99.1905389)),
                      (#imageLiteral(resourceName: "Imagen 4"), coordinates: NMAGeoCoordinates(latitude: 19.4697258, longitude: -99.1908055)),
                      (#imageLiteral(resourceName: "Imagen 5"), coordinates: NMAGeoCoordinates(latitude: 19.4578914, longitude: -99.189657)),
                      (#imageLiteral(resourceName: "Imagen 6"), coordinates: NMAGeoCoordinates(latitude: 19.4440661, longitude: -99.192796)),
                      (#imageLiteral(resourceName: "Imagen 7"), coordinates: NMAGeoCoordinates(latitude: 19.4348865, longitude: -99.1910367)),
                      (#imageLiteral(resourceName: "Imagen 8"), coordinates: NMAGeoCoordinates(latitude: 19.4248564, longitude: -99.1923475)),
                      (#imageLiteral(resourceName: "Imagen 9"), coordinates: NMAGeoCoordinates(latitude: 19.4108012, longitude: -99.1923475)),
                      (#imageLiteral(resourceName: "Imagen 10"), coordinates: NMAGeoCoordinates(latitude: 19.4003079, longitude: -99.187999)),
                      (#imageLiteral(resourceName: "Imagen 11"), coordinates: NMAGeoCoordinates(latitude: 19.391935, longitude: -99.1872088)),
                      (#imageLiteral(resourceName: "Imagen 12"), coordinates: NMAGeoCoordinates(latitude: 19.3836762, longitude: -99.1876145)),
                      (#imageLiteral(resourceName: "Imagen 13"), coordinates: NMAGeoCoordinates(latitude: 19.3728283, longitude: -99.1942327)),
                      (#imageLiteral(resourceName: "Imagen 14"), coordinates: NMAGeoCoordinates(latitude: 19.3621679, longitude: -99.1890112))
        ]
        
        for station in images {
            let mapMarker = NMAMapMarker(geoCoordinates: station.1, image: station.0)
            mapView.add(mapMarker)
        }
    }
    
    func loadMap(){
        let geoCoords = NMAGeoCoordinates(latitude: 19.5105958, longitude: -99.1271112)
        mapView.delegate = self
        mapView.set(geoCenter: geoCoords, zoomLevel: 15, animation: .none)
        mapView.copyrightLogoPosition = .bottomLeft
        mapView.positionIndicator.isVisible = true
    }
    
    func loadRoute(){
        let routeManager = NMARouteManager.shared()
        routeManager.delegate = self
        
        let routingMode = NMARoutingMode(routingType: .fastest, transportMode: .pedestrian, routingOptions: 0)
        
        routeManager.calculateRoute(stops: stops, mode: routingMode!)
    }
    
}

extension ViewController: NMAMapViewDelegate {
    func mapViewDidSelectObjects(_ mapView: NMAMapView, objects: [NMAMapObject]) {
        guard let object = objects.first as? NMAMapMarker else { return }
        
        if firstTapped == nil {
            firstTapped = object.coordinates
            firstIndex = images.firstIndex(where: { (image, coords) -> Bool in
                return coords == object.coordinates
            })
        } else if lastTapped == nil {
            lastTapped = object.coordinates
            
            secondIndex = images.firstIndex(where: { (image, coords) -> Bool in
                return coords == object.coordinates
            })
            
            requestAddress()
            
            firstTapped = nil
            lastTapped = nil
        }
        
    }
    
    func requestAddress() {
        if mapRoute != nil {
            mapView.remove(mapRoute)
        }
        
        let routeManager = NMARouteManager.shared()
        routeManager.delegate = self
        
//        let bigger = firstIndex! > secondIndex! ? firstIndex! : secondIndex!
//        let lower = firstIndex! < secondIndex! ? firstIndex! : secondIndex!
        
        let bigger = max(firstIndex!, secondIndex!)
        let lower = min(firstIndex!, secondIndex!)
        
        if bigger == lower {
            return
        }
        
        stops = [firstTapped!]
        
        for stop in (lower + 1) ..< bigger {
            stops.append(images[stop].1)
        }
        
        stops.append(lastTapped!)
        tableView.reloadData()
        
        let routingMode = NMARoutingMode(routingType: .shortest, transportMode: .pedestrian, routingOptions: 0)
        routeManager.calculateRoute(stops: stops, mode: routingMode!)
    }
    
}

extension ViewController: NMARouteManagerDelegate {
    func routeManagerDidCalculate(_ routeManager: NMARouteManager, routes: [NMARoute]?, error: NMARouteManagerError, violatedOptions: [NSNumber]?) {
        
            let route = routes?.first!
            mapRoute = NMAMapRoute(route: route!)
        
            mapView.add(mapRoute)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "station", for: indexPath) as! LineaTableViewCell
        
        let bigger = max(firstIndex!, secondIndex!)
        let lower = min(firstIndex!, secondIndex!)
        
        if bigger == lower {
            return cell
        }
        
        var stations = [Station]()//Stations.line7[lower ... bigger]
        for (index, station) in Stations.line7.enumerated() {
            if index <= bigger && index >= lower {
                stations.append(station)
            }
        }
        
        cell.myTitle.text = stations[indexPath.row].name
        cell.mySubtitle.text = nil
        cell.myImage.image = stations[indexPath.row].image
        cell.myShowButton.addTarget(self, action: #selector(tapShow(_:)), for: .touchUpInside)
        cell.myReportButton.addTarget(self, action: #selector(tapAddReport(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func tapShow(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "statusViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapAddReport(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reportViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

struct Station {
    let name: String
    let image: UIImage?
    let coordinates: NMAGeoCoordinates
}

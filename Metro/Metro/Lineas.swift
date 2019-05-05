//
//  Lineas.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import Foundation
import NMAKit

struct Stations {
    static let line7 = [
        Station(name: "El Rosario", image: #imageLiteral(resourceName: "rosario"), coordinates: NMAGeoCoordinates(latitude: 19.5040049, longitude: -99.2022432)),
        Station(name: "Aquiles Serdán", image: #imageLiteral(resourceName: "aquileserdan"), coordinates: NMAGeoCoordinates(latitude: 19.4904081, longitude: -99.1972776)),
        Station(name: "Camarones", image: #imageLiteral(resourceName: "camarones"), coordinates: NMAGeoCoordinates(latitude: 19.479104, longitude: -99.1905389)),
        Station(name: "Refinería", image: #imageLiteral(resourceName: "refineria"), coordinates: NMAGeoCoordinates(latitude: 19.4697258, longitude: -99.1908055)),
        Station(name: "Tacuba", image: #imageLiteral(resourceName: "tacuba"), coordinates: NMAGeoCoordinates(latitude: 9.4578914, longitude: -99.189657)),
        Station(name: "San Joaquín", image: #imageLiteral(resourceName: "sanjoaquin"), coordinates: NMAGeoCoordinates(latitude: 19.4440661, longitude: -99.192796)),
        Station(name: "Polanco", image: #imageLiteral(resourceName: "polanco"), coordinates: NMAGeoCoordinates(latitude: 19.4348865, longitude: -99.1910367)),
        Station(name: "Auditorio", image: #imageLiteral(resourceName: "auditorio"), coordinates: NMAGeoCoordinates(latitude: 19.4248564, longitude: -99.1923475)),
        Station(name: "Constituyentes", image: #imageLiteral(resourceName: "barrancadelmuerto"), coordinates: NMAGeoCoordinates(latitude: 19.4108012, longitude: -99.1923475)),
        Station(name: "Tacubaya", image: #imageLiteral(resourceName: "tacubaya"), coordinates: NMAGeoCoordinates(latitude: 19.4003079, longitude: -99.187999)),
        Station(name: "Sn. Pedro de los Pinos", image: #imageLiteral(resourceName: "sanpedro"), coordinates: NMAGeoCoordinates(latitude: 19.391935, longitude: -99.1872088)),
        Station(name: "San Antonio", image: #imageLiteral(resourceName: "barrancadelmuerto"), coordinates: NMAGeoCoordinates(latitude: 19.3836762, longitude: -99.1876145)),
        Station(name: "Mixcoac", image: #imageLiteral(resourceName: "mixcoac"), coordinates: NMAGeoCoordinates(latitude: 19.3728283, longitude: -99.1942327)),
        Station(name: "Barranca del Muerto", image: #imageLiteral(resourceName: "barrancadelmuerto"), coordinates: NMAGeoCoordinates(latitude: 19.3621679, longitude: -99.1890112))
    ]
}

struct Lines {
    static let all = [
        Line(name: "Línea 1", image: #imageLiteral(resourceName: "1"), address: "Observatorio - Pantitlan", station: []),
        Line(name: "Línea 2", image: #imageLiteral(resourceName: "2"), address: "Cuatro Caminos - Tasqueña", station: []),
        Line(name: "Línea 3", image: #imageLiteral(resourceName: "3"), address: "Indios Verdes - Universidad", station: []),
        Line(name: "Línea 4", image: #imageLiteral(resourceName: "4"), address: "Martín Carrera - Santa Anita", station: []),
        Line(name: "Línea 5", image: #imageLiteral(resourceName: "5"), address: "Politecnico - Pantitlan", station: []),
        Line(name: "Línea 6", image: #imageLiteral(resourceName: "6"), address: "El Rosario - Martín Carrera", station: []),
        Line(name: "Línea 7", image: #imageLiteral(resourceName: "7"), address: "El Rosario - Barranca del Muerto", station: Stations.line7),
        Line(name: "Línea 8", image: #imageLiteral(resourceName: "8"), address: "Garibaldi - Constitución de 1917", station: []),
        Line(name: "Línea 9", image: #imageLiteral(resourceName: "9"), address: "Tacubaya - Pantitlan", station: []),
        Line(name: "Línea B", image: #imageLiteral(resourceName: "b"), address: "Ciudad Azteca - Buenavista", station: []),
        Line(name: "Línea A", image: #imageLiteral(resourceName: "a"), address: "Pantitlan - La Paz", station: []),
        Line(name: "Línea 12", image: #imageLiteral(resourceName: "12"), address: "Mixcoac - Tlahuac", station: [])
    ]
}

struct Line {
    let name: String
    let image: UIImage
    let address: String
    let station: [Station]
}

//
//  STCMetroViewController.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit

class STCMetroViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let cells = [
        CellItem(title: "¡Encuentrame!", image: #imageLiteral(resourceName: "Encuentrame")),
        CellItem(title: "Lineas", image: #imageLiteral(resourceName: "Lineas")),
        CellItem(title: "Guarda tu ruta", image: #imageLiteral(resourceName: "TuRuta"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTable()
        
        self.navigationItem.title = "Menú"
    }

}

extension STCMetroViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "mapSegue", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "lineasSegue", sender: nil)
        }
    }
}

extension STCMetroViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.title.text = cells[indexPath.row].title
        cell.myImage.image = cells[indexPath.row].image
        return cell
    }
    
    func loadTable(){
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 85
        
    }
    
    struct CellItem {
        let title: String
        let image: UIImage
    }
    
}

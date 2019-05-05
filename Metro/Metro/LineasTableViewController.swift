//
//  LineasTableViewController.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit

class LineasTableViewController: UITableViewController {
    
    let lines = Lines.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Líneas"
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "station", for: indexPath) as! LineaTableViewCell
        
        let line = lines[indexPath.row]
        
        cell.myTitle.text = line.name
        cell.mySubtitle?.text = line.address
        cell.myImage?.image = line.image
        cell.myShowButton.addTarget(self, action: #selector(tapShow(_:)), for: .touchUpInside)
        cell.myReportButton.addTarget(self, action: #selector(tapAddReport(_:)), for: .touchUpInside)
        
        cell.myShowButton.tag = indexPath.row + 1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 6 {
            performSegue(withIdentifier: "stationSegue", sender: lines[indexPath.row])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stationSegue" {
            let vc = segue.destination as! StationTableViewController
            vc.line = (sender as! Line)
        }
    }
    
    @objc func tapShow(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "statusViewController")
        vc.title = "Línea \(sender.tag)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapAddReport(_ sender: UIButton){
        
    }

}

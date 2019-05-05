//
//  StationTableViewController.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit

class StationTableViewController: UITableViewController {

    var line: Line?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = line?.name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return line?.station.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "station", for: indexPath) as! LineaTableViewCell
        let station = line?.station[indexPath.row]
        
        cell.myImage.image = station?.image
        cell.myTitle.text = station?.name
        cell.mySubtitle.text = nil
        cell.myShowButton.addTarget(self, action: #selector(tapShow(_:)), for: .touchUpInside)
        cell.myReportButton.addTarget(self, action: #selector(tapAddReport(_:)), for: .touchUpInside)
        
        cell.myShowButton.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func tapShow(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "statusViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
        vc.title = line!.station[sender.tag].name
    }
    
    @objc func tapAddReport(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reportViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//
//  MakeReportViewController.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit

class MakeReportViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = [(#imageLiteral(resourceName: "llave"), "Sin servicio"), (#imageLiteral(resourceName: "robo"), "Robo")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = (self.view.frame.width / 3) - 16
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)
        
    }

}

extension MakeReportViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
        cell.image.image = images[indexPath.row].0
        cell.title.text = images[indexPath.row].1
        return cell
    }
}

extension MakeReportViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sendReportSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendReportSegue" {
            let vc = segue.destination as! SendReportViewController
            let a = images[collectionView.indexPathsForSelectedItems!.first!.row]
            
            vc.backImage = a.0
            vc.backText = a.1
            
        }
    }
}

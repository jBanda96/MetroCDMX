//
//  SendReportViewController.swift
//  Metro
//
//  Created by Julio Banda on 5/4/19.
//  Copyright © 2019 com.julio.SwiftHelloMap. All rights reserved.
//

import UIKit

class SendReportViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var message: UITextView!
    
    var backImage: UIImage!
    var backText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = backImage
        text.text = backText
        
    }
    
    @IBAction func send(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
    }
    
    @IBAction func pickPhoto(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = false
        pickerController.delegate = self
        pickerController.sourceType = .camera
        
        present(pickerController, animated: true, completion: nil)
    }

}

extension SendReportViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

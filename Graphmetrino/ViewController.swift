//
//  ViewController.swift
//  Graphmetrino
//
//  Created by Aleksey Tyurenkov on 7/1/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UINavigationControllerDelegate {

    var picker = UIImagePickerController()
    let wrapper = OpenCVWrapper()

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var processVutton: UIButton!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newPhotoButtonPressed(_ sender: Any) {

        
        let alertcontroller = UIAlertController(title: "Accessible Sources", message: "Choose image source", preferredStyle: .actionSheet)
        [.camera, .photoLibrary, .savedPhotosAlbum].filter{ UIImagePickerController.isSourceTypeAvailable($0)}.forEach { sourceType in
            let action = UIAlertAction(title: sourceType.name, style: UIAlertActionStyle.default, handler: { (action) in
                self.picker.allowsEditing = false
                self.picker.sourceType = sourceType
                self.present(self.picker, animated: true, completion: nil)
            })
            alertcontroller.addAction(action)
        }
        alertcontroller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertcontroller, animated: true, completion: nil)
    }

    @IBAction func processbuttonPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ProcessViewController
        {
            controller.processingImage = imageView.image
        }
    }
    
}

extension UIImagePickerControllerSourceType
{
    var name: String
    {
        switch self {
        case .camera:
            return "Camera"
        case .photoLibrary:
            return "Photo Library"
        case .savedPhotosAlbum:
            return "Photo Album"
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        dismiss(animated: true) {
            [weak self] in
            self?.processVutton.isEnabled = true
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.picker = UIImagePickerController()
        dismiss(animated: true, completion: nil)
    }
}

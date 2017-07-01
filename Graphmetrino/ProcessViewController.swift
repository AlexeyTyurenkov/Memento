//
//  ProcessViewController.swift
//  Graphmetrino
//
//  Created by Aleksey Tyurenkov on 7/2/17.
//  Copyright © 2017 com.ovt. All rights reserved.
//

import UIKit

class ProcessViewController: UIViewController {

    
    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var processedImage: UIImageView!
    var processingImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalImage.image = processingImage
        processedImage.image = processingImage
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

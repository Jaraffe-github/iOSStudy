//
//  ViewController.swift
//  ImageView
//
//  Created by 최승민 on 2021/12/07.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    let images: [UIImage?] =
    [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6")
    ]
    var currentImageIndex = 0
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        imgView.image = images[currentImageIndex]
    }

    @IBAction func btnPrevImage(_ sender: UIButton) {
        if currentImageIndex > 0
        {
            currentImageIndex -= 1
            imgView.image = images[currentImageIndex]
        }
       
    }
    
    @IBAction func btnNextImage(_ sender: UIButton) {
        if currentImageIndex < images.count - 1
        {
            currentImageIndex += 1
            imgView.image = images[currentImageIndex]
        }
    }
}


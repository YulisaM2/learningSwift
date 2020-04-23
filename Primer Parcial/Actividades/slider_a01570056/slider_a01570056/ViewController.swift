//
//  ViewController.swift
//  slider_a01570056
//
//  Created by Alumno on 17/02/20.
//  Copyright © 2020 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    }

    @IBOutlet weak var Vslider: UIView!
    @IBOutlet weak var imgBola: UIImageView!
    
    @IBAction func slSlider(_ sender: UISlider) {
        imgBola.frame.origin.x = Vslider.frame.size.width * CGFloat(sender.value)
        
    }
    
    @IBOutlet weak var vMovingText: UIView!
    @IBOutlet weak var lbHola: UILabel!
    
    @IBAction func scLado(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 1){
            UIView.animate(withDuration: 1) {
                self.lbHola.frame.origin.x = self.vMovingText.frame.size.width - CGFloat(50)
            }
        }else{
            UIView.animate(withDuration: 1) {
                self.lbHola.frame.origin.x = 10
            }
        }
    }
    
    
    
}


//
//  SixthViewController.swift
//  tabBar_a01570056
//
//  Created by Trinity on 16/04/20.
//  Copyright © 2020 Trinity. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var tfdatoVSixth: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let navigationControllerView = segue.destination as! UINavigationController
        
        let tableViewController = navigationControllerView.topViewController as! FourthTableViewController
        
        tableViewController.datoVFourth = tfdatoVSixth.text
    }
    

}

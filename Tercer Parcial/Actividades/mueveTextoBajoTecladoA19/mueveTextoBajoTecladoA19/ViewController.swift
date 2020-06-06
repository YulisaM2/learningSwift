//
//  ViewController.swift
//  mueveTextoBajoTecladoA19
//
//  Created by Yolanda Martinez on 10/17/19.
//  Copyright © 2019 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfCelular: UITextField!
    
    var activeField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        self.view.addGestureRecognizer(tap)
        self.registrarseParaNotificacionesDeTeclado()
    }

    func registrarseParaNotificacionesDeTeclado() {
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoSeMostro(aNotification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoSeOculto(aNotification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
   @IBAction func quitaTeclado() {
       view.endEditing(true)
   }
    
    
    @IBAction func tecladoSeMostro(aNotification: NSNotification) {

        let kbSize = (aNotification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size

        let contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset

        scrollView.setContentOffset(CGPoint(x: 0.0, y: activeField.frame.origin.y - kbSize.height), animated: true)
    }
    

   // Called when the UIKeyboardWillHideNotification is sent
   @IBAction func tecladoSeOculto(aNotification : NSNotification) {
       let contentInsets = UIEdgeInsets.zero
       scrollView.contentInset = contentInsets
       scrollView.scrollIndicatorInsets = contentInsets
   }
   
   // OJO poner atención a este comentario
   // Each text field in the interface sets the view controller as its delegate.
   // Therefore, when a text field becomes active, it calls these methods.
   func textFieldDidBeginEditing (_ textField : UITextField )
   {
       activeField = textField
   }
   
   func textFieldDidEndEditing (_ textField : UITextField )
   {
       activeField = nil
   }

}


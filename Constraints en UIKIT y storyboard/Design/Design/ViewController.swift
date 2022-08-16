//
//  ViewController.swift
//  Design
//
//  Created by Arturo Sanchez on 16/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ResultadoDescuento: UILabel!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var cantidadtxt: UITextField!
    @IBOutlet weak var porcentajetxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladodown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func tecladoUp(){
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen == 1136{
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y = 50
            }
        }
    }
    
    @objc func tecladodown(){
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
  
    @IBAction func calcularbtn(_ sender: UIButton) {
        guard let cantidad = cantidadtxt.text else { return }
        guard let porcentaje = porcentajetxt.text else { return  }
        
        let cant = (cantidad as NSString).floatValue
        let porciento = (porcentaje as NSString).floatValue
        
        let desc = cant * porciento/100
        let res = cant - desc
        
        resultado.text = "$\(res)"
        ResultadoDescuento.text = "$\(desc)"
        self.view.endEditing(true)
    }
    
    @IBAction func limpiarbtn(_ sender: UIButton) {
        cantidadtxt.text = ""
        porcentajetxt.text = ""
        resultado.text = "$0.00"
        ResultadoDescuento.text = "$0.00"
    }
}


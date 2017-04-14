//
//  ViewController.swift
//  Millas A Metros
//
//  Created by Lazarus Polar on 20/03/17.
//  Copyright © 2017 Jose Almaraz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var distanciaTexto: UITextField!
    @IBOutlet var resultado: UILabel!
    @IBOutlet var eleccionConversion: UISegmentedControl!
    
    let mileUnit: Double = 1.609
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultado.text = "Escribe la distancia a convertir"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func realizarConversion(_ sender: UIButton) {
        let eleccion = eleccionConversion.selectedSegmentIndex
        
        //Primero verifica si hay algo en el campo y luego intenta la conversión a Double
        if let textFieldStr = distanciaTexto.text, let textFieldVal = Double(textFieldStr) {
        
            if eleccion == 0 {
            let convertedValue = textFieldVal / mileUnit
            /*
            //FORMATEO DE DATOS
            let valorInicial = String(format: "%.2f", textFieldVal)
            let valorFinal = String(format: "%.2f", convertedValue)
            //IMPRESION DE RESULTADO
            resultado.text = "\(valorInicial) km = La conversión es \(valorFinal) millas"
            */
            reloadView(textFieldVal : textFieldVal, convertedValue : convertedValue)
                print("Seleccionaste la opcion 0")
            }
            else{
                let convertedValue = textFieldVal * mileUnit
            /*
            //FORMATEO DE DATOSS
            let valorInicial = String(format: "%.2f", textFieldVal)
            let valorFinal = String(format: "%.2f", convertedValue)
            //IMPRESION DE RESULTADO
            resultado.text = "\(valorInicial) millas = La conversión es \(valorFinal) kilometros"
            */
            reloadView(textFieldVal : textFieldVal, convertedValue : convertedValue)
                print("Seleccionaste la opcion 1")
            }
        } else {
            resultado.text = "Escribe algo, por favor";
        }
    }
    
    func reloadView(textFieldVal : Double, convertedValue : Double){
        let valorInicial = String(format: "%.2f", textFieldVal)
        let valorFinal = String(format: "%.2f", convertedValue)
        //IMPRESION DE RESULTADO
        if eleccionConversion.selectedSegmentIndex == 0{
            resultado.text = "\(valorInicial) km = La conversión es \(valorFinal) millas"
        }
        else{
            resultado.text = "\(valorInicial) millas = La conversión es \(valorFinal) km"
        }
    }
    
}


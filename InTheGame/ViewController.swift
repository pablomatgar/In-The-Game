// Pablo Mateos García

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var vista: UIView!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var edad: UITextField!
    
    let usuario = UserDefaults.standard
    override func viewDidAppear(_ animated: Bool) {
        nombre.delegate = self
        edad.delegate = self
        if(usuario.string(forKey: "nombre") == nil){
            //No hay usuario, así que lo registramos
            let registrar = UIAlertController(title: "¡Ups!", message: "No hay un usuario registrado aún.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Registrar", style: .default, handler: {(action)->Void in self.mostrar()})
            registrar.addAction(ok)
            self.present(registrar,animated: true, completion: nil)
        }
        else{
            //Si hay usuario. Mostramos alerta del usuario
            let registrado = UIAlertController(title: "Bienvenido " + usuario.string(forKey: "nombre")!, message: "¿Listo para jugar?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Here we go!", style: .default, handler: {(action) in self.performSegue(withIdentifier: "registrados", sender: self)})
            registrado.addAction(ok)
            self.present(registrado,animated: true, completion: nil)
        }
    }
    
    func mostrar(){ //Mostramos los campos para registrar usuario
        for e in vista.subviews{
            e.isHidden = false
        }
    }
    
    @IBAction func registrar() {
        //Guardamos información
        usuario.set(nombre.text, forKey: "nombre")
        usuario.set(Int(edad.text!)!, forKey: "edad")
        usuario.set(0, forKey: "puntosJuego1")
        usuario.set(0, forKey: "puntosJuego2")
        usuario.set(0, forKey: "puntosJuego3")
        usuario.set(0, forKey: "movJuego3")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func sliderCambia(_ sender: UISlider) {
        edad.text = String(Int(sender.value)) //el valor se va actualizando en el UITextField edad
    }
    
}


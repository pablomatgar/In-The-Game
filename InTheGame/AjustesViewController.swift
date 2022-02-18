// Pablo Mateos García

import UIKit

class AjustesViewController: UIViewController, UITextFieldDelegate {
    let usuario = UserDefaults.standard
    
    override func viewDidLoad(){
        super.viewDidLoad()
        nombre.delegate = self
        nombre.isEnabled = false
        edad.isEnabled = false
        elegirEdad.isEnabled = false
        nombre.text = usuario.string(forKey: "nombre")
        edad.text = String(usuario.integer(forKey: "edad"))
        elegirEdad.value = Float(usuario.integer(forKey: "edad"))
        edit.isHidden = false
        save.isHidden = true
    }
    
    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var elegirEdad: UISlider!
    
    @IBAction func editarInfo(_ sender: UIButton) {
        nombre.isEnabled = true
        elegirEdad.isEnabled = true
        edit.isHidden = true
        save.isHidden = false
    }
    
    @IBAction func saveInfo(_ sender: UIButton) {
        usuario.set(nombre.text, forKey: "nombre")
        usuario.set(Int(edad.text!)!, forKey: "edad")
        viewDidLoad()
    }
    
    @IBAction func borrarUser(_ sender: UIButton) {
        usuario.set(nil, forKey: "nombre")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    @IBAction func sliderCambia(_ sender: UISlider) {
        edad.text = String(Int(sender.value))
    }
}

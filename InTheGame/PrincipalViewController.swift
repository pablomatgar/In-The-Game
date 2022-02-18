// Pablo Mateos García

import UIKit

class PrincipalViewController: UIViewController{
    @IBOutlet weak var puntuacion: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet var juego3: [Any]!
    @IBOutlet weak var abrirAjustes: UIButton!
    @IBOutlet weak var usuario: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let user = UserDefaults.standard
        //Mostramos datos del usuario arriba
        usuario.text = user.string(forKey: "nombre")
        let puntos = user.integer(forKey: "puntosJuego1") + user.integer(forKey: "puntosJuego2") + user.integer(forKey: "puntosJuego3")
        puntuacion.text = String(puntos) + " puntos"
        //Mostramos u ocultamos el tercer juego en función de los puntos
        if(puntos<20){
            for j in juego3{
                if let elemento = j as? UILabel{
                    elemento.isHidden = true
                }
                if let elemento = j as? UIButton{
                    elemento.isHidden = true
                }
                if let elemento = j as? UIImageView{
                    elemento.isHidden = true
                }
            }
            info.isHidden = false
        }
        else{
            for j in juego3{
                if let elemento = j as? UILabel{
                    elemento.isHidden = false
                }
                if let elemento = j as? UIButton{
                    elemento.isHidden = false
                }
                if let elemento = j as? UIImageView{
                    elemento.isHidden = false
                }
            }
            info.isHidden = true
        }
    }
}

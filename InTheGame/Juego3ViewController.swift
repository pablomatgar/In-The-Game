// Pablo Mateos García

import UIKit

class Juego3ViewController: UIViewController{
    
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var elegido: UIButton!
    @IBOutlet var vistas: [UIButton]!
    @IBOutlet var botones: [UIButton]!
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet var bases: [UILabel]!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var final: UIView!
    @IBOutlet weak var moves: UILabel!
    @IBOutlet weak var textMov: UILabel!
    @IBOutlet weak var primera: UIView!
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBAction func reload(_ sender: Any) {
        self.viewDidLoad()
    }
    
    var botonMover = 0
    var movimientosCont = 0
    
    override func viewDidLoad() {
        var base:UILabel! = nil
        super.viewDidLoad()
        botonMover = 0
        movimientosCont = 0
        for v in vistas{
            v.isEnabled = false
            v.superview!.isUserInteractionEnabled = true
        }
        for b in botones{
            b.isEnabled = true
            primera.addSubview(b)
        }
        texto.text = "Pulsa un disco"
        elegido.isHidden = true
        last.isHidden = true
        moves.text = ""
        moves.isHidden = false
        textMov.isHidden = false
        refreshButton.isHidden = true
        //Coloco los discos
        //Busco la base de la vista primera
        for b in bases{
            if((b.superview?.isEqual(primera))!){
                base = b
            }
        }
        //Boton 3 sobre la base
        bt3.frame.origin.y = base.frame.origin.y - bt3.frame.height
        //Boton 2 sobre el 3
        bt2.frame.origin.y = bt3.frame.origin.y - bt2.frame.height
        //Boton 1 sobre el 2
        bt1.frame.origin.y = bt2.frame.origin.y - bt1.frame.height
    }
    
    @IBAction func pulsarBoton(_ sender: UIButton) {
        var botonesEnMiVista : [Int:UIButton] = [:]
        let vistaDondeEstoy = sender.superview!
        if (vistaDondeEstoy.isEqual(bt1.superview!)){
            botonesEnMiVista[Int(bt1.currentTitle!)!] = bt1
        }
        if (vistaDondeEstoy.isEqual(bt2.superview!)){
            botonesEnMiVista[Int(bt2.currentTitle!)!] = bt2
        }
        if (vistaDondeEstoy.isEqual(bt3.superview!)){
            botonesEnMiVista[Int(bt3.currentTitle!)!] = bt3
        }
        //Ya tenemos en el diccionario los botones de mi vista, ahora hay que seleccionar el menor
        var nomBotonesOrdenados = botonesEnMiVista.keys.sorted()
        //Seleccionamos el nombre del boton que vamos a mover
        botonMover = nomBotonesOrdenados[0]
        
        vistaDondeEstoy.isUserInteractionEnabled = false // No permite volver a pulsar la vista en la que estás
        
        for b in botones{
            b.isEnabled = false //No permitimos pulsar más botones
        }
        
        for v in vistas{
            v.isEnabled = true
        }
        
        texto.text = "Vas a mover"
        switch (botonMover){
        case 1: elegido.backgroundColor = UIColor.blue
                elegido.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        case 2: elegido.backgroundColor = UIColor.purple
                elegido.setTitleColor(UIColor.purple, for: UIControl.State.normal)
        case 3:elegido.backgroundColor = UIColor.red
        elegido.setTitleColor(UIColor.red, for: UIControl.State.normal)
        default: break
        }
        elegido.isHidden = false
    }
    
    @IBAction func pulsarDestino(_ sender: UIButton) {
        var error = false
        var base:UILabel! = nil
        var boton:UIButton! = nil
        var botonDebajo:UIButton! = nil
        var botonesEnMiVista : [Int:UIButton] = [:]
        let vistaDondeEstoy = sender.superview!
        
        if (vistaDondeEstoy.isEqual(bt1.superview!)){
            botonesEnMiVista[Int(bt1.currentTitle!)!] = bt1
        }
        if (vistaDondeEstoy.isEqual(bt2.superview!)){
            botonesEnMiVista[Int(bt2.currentTitle!)!] = bt2
        }
        if (vistaDondeEstoy.isEqual(bt3.superview!)){
            botonesEnMiVista[Int(bt3.currentTitle!)!] = bt3
        }
        //Ya tenemos en el array los botones de mi vista, ahora comprobamos que no hay un botón menor que el que queremos mover para poder moverlo
        for b in botonesEnMiVista.keys{
            if (b < botonMover){
                error = true //No podemos poner una grande sobre una pequeña
            }
        }
        if error == false{
            //No hay ningún menor. Puedo moverlo
            for b in botones{
                if (Int(b.currentTitle!)! == botonMover){
                    vistaDondeEstoy.addSubview(b)
                    boton = b
                }
            }
            //Tengo que saber si hay botones en la vista para posicionarlo
            if (botonesEnMiVista.count == 0){//Vacío
                //Tengo que buscar la base de la vista destino
                for b in bases{
                    if (b.superview?.isEqual(vistaDondeEstoy))!{
                        base = b
                    }
                }
                boton.frame.origin.y = base.frame.origin.y - boton.frame.height
            }
            else{
            //Si los hay, tengo que localizar el más pequeño para situar el nuevo encima
            var nomBotonesOrdenados = botonesEnMiVista.keys.sorted()
            //Seleccionamos el nombre del boton del que vamos a situar encima
                let nomBoton = nomBotonesOrdenados[0]
            //Busco el boton
            for b in botones{
                if (Int(b.currentTitle!)! == nomBoton){
                    botonDebajo = b
                }
            }
            //Lo posiciono
            boton.frame.origin.y = botonDebajo.frame.origin.y - boton.frame.height
            }
            movimientosCont = movimientosCont + 1
            moves.text = String(movimientosCont)
        }
            for v in vistas{
                v.isEnabled = false
                v.superview!.isUserInteractionEnabled = true
            }
            for b in botones{
                b.isEnabled = true
            }
            texto.text = "Pulsa un disco"
            elegido.isHidden = true
            if (botonesEnMiVista.count==2 && vistaDondeEstoy==final && error == false){  //Se ha llegado al final
                let user = UserDefaults.standard
                texto.text = "¡Lo conseguiste!"
                if((user.integer(forKey: "movJuego3"))<=movimientosCont && (user.integer(forKey: "movJuego3")) != 0){ //No se ha superado el récord
                    last.text = "Movimientos realizados: " + String(movimientosCont) + "\n\nPuntos obtenidos: " + String(100/movimientosCont) + "\n\n Récord: " + String(user.integer(forKey: "movJuego3"))
                }
                else{ //Se ha superado el récord
                    last.text = "Movimientos realizados: " + String(movimientosCont) + "\n\nPuntos obtenidos: " + String(100/movimientosCont) + "\n\n NUEVO RÉCORD"
                    user.set(movimientosCont, forKey: "movJuego3")
                    user.set((100/movimientosCont), forKey: "puntosJuego3")
                }
                elegido.isHidden = true
                    for v in vistas{
                        v.isEnabled = false
                        v.superview!.isUserInteractionEnabled = false
                    }
                    for b in botones{
                        b.isEnabled = false
                    }
                last.isHidden = false
                moves.isHidden = true
                textMov.isHidden = true
                refreshButton.isHidden = false
            }
        }
    
    @IBAction func info(_ sender: Any) { //Botón de ayuda en forma de alerta
        let info = UIAlertController(title: "Torres de Hanoi", message: "Las Torres de Hanoi es un rompecabezas o juego matemático inventado en 1883 por el matemático francés Éduard Lucas. \n Consiste en tres varillas verticales y un número indeterminado de discos que determinarán la complejidad de la solución. No hay dos discos iguales, están colocados de mayor a menor en la primera varilla ascendentemente, y no se puede colocar ningún disco mayor sobre uno menor a él en ningún momento. \n El juego consiste en pasar todos los discos a la tercera varilla colocados de mayor a menor ascendentemente. \n\n REGLAS: \n -Sólo se puede mover un disco cada vez.\n-Un disco de mayor tamaño no puede descansar sobre uno más pequeño que él mismo.\n-Sólo puedes desplazar el disco que se encuentre arriba en cada varilla.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Cerrar", style: .default, handler: {(action)->Void in })
        info.addAction(ok)
        self.present(info,animated: true, completion: nil)
    }
}

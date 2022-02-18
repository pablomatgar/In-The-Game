// Pablo Mateos García

import UIKit

class Juego2ViewController: UIViewController{
    @IBOutlet weak var fin: UILabel!
    @IBOutlet weak var reloadBt: UIButton!
    @IBOutlet var letra: [UIButton]!
    @IBOutlet var piernas: [UILabel]!
    @IBOutlet var brazos: [UILabel]!
    @IBOutlet weak var cuerpo: UIButton!
    @IBOutlet weak var cabeza: UIButton!
    @IBOutlet var soporte: [UILabel]!
    @IBOutlet var soga: [UILabel]!
    @IBOutlet weak var palabra: UILabel!
    
    var elegida:String! = nil
    var guiones = ""
    var vidas:Int! = nil
    
    @IBAction func pulsarLetras(_ sender: UIButton) {
        let user = UserDefaults.standard
        if (elegida.contains(Character(sender.currentTitle!))==true){ //La letra pulsada está en la palabra
            var caracteres = Array(elegida)
            var guionesC = Array(guiones)
            //Buscamos las ocurrencias del caracter en la palabra de guiones (pasada a array y teniendo en cuenta los espacios)
            for i in 0...((caracteres.count)-1){
                if caracteres[i] == Character(sender.currentTitle!){
                    guionesC[2*i] = Character(sender.currentTitle!)
                }
            }
            guiones = String(guionesC)
            palabra.text = guiones //Mostramos
        }
        else{
            vidas = vidas - 1 //Restamos vidas
        }
        switch(vidas){ //En función de las vidas se va mostrando cada parte del muñeco ahorcado
            case 5: for p in piernas{
                    p.isHidden = false
                }
            case 4: cuerpo.isHidden = false
            case 3: for b in brazos{
                b.isHidden = false
                }
            case 2: cabeza.isHidden = false
            case 1: for s in soporte{
                s.isHidden = false
                }
            case 0: for s in soga{
                s.isHidden = false
                }
                //Al llegar a 0, ocultamos botones, mostramos mensaje final, mostramos la solución y opción de jugar de nuevo
                for boton in letra{
                    boton.isHidden = true
                }
                fin.text = "LO SENTIMOS. HAS PERDIDO. \n Puntos: 0"
                fin.isHidden = false
                palabra.text = elegida
                reloadBt.isHidden = false
            default: break
        }
        sender.isHidden = true //Las letras pulsadas se ocultan
        if (elegida == guiones.replacingOccurrences(of: " ", with: "")){ //Si la palabra coincide con la mostrada sin espacios hemos ganado
            for boton in letra{
                boton.isHidden = true
            }
            fin.text = "¡HAS GANADO! \n Puntos: " + String(vidas * 10)
            fin.isHidden = false
            user.set((vidas*10) + user.integer(forKey: "puntosJuego2"), forKey: "puntosJuego2") //Actualizamos puntos
            reloadBt.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        //Inicializamos todo
        elegida = inicializar_palabra()
        guiones = ""
        vidas = 6
        reloadBt.isHidden = true
        fin.isHidden = true
        for boton in letra{
            boton.isHidden = false
        }
        for _ in 1...elegida.count{
            guiones.append("_")
            guiones.append(" ")
        }
        palabra.text = guiones
        for p in piernas{
            p.isHidden = true
        }
        for b in brazos{
            b.isHidden = true
        }
        cuerpo.isHidden = true
        cabeza.isHidden = true
        for s in soga{
            s.isHidden = true
        }
        for s in soporte{
            s.isHidden = true
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        viewDidLoad()
    }
}

func inicializar_palabra()-> String {
    var palabras = [String]()
    palabras.append("AVELLANA")
    palabras.append("ORDENADOR")
    palabras.append("SANDIA")
    palabras.append("MEDIODIA")
    palabras.append("LLAVES")
    palabras.append("RATON")
    palabras.append("GATO")
    palabras.append("SOLEDAD")
    palabras.append("TRISTEZA")
    palabras.append("NOTIFICACIONES")
    palabras.append("ROBERTO")
    palabras.append("MOSTRAR")
    palabras.append("DESEAR")
    palabras.append("VERSION")
    palabras.append("MULTIDIMENSIONALES")
    palabras.append("CONTROLADOR")
    palabras.append("PARES")
    palabras.append("EJEMPLO")
    palabras.append("ARDILLA")
    palabras.append("ELEMENTO")
    palabras.append("SIGNIFICADO")
    palabras.append("MEDICOS")
    palabras.append("ELEVARSE")
    palabras.append("GARABATO")
    palabras.append("ELECTRODOMESTICO")
    palabras.append("ARROYO")
    palabras.append("IMPORTAR")
    palabras.append("MADURO")
    palabras.append("GRANERO")
    palabras.append("PROFESORA")
    palabras.append("ENCARNACION")
    palabras.append("PABLO")
    palabras.append("PROGRAMACION")
    palabras.append("ALTAMIRA")
    palabras.append("DESERTAR")
    palabras.append("PEINADO")
    palabras.append("PELUCHE")
    palabras.append("HAMSTER")
    palabras.append("ANA")
    palabras.append("ZAPATILLA")
    palabras.append("UNICORNIO")
    palabras.append("CALENDARIO")
    palabras.append("RODILLA")
    palabras.append("ABUELA")
    palabras.append("ROCAMBOLESCO")
    palabras.append("ESTERNOCLEIDOMASTOIDEO")
    palabras.append("GENETICA")
    palabras.append("PAJARRACO")
    palabras.append("ESTERNON")
    palabras.append("HERRAMIENTA")
    palabras.append("AUTOMATA")
    palabras.append("ROMANTICISMO")
    palabras.append("RESTAURACION")
    palabras.append("ELECTRICIDAD")
    palabras.append("RECONOCER")
    palabras.append("OMBLIGO")
    palabras.append("PAÑUELO")
    palabras.append("VETERINARIA")
    palabras.append("ENFERMERO")
    palabras.append("INGENIERIA")
    palabras.append("BIOLOGIA")
    palabras.append("LIBRETA")
    palabras.append("SERENDIPIA")
    palabras.append("RUMIANTE")
    palabras.append("RINOCERONTE")
    palabras.append("AHORCADO")
    palabras.append("AUTOESTIMA")
    palabras.append("MARAVILLA")
    palabras.append("REVOLUCION")
    palabras.append("MICROORGANISMO")
    palabras.append("JUGUETE")
    palabras.append("SUEGRA")
    palabras.append("MELOCOTONERO")
    palabras.append("PAPELETA")
    palabras.append("MANDARINA")
    palabras.append("FOTOGRAFIA")
    palabras.append("SAINETE")
    palabras.append("BIBLIOTECA")
    palabras.append("ARO")
    palabras.append("MALETA")
    palabras.append("CASCO")
    palabras.append("INDUMENTARIA")
    palabras.append("GUATEQUE")
    palabras.append("AQUELARRE")
    palabras.append("PROFUNDIDAD")
    palabras.append("METEORITO")
    palabras.append("MURCIELAGO")
    palabras.append("MANDAMIENTO")
    palabras.append("UNIVERSIDAD")
    palabras.append("SALAMANCA")
    palabras.append("RUMANIA")
    palabras.append("PISCINA")
    palabras.append("CAMPAMENTO")
    palabras.append("PUEBLO")
    palabras.append("ARRENDATARIO")
    palabras.append("PATROCINADOR")
    palabras.append("METICULOSO")
    palabras.append("MORADO")
    palabras.append("ATISBAR")
    palabras.append("INEFABLE")
    palabras.append("DISTRITO")
    palabras.append("OSADIA")
    palabras.append("ABNEGACION")
    palabras.append("ERUDICION")
    palabras.append("TIQUISMIQUIS")
    palabras.append("ALMENDRA")
    return palabras.randomElement()!
}

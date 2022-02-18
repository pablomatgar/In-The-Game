// Pablo Mateos García

import UIKit

class Juego1ViewController: UIViewController{
    
    @IBOutlet weak var vieww: UIView!
    @IBOutlet weak var texto: UILabel!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var reloadBt: UIButton!
    
    var imagenes = [UIImage]()
    var timer : Timer?
    var counter = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenes.removeAll() //Por si hay imágenes de la anterior partida
        texto.text = "IMAGEN A BUSCAR"
        reloadBt.isHidden = true
        //Inicializamos contador y tiempos
        counter = 2
        timer = nil
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(procesarTimeInv), userInfo: nil, repeats: true)
        cargarImagenes()
        //Colocamos las imágenes aleatoriamente
        for img in images{
            let num = imagenes.indices.randomElement()!
            img.image = imagenes[num]
            imagenes.remove(at: num)
        }
        //Vemos que imagen vamos a tener que buscar y creamos botón sobre ella
        let imgClick = images.randomElement()
        image.image = imgClick?.image
        let botonClick = UIButton.init(frame: imgClick!.frame)
        self.view.addSubview(botonClick)
        botonClick.addTarget(self, action: #selector(clickImg(_:)), for: .touchUpInside)
    }
    
    @IBAction func clickImg(_ sender: UIButton) {
        //Paramos tiempo
        timer?.invalidate()
        timer = nil
        vieww.isHidden = false
        //Damos puntos en función del tiempo
        if(counter<=1){
            texto.text = "¡FELICIDADES! \n Puntos obtenidos: 1 punto"
            let user = UserDefaults.standard
            user.set(user.integer(forKey: "puntosJuego1") + 1, forKey: "puntosJuego1")
        }
        else{
            texto.text = "¡FELICIDADES! \n Puntos obtenidos: 0 puntos \n Para conseguir puntos, hazlo en un segundo!"
        }
        reloadBt.isHidden = false
        sender.removeFromSuperview() //Borramos el botón, para que no exista si se vuelve a jugar
    }
    
    @objc func procesarTime() {
        //Contamos el tiempo que tarda el usuario en buscar la foto (lo incrementamos en 1)
        counter += 1
    }
    
    @objc func procesarTimeInv() {
        //Contamos el tiempo que se muestra la imagen a buscar antes de jugar (decrementamos en 1 el tiempo)
        counter -= 1
        if(counter==0){ //Si llega a 0, iniciamos el contador del usuario
            timer?.invalidate()
            counter = 0
            vieww.isHidden = true
            timer = nil
            timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(procesarTime), userInfo: nil, repeats: true)
        }
    }

    func cargarImagenes(){ //Las cargamos y borramos una al azar al necesitar solo 18
        imagenes.append(UIImage.init(named: "1.jpg")!)
        imagenes.append(UIImage.init(named: "2.jpg")!)
        imagenes.append(UIImage.init(named: "3.jpg")!)
        imagenes.append(UIImage.init(named: "4.png")!)
        imagenes.append(UIImage.init(named: "5.jpg")!)
        imagenes.append(UIImage.init(named: "6.jpg")!)
        imagenes.append(UIImage.init(named: "7.jpg")!)
        imagenes.append(UIImage.init(named: "8.jpg")!)
        imagenes.append(UIImage.init(named: "9.jpg")!)
        imagenes.append(UIImage.init(named: "10.png")!)
        imagenes.append(UIImage.init(named: "11.jpg")!)
        imagenes.append(UIImage.init(named: "12.jpg")!)
        imagenes.append(UIImage.init(named: "13.png")!)
        imagenes.append(UIImage.init(named: "14.jpg")!)
        imagenes.append(UIImage.init(named: "15.png")!)
        imagenes.append(UIImage.init(named: "16.jpg")!)
        imagenes.append(UIImage.init(named: "17.jpg")!)
        imagenes.append(UIImage.init(named: "18.png")!)
        imagenes.append(UIImage.init(named: "19.jpg")!)
        imagenes.remove(at: Int.random(in: 0...18))
    }
    
    @IBAction func reload() {
        viewDidLoad()
    }
    
}

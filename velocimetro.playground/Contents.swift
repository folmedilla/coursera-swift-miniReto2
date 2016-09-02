
import UIKit

enum Velocidades: Int {
    
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    init(velocidadInicial: Velocidades) {
        self = velocidadInicial
    }

    /*
     * Devuelve el valor de velocidad a la siguiente velocidad gradual 
     */
    func obtenerSiguiente() -> Velocidades {
        switch self {
        case .Apagado:
            return .VelocidadBaja
        case .VelocidadBaja:
            return .VelocidadMedia
        case .VelocidadMedia:
            return .VelocidadAlta
        case .VelocidadAlta:
            return .VelocidadMedia
        }
    }
    
    /*
     * Devuelve una cadena con la leyenda de la velocidad actual
     */
    func obtenerLeyenda() -> String {
        switch self {
        case .Apagado:
            return "Apagado"
        case .VelocidadBaja:
            return "Velocidad baja"
        case .VelocidadMedia:
            return "Velocidad media"
        case .VelocidadAlta:
            return "Velocidad alta"
        }
    }
    
}

class Auto {
    
    var velocidad: Velocidades
    
    init() {
        self.velocidad = .Apagado;
    }
    
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena: String) {
        self.velocidad = self.velocidad.obtenerSiguiente()
        return (self.velocidad.rawValue, self.velocidad.obtenerLeyenda())
    }
    
}

var auto = Auto()

for i in 1...20 {
    var (actual, velocidadEnCadena) = auto.cambioDeVelocidad()
    print("\(actual), \(velocidadEnCadena)")
}
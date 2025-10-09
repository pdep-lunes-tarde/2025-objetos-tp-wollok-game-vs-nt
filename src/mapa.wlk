import wollok.game.*
import tpIntegrador.*


class Auto {
    var position 
    var direccion 
    const velocidad

    method image() {return "auto.png" }

    method mover() {
        if (direccion == "izquierda") {position = position.left(velocidad)}
        if (direccion == "derecha") {position = position.rigth(velocidad)}
        if(self.estaFueraDelMapa()){
            const nuevaX = wraparound.aplicarA(position.x(), 0, juegoCrossyRoad.ancho())
            position = new Position(x=nuevaX, y=position.y())
        }
        return position
    }

    method estaFueraDelMapa() {
        return position.x() < 0 or position.x() >= juegoCrossyRoad.ancho()
    }
    
    method position() {
        return position
    }

    method position(nuevaPosicion) {
        position = nuevaPosicion
    }

    method direccion()  = direccion
    
}

object wraparound {
    method aplicarA(numero, topeInferior, topeSuperior) {
        if(numero < topeInferior) {
            return topeSuperior
        } else if(numero > topeSuperior) {
            return topeInferior
        } else {
            return numero
        }
    }
}
object izquierda {
    method siguientePosicion(posicion) {
        return posicion.left(1)
    }
}
object derecha {
    method siguientePosicion(posicion) {
        return posicion.right(1)
    }
}




class CalleBase {
    var y 
    var autos = []

    method generarAutosIniciales() {
        autos.forEach { auto =>
            const xInicial = if (auto.direccion() == "izquierda") juegoCrossyRoad.ancho() - 1 else 0
            auto.position(new Position(x=xInicial, y = y))
            game.addVisual(auto)
        }
    }

    method moverAutos() {
        autos.forEach({auto=>game.onTick(200, "movimiento", { auto.mover() })})
    }       
}

// /* === Carriles individuales === */
// object calle1 inherits CalleBase {
//     method iniciar() { self.configurar(6,"derecha",1) }
// }

// object calle2 inherits CalleBase {
//     method iniciar() { self.configurar(9, "izquierda", 2) }
// }

// object calle3 inherits CalleBase {
//     method iniciar() {self.configurar(12, "derecha", 3)}
// }

// /* === Mapa general === */
// object mapa {
//     const calles = [calle1, calle2, calle3]

//     method generarMapa() {
//         calles.forEach { c =>
//             c.iniciar()
//             c.generarAutosIniciales(3)
//         }
//     }

//     method actualizar() {
//         calles.forEach { c => c.moverAutos() }
//     }
// }
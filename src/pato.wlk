import wollok.game.*
import tpIntegrador.*
import mapa.*

object pato{
    var direccion = sinDireccion
    var posicion = new Position(x=14, y=1)

    method image() {
        return "segmento.png"
    }

    method position() {
        return posicion
    }

    method position(nuevaPosicion) {
        posicion = nuevaPosicion
    }

    method direccion(nuevaDireccion) {
        direccion = nuevaDireccion
    }

    method move() {
        const nuevaPosicion = direccion.siguientePosicion(posicion)

        posicion = self.limite(nuevaPosicion)
    }

    method limite(posicionACorregir) {
        const nuevaY = tope.aplicarA(posicionACorregir.y(), 0, juegoCrossyRoad.alto()-1 )
        const nuevaX = tope.aplicarA(posicionACorregir.x(), 0, juegoCrossyRoad.ancho()-1 )

        return new Position(x=nuevaX, y=nuevaY)
    }
    
}




object izquierda {
    method siguientePosicion(posicion) {
        return posicion.left(1)
    }
}
object abajo {
    method siguientePosicion(posicion) {
        return posicion.down(1)
    }
}
object arriba {
    method siguientePosicion(posicion) {
        return posicion.up(1)
    }
}
object derecha {
    method siguientePosicion(posicion) {
        return posicion.right(1)
    }
}

object sinDireccion {
    method siguientePosicion(posicion) {
        return posicion
    }
}

object tope {
    method aplicarA(numero, topeInferior, topeSuperior) {
        if(numero < topeInferior) {
            return topeInferior
        } else if(numero > topeSuperior ) {
            return topeInferior
        } else {
            return numero
        }
    }
}


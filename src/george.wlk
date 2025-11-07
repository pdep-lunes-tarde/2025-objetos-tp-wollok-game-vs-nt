import wollok.game.*
import tpIntegrador.*
import mapa.*

object george{
    var direccion = sinDireccion
    var posicion = new Position(x=14, y=1)

    method image() {
        return direccion.image()
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
        const nuevaX = tope.aplicarX(posicionACorregir.x(), 0, juegoCrossyRoad.ancho()-1 )

        return new Position(x=nuevaX, y=nuevaY)
    }
    
}




object izquierda {
    method image() { return "george_izquierda.png" }
    method siguientePosicion(posicion) { return posicion.left(1) }
}

object derecha {
    method image() { return "george_derecha.png" }
    method siguientePosicion(posicion) { return posicion.right(1) }
}

object arriba {
    method image() { return "george_arriba.png" }
    method siguientePosicion(posicion) { return posicion.up(1) }
}

object abajo {
    method image() { return "george_abajo.png" }
    method siguientePosicion(posicion) { return posicion.down(1) }
}

object sinDireccion {
    method image() { return "george_arriba.png" }
    method siguientePosicion(posicion) { return posicion }
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

    method aplicarX(numero, topeIzq, topeDer) {
        if(numero < topeIzq) {
            return topeIzq
        } else if(numero > topeDer ) {
            return topeDer
        } else {
            return numero
        }
    }
}


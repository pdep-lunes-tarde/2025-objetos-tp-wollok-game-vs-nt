import wollok.game.*
import tpIntegrador.*

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
        } else if(numero > topeSuperior) {
            return topeSuperior 
        } else {
            return numero
        }
    }
}


//===========================Mapa===============

class Auto{
    var posicion 
    var direccion 
    var velocidad 
    var imagen 

    method init(NuevaPosicion, NuevaDireccion, NuevaVelocidad, NuevaImagen) {
        posicion = NuevaPosicion
        direccion = NuevaDireccion
        velocidad = NuevaVelocidad
        imagen = NuevaImagen
    }

    method imagen() { imagen }

    method mover() {
      if (direccion == "derecha") {posicion = posicion.left(velocidad)}
      if (direccion == "izquierda") { posicion = posicion.right(velocidad)}
    }   
    
     method estaFueraDelMapa() {
        posicion.x() < 0 || posicion.x() > juegoCrossyRoad.ancho() - 1
    }
}

class Calle{
    var y
    var direccion
    var velocidad
    var autos = []

    method init(NuevaPosicion, NuevaDireccion, NuevaVelocidad) {
        y = NuevaPosicion
        direccion = NuevaDireccion
        velocidad = NuevaVelocidad
        autos = []
    }

    method AgregarAutos(cantidad) {
      (1...cantidad).forEach({cant=>
       const posicionX = random(0, juegoCrossyRoad.ancho() - 1)
       const nuevoAuto = new Auto(new Position(x=xInicial, y=y), velocidad, direccion, "auto.jpg")
        autos.add(nuevoAuto)
        game.addVisual(nuevoAuto)
       })
    }

    method moverAutos() {
        autos.forEach { auto =>
            auto.mover()
            if (auto.estaFueraDelMapa()) {
                game.removeVisual(auto)
                autos.remove(auto)
                self.crearAutoNuevo()
            }
        }
    }

    method crearAutoNuevo() {
        const posicionX = if (direccion == "izquierda") juegoCrossyRoad.ancho() - 1 else 0
        const nuevoAuto = new Auto(new Position(x=xInicial, y=y), velocidad, direccion, "auto.jpg")
        autos.add(nuevoAuto)
        game.addVisual(nuevoAuto)
    }
}

object mapa {
    const calles = [
        new Calle(5, "derecha", 1),
        new Calle(8, "izquierda", 2),
        new Calle(11, "derecha", 3)
    ]

    method generarMapa() {
        calles.forEach { calles => calles.generarAutosIniciales(3) }
    }

    method actualizar() {
        calles.forEach { calles => calles.moverAutos() }
    }
}
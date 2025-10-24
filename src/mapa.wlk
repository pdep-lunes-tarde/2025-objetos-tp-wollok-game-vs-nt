import wollok.game.*
import tpIntegrador.*
import george.*
import generarZombies.*



class Zombie {
    var position 
    var direccion 
    const velocidad

    method image() {return "zombie.png" }

    method mover() {
        if (direccion == "izquierda") {position = position.left(velocidad)}
        if (direccion == "derecha") {position = position.right(velocidad)}
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

    method chocasteConGeorge(george) {
        game.addVisual(gameOver)

        juegoCrossyRoad.restart()

        puntos.resetear()   

    }

    method position(nuevaPosicion) {
        position = nuevaPosicion
    }

    method direccion()  = direccion
    
}

class Moneda {
    const position
    method image() {return "m.png" }

    method position() {
        return position
    }

    method chocasteConGeorge(george) {
        game.removeVisual(self)
        puntos.agregarPunto(100) 
        juegoCrossyRoad.actualizarDificultad()
    }

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


class CalleBase {
    var y 
    var zombies = []

    method generarZombiesIniciales() {
        zombies.forEach { zombie =>
            game.addVisual(zombie)
        }
    }

    method moverZombies(velocidadBase) {
        zombies.forEach({zombie=>game.onTick(velocidadBase, "movimiento", { zombie.mover() })})
    }       
}

object generartodosloszombies{
    var calles = [calle1, calle2, calle3, calle4, calle5, calle6, calle7, calle8, calle9, calle10]

    method generar() {
        calles.forEach({ unaCalle => unaCalle.generar() })
    }

    method actualizarVelocidadGlobal(nuevaVelocidad) {
    calles.forEach({ calle =>
        calle.obtenerZombies().forEach({ zombie =>
            game.onTick(nuevaVelocidad, "movimiento", { zombie.mover() })
        })
    })
}
}   


object puntos {
    var puntaje = 0

    method agregarPunto() {
        puntaje = puntaje + 1
    }

    method agregarPunto(puntajePorMoneda) {
        puntaje = puntaje + puntajePorMoneda
    }


    method obtenerPuntaje() {
        return puntaje
    }
    
    method resetear() {
        puntaje = 0
    }

    method position() {
        return game.at(game.width() -7 , game.height() - 1)
    }

    method text() {
       return "Puntaje: " + self.obtenerPuntaje()
    }

    method size() {
        return 32  
    }
}

object gameOver {
    method image() { return "gameover.png" }
    method position() { return new Position(x=7, y=12) } 
}







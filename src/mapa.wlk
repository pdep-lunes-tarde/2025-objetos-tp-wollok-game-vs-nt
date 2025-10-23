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

    method moverZombies(velocidad) {
        zombies.forEach({zombie=>game.onTick(velocidad, "movimiento", { zombie.mover() })})
    }       
}

object generartodosloszombies{
    method generar() {
        calle1.generar()
        calle2.generar()
        calle3.generar()
        calle4.generar()
        calle5.generar()
        calle6.generar()
        calle7.generar()
        calle8.generar()
        calle9.generar()
        calle10.generar()          
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







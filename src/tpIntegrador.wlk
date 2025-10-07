import wollok.game.*
import pato.*


object juegoCrossyRoad{
    const intervaloDeTiempoInicial = 90
    var intervaloDeTiempo = intervaloDeTiempoInicial

    method ancho() {
        return 32
    }

    method alto() {
        return 32
    }

    method intervaloDeTiempo() {
        return intervaloDeTiempo
    }

    
    method configurar(){
        game.width(self.ancho())
        game.height(self.alto())
        game.boardGround("fondo2.png")
        game.cellSize(32)
        game.addVisual(pato)

        keyboard.right().onPressDo {
            pato.direccion(derecha)
            pato.move()
        }
        keyboard.d().onPressDo {
            pato.direccion(derecha)
            pato.move()
        }
        keyboard.left().onPressDo {
            pato.direccion(izquierda)
            pato.move()
        }
        keyboard.a().onPressDo {
            pato.direccion(izquierda)
            pato.move()
        }
        keyboard.up().onPressDo {
            pato.direccion(arriba)
            pato.move()
        }
        keyboard.w().onPressDo {
            pato.direccion(arriba)
            pato.move()
        }
        keyboard.down().onPressDo {
            pato.direccion(abajo)
            pato.move()
        }
        keyboard.s(){
            pato.direccion(abajo)
            pato.move()
        }

    }

    method jugar(){
        self.configurar()
        mapa.generarMapa()

        game.whenTimePassedDo(intervaloDeTiempo) {
            mapa.actualizar()
        }
        game.start()
    }
}
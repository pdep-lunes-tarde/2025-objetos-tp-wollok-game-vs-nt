import wollok.game.*
import mapa.*
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

        const auto = new Auto(position = new Position(x=0,y=0),direccion="izquierda",velocidad =1) 
        const unaCalle = new CalleBase(y= 9, autos=[auto])
        unaCalle.generarAutosIniciales()
        unaCalle.moverAutos()

    }

    method jugar(){
        self.configurar()

        game.start()

        // game.whenTimePassedDo(5000) {
        //     mapa.actualizar()
        // }
    }
}
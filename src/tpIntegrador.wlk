import wollok.game.*
import mapa.*
import pato.*
import generarAutos.*


object juegoCrossyRoad{
    const intervaloDeTiempoInicial = 90
    var intervaloDeTiempo = intervaloDeTiempoInicial
    var started = false

    method ancho() {
        return 32
    }

    method alto() {
        return 32
    }

    method intervaloDeTiempo() {
        return intervaloDeTiempo
    }

    method configurarTablero(){
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(32)
        game.boardGround("fondo01.jpg")
    }

    method configurar(){
        
        game.addVisual(pato)
        game.addVisual(puntos)

        game.onTick(5000, "Moneda", {
            const nuevaMoneda = new Moneda(position=new Position(
                x=0.randomUpTo(self.ancho()),
                y=0.randomUpTo(self.alto())
                )
            )
            game.addVisual(nuevaMoneda)
        })

        game.onCollideDo(pato, {elemento => 
        elemento.chocasteConPato(pato)
        })
        

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
            puntos.agregarPunto()
        }
        keyboard.w().onPressDo {
            pato.direccion(arriba)
            pato.move()
            puntos.agregarPunto()
        }
        keyboard.down().onPressDo {
            pato.direccion(abajo)
            pato.move()
        }
        keyboard.s(){
            pato.direccion(abajo)
            pato.move()
        }

        generartodoslosautos.generar()

    }

    method restart() {
        intervaloDeTiempo = intervaloDeTiempoInicial
        started = false
        self.configurarTablero()
        self.mostrarPortada()
        
        pato.position(new Position(x=14, y=1))
    }

    method mostrarPortada(){
        started = false

        game.addVisual(portada)


        keyboard.any().onPressDo {
            if (!started) {
                started = true
                game.removeVisual(portada)
                game.clear()
                self.configurar() 
            }
        }
    }

    method jugar(){
        game.start()
        self.configurarTablero()

        self.mostrarPortada()
    
    }
}

object portada {
    method image() { return "portada3.jpg" }
    method position() { return new Position(x=0, y=0) } // ocupar toda la pantalla
}


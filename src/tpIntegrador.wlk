import wollok.game.*
import mapa.*
import george.*
import generarZombies.*


object juegoCrossyRoad{
    const intervaloDeTiempoInicial = 90
    var intervaloDeTiempo = intervaloDeTiempoInicial
    var velocidadZombies = 0

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
        
        game.addVisual(george)
        game.addVisual(puntos)

        game.onTick(5000, "Moneda", {
            const nuevaMoneda = new Moneda(position=new Position(
                x=0.randomUpTo(self.ancho()),
                y=0.randomUpTo(self.alto())
                )
            )
            game.addVisual(nuevaMoneda)
        })

        game.onCollideDo(george, {elemento => 
        elemento.chocasteConGeorge(george)
        })
        

        keyboard.right().onPressDo {
            george.direccion(derecha)
            george.move()
        }
        keyboard.d().onPressDo {
            george.direccion(derecha)
            george.move()
        }
        keyboard.left().onPressDo {
            george.direccion(izquierda)
            george.move()
        }
        keyboard.a().onPressDo {
            george.direccion(izquierda)
            george.move()
        }
        keyboard.up().onPressDo {
            george.direccion(arriba)
            george.move()
            puntos.agregarPunto()
            self.actualizarDificultad()
        }
        keyboard.w().onPressDo {
            george.direccion(arriba)
            george.move()
            puntos.agregarPunto()
            self.actualizarDificultad()
        }
        keyboard.down().onPressDo {
            george.direccion(abajo)
            george.move()
        }
        keyboard.s(){
            george.direccion(abajo)
            george.move()
        }

        generadorDeZombies.generar()

    }

    method restart() {
        keyboard.any().onPressDo {
        game.removeVisual(gameOver)
        intervaloDeTiempo = intervaloDeTiempoInicial
       
        game.clear()
        george.position(new Position(x=14, y=1))

        self.mostrarPortada()
        game.start()
        }
    }

    method actualizarDificultad() {
    const puntajeActual = puntos.obtenerPuntaje()

    if (puntajeActual >= 1000) {
        game.addVisual(victoria)
        game.stop()
    } else if (puntajeActual >= 250) {
        velocidadZombies = 300
        generadorDeZombies.actualizarVelocidadGlobal(velocidadZombies)
    } else if (puntajeActual >= 500) {
        velocidadZombies = 500
        generadorDeZombies.actualizarVelocidadGlobal(velocidadZombies)
    } else if (puntajeActual >= 750) {
        velocidadZombies = 700
        generadorDeZombies.actualizarVelocidadGlobal(velocidadZombies)
    }
}

    method mostrarPortada(){
        

        game.addVisual(portada)


        keyboard.any().onPressDo {
                game.removeVisual(portada)
                game.clear()
                self.configurar() 
            
        }
    }

    method jugar(){
        
        self.configurarTablero()
        game.start()

        self.mostrarPortada()
    
    }
}

object portada {
    method image() { return "portada3.jpg" }
    method position() { return new Position(x=0, y=0) } // ocupar toda la pantalla
}

object victoria{
    method image() { return "win3.png" }
    method position() { return new Position(x=3, y=10) } 
}

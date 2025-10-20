import mapa.*
import pato.*
import wollok.game.*
import tpIntegrador.*

object calle1 {
    const auto = new Auto(position = new Position(x=0,y=5),direccion="izquierda",velocidad =1) 
    const unaCalle = new CalleBase(y= 5, autos=[auto])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(120)
    }
}
object calle2 {
    const auto = new Auto(position = new Position(x=0,y=9),direccion="derecha",velocidad =1)
    const auto2 = new Auto(position = new Position(x=9,y=9),direccion="derecha",velocidad =1)
    const auto3 = new Auto(position = new Position(x=19,y=9),direccion="derecha",velocidad =1)   
    const unaCalle = new CalleBase(y= 9, autos=[auto,auto2,auto3])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(150)
    }
}

object calle3 {
    const auto = new Auto(position = new Position(x=0,y=11),direccion="izquierda",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=15,y=11),direccion="izquierda",velocidad =1)  
    const auto3 = new Auto(position = new Position(x=30,y=11),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 11, autos=[auto,auto2,auto3])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(180)
    }
}

object calle4 {
    const auto = new Auto(position = new Position(x=0,y=14),direccion="izquierda",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=20,y=14),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 14, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(150)
    }
}

object calle5 {
    const auto = new Auto(position = new Position(x=0,y=15),direccion="izquierda",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=15,y=15),direccion="izquierda",velocidad =1) 
    const unaCalle = new CalleBase(y= 15, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(125)
    }
}
object calle6 {
    const auto = new Auto(position = new Position(x=0,y=18),direccion="derecha",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=19,y=18),direccion="derecha",velocidad =1)   
    const unaCalle = new CalleBase(y= 18, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(150)
    }
}
object calle7 {
    const auto = new Auto(position = new Position(x=0,y=21),direccion="izquierda",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=15,y=21),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 21, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(150)
    }
}
object calle8 {
    const auto = new Auto(position = new Position(x=0,y=22),direccion="derecha",velocidad =1)
    const auto2 = new Auto(position = new Position(x=20,y=22),direccion="derecha",velocidad =1)   
    const unaCalle = new CalleBase(y= 22, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(100)
    }
}
object calle9 {
    const auto = new Auto(position = new Position(x=0,y=24),direccion="izquierda",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=19,y=24),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 24, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(190)
    }
}

object calle10 {
    const auto = new Auto(position = new Position(x=0,y=28),direccion="izquierda",velocidad =1) 
    const auto2 = new Auto(position = new Position(x=18,y=28),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 28, autos=[auto,auto2])
    
    method generar() {
       unaCalle.generarAutosIniciales()
       unaCalle.moverAutos(90)
    }
}





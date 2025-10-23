import mapa.*
import george.*
import wollok.game.*
import tpIntegrador.*

object calle1 {
    const zombie = new Zombie(position = new Position(x=0,y=5),direccion="izquierda",velocidad =1) 
    const unaCalle = new CalleBase(y= 5, zombies=[zombie])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(120)
    }
}
object calle2 {
    const zombie = new Zombie(position = new Position(x=0,y=9),direccion="derecha",velocidad =1)
    const zombie2 = new Zombie(position = new Position(x=9,y=9),direccion="derecha",velocidad =1)
    const zombie3 = new Zombie(position = new Position(x=19,y=9),direccion="derecha",velocidad =1)   
    const unaCalle = new CalleBase(y= 9, zombies=[zombie,zombie2,zombie3])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(150)
    }
}

object calle3 {
    const zombie = new Zombie(position = new Position(x=0,y=11),direccion="izquierda",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=15,y=11),direccion="izquierda",velocidad =1)  
    const zombie3 = new Zombie(position = new Position(x=30,y=11),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 11, zombies=[zombie,zombie2,zombie3])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(180)
    }
}

object calle4 {
    const zombie = new Zombie(position = new Position(x=0,y=14),direccion="izquierda",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=20,y=14),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 14, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(150)
    }
}

object calle5 {
    const zombie = new Zombie(position = new Position(x=0,y=15),direccion="izquierda",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=15,y=15),direccion="izquierda",velocidad =1) 
    const unaCalle = new CalleBase(y= 15, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(125)
    }
}
object calle6 {
    const zombie = new Zombie(position = new Position(x=0,y=18),direccion="derecha",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=19,y=18),direccion="derecha",velocidad =1)   
    const unaCalle = new CalleBase(y= 18, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(150)
    }
}
object calle7 {
    const zombie = new Zombie(position = new Position(x=0,y=21),direccion="izquierda",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=15,y=21),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 21, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(150)
    }
}
object calle8 {
    const zombie = new Zombie(position = new Position(x=0,y=22),direccion="derecha",velocidad =1)
    const zombie2 = new Zombie(position = new Position(x=20,y=22),direccion="derecha",velocidad =1)   
    const unaCalle = new CalleBase(y= 22, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(100)
    }
}
object calle9 {
    const zombie = new Zombie(position = new Position(x=0,y=24),direccion="izquierda",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=19,y=24),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 24, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(190)
    }
}

object calle10 {
    const zombie = new Zombie(position = new Position(x=0,y=28),direccion="izquierda",velocidad =1) 
    const zombie2 = new Zombie(position = new Position(x=18,y=28),direccion="izquierda",velocidad =1)   
    const unaCalle = new CalleBase(y= 28, zombies=[zombie,zombie2])
    
    method generar() {
       unaCalle.generarZombiesIniciales()
       unaCalle.moverZombies(90)
    }
}





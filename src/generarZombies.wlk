import mapa.*
import george.*
import wollok.game.*
import tpIntegrador.*

 object creadorDeCalles  {

     method crearCalle(y, listaDeZombies) {
         const calle = new CalleBase(y = y, zombies = listaDeZombies)
         return calle
     }

     method generarCalle(calle) {
         calle.generarZombiesIniciales()
         calle.moverZombies(120)
     }

     method crearZombie(x, y, direccion, vel) {
         return new Zombie(position = new Position(x = x, y = y), direccion = direccion, velocidad = vel)
     }
    
 }

 const calle1 = creadorDeCalles.crearCalle(
     5,
     [creadorDeCalles.crearZombie(0,5,"izquierda",1)]
 )

 const calle2 = creadorDeCalles.crearCalle(
     9,
     [creadorDeCalles.crearZombie(0, 9, "derecha", 1),
      creadorDeCalles.crearZombie(9, 9, "derecha", 1),
      creadorDeCalles.crearZombie(19, 9, "derecha", 1)]
 )

 const calle3 = creadorDeCalles.crearCalle(
     11,
     [creadorDeCalles.crearZombie(0, 11, "izquierda", 1),
      creadorDeCalles.crearZombie(15, 11, "izquierda", 1),
      creadorDeCalles.crearZombie(30, 11, "izquierda", 1)]
 )

 const calle4 = creadorDeCalles.crearCalle(
     14,
     [creadorDeCalles.crearZombie(0, 14, "izquierda", 1),
      creadorDeCalles.crearZombie(20, 14, "izquierda", 1)]
 )

 const calle5 = creadorDeCalles.crearCalle(
     15,
     [creadorDeCalles.crearZombie(0, 15, "izquierda", 1),
      creadorDeCalles.crearZombie(15, 15, "izquierda", 1)]
 )

 const calle6 = creadorDeCalles.crearCalle(
     18,
     [creadorDeCalles.crearZombie(0, 18, "derecha", 1),
      creadorDeCalles.crearZombie(19, 18, "derecha", 1)]
 )

 const calle7 = creadorDeCalles.crearCalle(
     21,
     [creadorDeCalles.crearZombie(0, 21, "izquierda", 1),
      creadorDeCalles.crearZombie(15, 21, "izquierda", 1)]
 )

 const calle8 = creadorDeCalles.crearCalle(
     22,
     [creadorDeCalles.crearZombie(0, 22, "derecha", 1),
      creadorDeCalles.crearZombie(20, 22, "derecha", 1)]
 )

 const calle9 = creadorDeCalles.crearCalle(
     24,
     [creadorDeCalles.crearZombie(0, 24, "izquierda", 1),
      creadorDeCalles.crearZombie(19, 24, "izquierda", 1)]
 )

 const calle10 = creadorDeCalles.crearCalle(
     28,
     [creadorDeCalles.crearZombie(0, 28, "derecha", 1),
      creadorDeCalles.crearZombie(18, 28, "derecha", 1)]
 )
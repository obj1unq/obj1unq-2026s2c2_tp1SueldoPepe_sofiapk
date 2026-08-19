import empleades.*
import categorias.*

// Bono por Presentismo
object normal {
  const montoPorAsistenciaCompleta = 2000 // magic number
  const montoPorUnaSolaFalta = 1000 // magic number
  
  method importe(empleade) {
    return
    if (empleade.ausencias() == 0){
      montoPorAsistenciaCompleta
    } else if (empleade.ausencias() == 1 ){
      montoPorUnaSolaFalta
    } else {
      0 // bonoNulo
    }
  }
}

object ajuste {
  const montoPorAsistenciaCompleta = 100 // magic number

  method importe(empleade){
    return if (empleade.ausencias() == 0 ) montoPorAsistenciaCompleta else 0
  }
}

object demagógico {
  const montoPorNetoMínimo = 500 // magic number
  const montoPorNetoMáximo = 300 // magic number

  method importe(empleade){
    return if (empleade.sueldoNeto() < 18000 ) montoPorNetoMínimo else montoPorNetoMáximo
  }
}

// Bono por Resultados
object porcentaje {
  const porcentaje = 0.1 // magic number, es el 10%

  method importe(empleade) = empleade.sueldoNeto() * porcentaje
}

object montoFijo {
  method importe(empleade) = 800
}

// Aplica tanto para BonoPorPresentismo como para BonoPorResultados
object bonoNulo {
  method importe(empleade) = 0
}

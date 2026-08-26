// PEPE
object pepe {
  var categoría = cadete
  var bonoPorPresentismo = montoFijo
  var bonoPorResultados = normal
  var ausencias = 0 // acumulador

    // getters
    method categoría() = categoría
    method bonoPorResultados() = bonoPorResultados
    method bonoPorPresentismo() = bonoPorPresentismo
    method ausencias() = ausencias

    // setters
    method categoría(_categoría) {
      categoría = _categoría
    }

    method bonoPorResultados(_bonoPorResultados) {
      bonoPorResultados = _bonoPorResultados
    }

    method bonoPorPresentismo(_bonoPorPresentismo) {
      bonoPorPresentismo = _bonoPorPresentismo
    }
    
    method ausencias(_ausencias) {
      ausencias = _ausencias
    }

    method sueldo() = self.sueldoNeto() + bonoPorResultados.importe(self) + bonoPorPresentismo.importe(self)

    method sueldoNeto() = self.categoría().neto()
}

// Categorías
object gerente {
  method neto() = 15000
}

object cadete {
  method neto() = 20000
}

object vendedore {
  var hayVentas = true
  const porcentaje = 1.25 // magic number, es el 25%
  const montoBasePorMuchasVentas = 16000 // magic number

  method neto() {
    return if (hayVentas) montoBasePorMuchasVentas * porcentaje else montoBasePorMuchasVentas
  }

  method activarAumentoPorMuchasVentas() {
    hayVentas = true
  }

  method desactivarAumentoPorMuchasVentas() {
    hayVentas = false
  }
}

object medioTiempo {
  var categoríaBase = gerente // puede ser cualquier otra categoría

  // setter
  method categoríaBase(_categoríaBase) {
    categoríaBase = _categoríaBase
  }

  method neto() = categoríaBase.neto() / 2
}

// Bono por Presentismo
object normal {// $2000 pesos si la persona a quien se aplica no faltó nunca, $1000 si faltó sólo un día, $0 en cualquier otro caso.
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
  // $100 pesos si el empleado no faltó nunca, $0 en cualquier otro caso.
  const montoPorAsistenciaCompleta = 100 // magic number

  method importe(empleade){
    return if (empleade.ausencias() == 0 ) montoPorAsistenciaCompleta else 0
  }
}

object demagógico {
  // $500 pesos si el neto es menor a 18000, $300 en caso contrario. Para este bono no importa cuántas veces faltó el emplado.
  const montoPorNetoMínimo = 500 // magic number
  const montoPorNetoMáximo = 300 // magic number

  method importe(empleade){
    return if (empleade.sueldoNeto() < 18000 ) montoPorNetoMínimo else montoPorNetoMáximo
  }
}

//object nuloBP {
//  method importe(empleade) = 0
//}

// Bono por Resultados
object porcentaje {
  const porcentaje = 0.1 // magic number, es el 10%

  method importe(empleade) = empleade.sueldoNeto() * porcentaje
}

object montoFijo {
  method importe(empleade) = 800
}

//object nuloBR {
//  method importe(empleade) = 0
//}

// Aplica tanto para BP como para BR
object bonoNulo {
  method importe(empleade) = 0
}

// MORIA
object moria {
  var bonoPorResultados = montoFijo
  var categoría = vendedore
  const porcentaje = 1.3 // magic number, 30%

  // getters
    method categoría() = categoría
    method bonoPorResultados() = bonoPorResultados

  // setters
  method categoría(_categoría) {
    categoría = _categoría
  }

  method bonoPorResultados(_bonoPorResultados) {
    bonoPorResultados = _bonoPorResultados
  }

  method sueldo() = self.sueldoNeto() + bonoPorResultados.importe(self)

  method sueldoNeto() = self.categoría().neto() * porcentaje
}

// ROQUE
object roque {
  
}
/*
Roque, que en lugar de asignársele una categoría, se establece un neto de 28000 pesos.
El sueldo se calcula como neto + bono por resultados + 9000 pesos.
Para el bono por resultados, se usan las mismas opciones que para Pepe.
*/

// ERNESTO
object ernesto {
  var compañero = roque
}

/*
Ernesto, que trabaja junto con un compañero, que puede cambiar. El neto de Ernesto es igual al de su compañero.
Su sueldo se calcula como neto + bono por presentismo.
Para el bono por presentismo, usar las mismas opciones que para Pepe. Se sabe que Ernesto no falta nunca.
*/
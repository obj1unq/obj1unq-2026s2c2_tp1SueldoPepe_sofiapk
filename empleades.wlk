import bonos.*
import categorias.*

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

// MORIA
object moria {
  var bonoPorResultados = montoFijo
  var categoría = vendedore
  const porcentaje = 1.3 // magic number, 30%

  // getters
    method categoría() = categoría
    method bonoPorResultados() = bonoPorResultados

  // setteR
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
  const sueldoNeto = 28000
  var bonoPorResultados = montoFijo
  const adicional = 9000

  // getters
  method sueldoNeto() = sueldoNeto
  method bonoPorResultados() = bonoPorResultados

  // setter
  method bonoPorResultados(_bonoPorResultados) {
    bonoPorResultados = _bonoPorResultados
  }

  method sueldo() = self.sueldoNeto() + bonoPorResultados.importe(self) + adicional
}

// ERNESTO
object ernesto {
  var compañero = roque // puede cambiar de compa
  var bonoPorPresentismo = demagógico
  const ausencias = 0

  // getters
  method compañero() = compañero
  method ausencias() = ausencias
  method bonoPorPresentismo() = bonoPorPresentismo

  // setter
  method compañero(_compañero) {
    compañero = _compañero
  }

  method bonoPorPresentismo(_bonoPorPresentismo) {
    bonoPorPresentismo = _bonoPorPresentismo
  }

  method sueldoNeto() {
    return self.compañero().sueldoNeto() 
  }

  method sueldo() = self.sueldoNeto() + bonoPorPresentismo.importe(self)
}

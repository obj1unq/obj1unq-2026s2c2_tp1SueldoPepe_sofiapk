object pepe {
	var categoría = cadete
    var bonoPorPresentismo = montoFijo
    var bonoPorResultados = normal
    var faltas = 0 // acumulador

    // getters
    //method categoría() = categoría
    method bonoPorResultados() = bonoPorResultados
    method bonoPorPresentismo() = bonoPorPresentismo

    // setters
    //method categoría(_categoría) {
    //  categoría = _categoría
    //}

    method bonoPorResultados(_bonoPorResultados) {
      bonoPorResultados = _bonoPorResultados
    }

    method bonoPorPresentismo(_bonoPorPresentismo) {
      bonoPorPresentismo = _bonoPorPresentismo
    }

    method sueldo() = self.sueldoNeto() + self.bonoPorResultados() + self.bonoPorPresentismo()

    method sueldoNeto() {
        //
    }

    method ausencias() = ausencias
}


// Bono por Presentismo
object normal {

}

object ajuste {
  
}

object demagógico {
  
}

object nuloBP {
  
}

// Bono por Resultados


object porcentaje {
    
}

object montoFijo {
  
}

object nuloBR {
  
}


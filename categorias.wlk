
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
object cuentaCorriente {

	var saldo = 500

	method depositar(dinero) {
		saldo += dinero
	}

	method extraer(dinero) {
		saldo -= dinero
	}

	method saldo() {
		return saldo
	}

}

object cuentaConGastos {

	var saldo = 0
	var costoDeOperacion = 50

	method depositar(dinero) {
		saldo += dinero - costoDeOperacion
	}

	method extraer(dinero) {
		saldo -= dinero
	}

	method costoDeOperacion(_costoDeOperacion) {
		costoDeOperacion = _costoDeOperacion
	}

	method saldo() {
		return saldo
	}

}

object cuentaCombinada {

	var property cuentaPrimaria = cuentaConGastos
	var property cuentaSecundaria = cuentaCorriente

	method depositar(dinero) {
		cuentaPrimaria.depositar(dinero)
	}

	method extraer(dinero) {
		if (cuentaPrimaria.saldo() > dinero) {
			cuentaPrimaria.extraer(dinero)
		} else {
			cuentaSecundaria.extraer(dinero)
		}
	}

	method saldo() {
		return cuentaPrimaria.saldo().max(0) + cuentaSecundaria.saldo()
	}

}


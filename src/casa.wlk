import cuentasBancarias.*

object casaDePepeYJulian {

	var property cantidadDeViveres = 50
	var property montoDeReparaciones = 0

	method tieneViveresSuficientes() {
		return cantidadDeViveres >= 40
	}

	method hayQueHacerReparaciones() {
		return montoDeReparaciones > 0
	}

	method casaEnOrden() {
		return self.tieneViveresSuficientes() && not self.hayQueHacerReparaciones()
	}

	method gasto(tipoDeCuentaBancaria, dinero) {
		tipoDeCuentaBancaria.extraer(dinero)
	}

}

//Estrategias de ahorro
object minimoIndispensable {

	var property calidad = 1

	method comprar(casa, tipoDeCuentaBancaria) {
		if (not casa.tieneViveresSuficientes()) {
			casa.gasto(tipoDeCuentaBancaria, (40 - casa.cantidadDeViveres()) * calidad)
			casa.cantidadDeViveres(casa.cantidadDeViveres() + 40 - casa.cantidadDeViveres())
		}
	}

}

object full {

	const calidad = 5

	method comprar(casa, tipoDeCuentaBancaria) {
		if (casa.casaEnOrden()) {
			casa.gasto(tipoDeCuentaBancaria, (100 - casa.cantidadDeViveres()) * calidad)
			casa.cantidadDeViveres(casa.cantidadDeViveres() + (100 - casa.cantidadDeViveres()))
		} else {
			casa.gasto(tipoDeCuentaBancaria, 40 * calidad)
			casa.cantidadDeViveres((casa.cantidadDeViveres() + 40).min(100))
		}
		if (casa.montoDeReparaciones() - tipoDeCuentaBancaria.saldo() > 1000) {
			self.hacerTodasLasReparaciones(casa, tipoDeCuentaBancaria)
		}
	}

	method hacerTodasLasReparaciones(casa, tipoDeCuentaBancaria) {
		casa.gasto(tipoDeCuentaBancaria, casa.montoDeReparaciones())
		casa.montoDeReparaciones(0)
	}

}


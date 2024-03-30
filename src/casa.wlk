object casaDePepeYJulian {

	var property cantidadDeViveres = 50
	var property montoDeReparaciones = 0

	method tieneViveresSuficientes() {
		return cantidadDeViveres > 40
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


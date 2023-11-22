class Persona {
	var recursos = 20	// Cantidad de monedas
	var edad
	
	method recursos() = recursos
	
	method esDestacado() = edad.between(18,65) or recursos > 30
	
	method ganarMonedas(cantidad) { recursos += cantidad }
	method gastarMonedas(cantidad) { recursos -= cantidad }
	
	method cumplirAnios() { edad += 1 }
	
	method viveEn(planeta) = planeta.esHabitante(self)
	
	method trabajar(tiempo, planeta) {}
}

class Productor inherits Persona {
	const tecnicasConocidas = ["cultivo"]
	
	override method recursos() = recursos * tecnicasConocidas.size()
	
	override method esDestacado() = super() or tecnicasConocidas.size() > 5
	
	method realizarTecnica(tecnica, tiempo) {
		if(self.conoceTecnica(tecnica)) {
			self.ganarMonedas(3 * tiempo)
		} else {
			self.gastarMonedas(1)
		}
	}
	
	method conoceTecnica(tecnica) = tecnicasConocidas.contains(tecnica)
	
	method aprenderTecnica(tecnica) = tecnicasConocidas.add(tecnica)
	
	override method trabajar(tiempo, planeta) {
		if(self.viveEn(planeta)) {
			self.realizarTecnica(self.ultimaTecnicaAprendida(), tiempo)
		} else {
			throw new Exception(message = "El productor no pudo trabajar, pues no vive en el planeta")	
		}
	}
	
	method ultimaTecnicaAprendida() = tecnicasConocidas.last()
}

class Constructor inherits Persona {
	var cantConstRealizadas = 0
	var region
	
	override method recursos() = recursos + 10 * cantConstRealizadas
	
	override method esDestacado() = cantConstRealizadas > 5
	
	override method trabajar(tiempo, planeta) {
		planeta.nuevaConstruccion(self.construirSegunRegion(tiempo))
		self.gastarMonedas(5)
		cantConstRealizadas += 1
	}
	
	method construirSegunRegion(tiempo) = region.tipoDeConstruccion(tiempo, self)
	
	method propIndiceRecursos() = recursos.digits().min(5)
	
	method cantConstRealizadas() = cantConstRealizadas
}
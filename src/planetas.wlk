class Planeta {
	const habitantes = []
	const construcciones = []
	
	method delegacionDiplomatica() = (self.habitantesDestacados() + [self.habitanteConMasRecursos()]).asSet()
	method habitantesDestacados() = habitantes.filter{hab => hab.esDestacado()}
	method habitanteConMasRecursos() = habitantes.max{hab => hab.recursos()}
	
	method esValioso() = self.valorTotalDeConstrucciones() > 100
	method valorTotalDeConstrucciones() = construcciones.sum({ construc => construc.valor() })
	
	method hacerTrabajar(persona, tiempo) {
		persona.trabajar(tiempo, self)
	}
	
	method esHabitante(persona) = habitantes.contains(persona)
	
	method nuevaConstruccion(construccion) {
		construcciones.add(construccion)
	}
	
	method poseeConstruccion(construccion) = construcciones.contains(construccion)
	
	method hacerQueLaDelegacionTrabaje(delegacion, tiempo) {
		delegacion.forEach({ hab => self.hacerTrabajar(hab, tiempo) })
	}
	
	method invadir(planeta) {
		self.hacerQueLaDelegacionTrabaje(planeta.delegacionDiplomatica(), 20)
	}
}
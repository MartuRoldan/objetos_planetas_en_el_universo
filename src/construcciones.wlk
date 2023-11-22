class Muralla {
	var longitud
	const costoXUnidad = 10
	
	method valor() = longitud * costoXUnidad
}

class Museo {
	var superficieCubierta
	var indiceDeImportancia // Va de 1 a 5
	
	method indiceDeImpReal() = indiceDeImportancia.max(1).min(5)
	
	method valor() = superficieCubierta * self.indiceDeImpReal()
}
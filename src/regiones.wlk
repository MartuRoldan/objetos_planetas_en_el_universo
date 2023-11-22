import construcciones.*

object montania {
	method tipoDeConstruccion(tiempo, _) = new Muralla(longitud = tiempo)
}

object costa {
	method tipoDeConstruccion(tiempo, _) = new Museo(superficieCubierta = tiempo, indiceDeImportancia = 1)
}

object llanura {
	method tipoDeConstruccion(tiempo, constructor) = 
		if(!constructor.esDestacado()) new Muralla(longitud = tiempo/2) 
		else new Museo(superficieCubierta = tiempo, indiceDeImportancia = constructor.propIndiceRecursos())
}

object desierto {
	method tipoDeConstruccion(tiempo, constructor) =
		if(constructor.esInteligente()) new Muralla(longitud = tiempo * 2) 
		else new Museo(superficieCubierta = tiempo, indiceDeImportancia = 3)
}
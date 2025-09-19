import cosas.*

object camion {
	const property cosas = #{}
	
	// comportamientos del camion
	method cargar(unaCosa){
		self.verificarSiEstaCargada(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa){
		self.verificarCarga(unaCosa)
		cosas.remove(unaCosa)
	}

	// verificaciones
	method verificarCarga(unaCosa){
		if (not cosas.contains(unaCosa)){
			self.error("No se puede descargar una cosa que no 
						está en el camión")
		}
	}

	method verificarSiEstaCargada(unaCosa){
		if (cosas.contains(unaCosa)){
			self.error(unaCosa + "ya está cargada en el camión")
		}
	}
	
	// consultas y booleanos
	method tieneCargasPares(){
	// Tengo que recorrer el set de cosas y determinar si todas
	// tienen peso par
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
}


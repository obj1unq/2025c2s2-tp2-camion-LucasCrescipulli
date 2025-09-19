import cosas.*

object camion {
	const property cosas = #{}
		
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
}

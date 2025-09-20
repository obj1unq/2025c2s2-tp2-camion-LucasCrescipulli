import cosas.*

object camion {
	var property cosas = #{}
	const tara = 1000
	
	// comportamientos del camion
	method cargar(unaCosa){
		self.verificarSiEstaCargada(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa){
		self.verificarCarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method accidente(){
		cosas.forEach({cadaCosa => cadaCosa.accidente()})
	}

	method transportar(destino, camino){
		self.verificarCamino(camino)
		destino.cosas().addAll(cosas)
		cosas.clear()
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

	method verificarCamino(camino){
		if (not self.puedeCircularEnRutaConNivelMaximo(camino.nivelMaximoPeligrosidad())
			 || self.pesoTotal() > camino.pesoMaximoPermitido()){
			self.error("No se puede realizar el transporte por el camino indicado")
		}
	}
	
	// consultas y booleanos
	method tieneCargasPares(){
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method pesoTotal(){
		return tara + cosas.sum({cosa => cosa.peso()})
	}

	method estaExcedidoDePeso(){
		return self.pesoTotal() > 2500
	}

	method encontrarCosaPeligrosaDeNivel(nivelDePeligrosidad){
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelDePeligrosidad})
	}

	method cosasConNivelDePeligrosidadMayorA(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method cosasMasPeligrosasQue(cosaPeligrosa){
		return self.cosasConNivelDePeligrosidadMayorA(cosaPeligrosa.nivelPeligrosidad())
	}

	method puedeCircularEnRutaConNivelMaximo(nivel){
		return not(self.estaExcedidoDePeso()) && 
					self.cosasConNivelDePeligrosidadMayorA(nivel).isEmpty()
	}

	method tieneAlgoQuePesaEntre(primerValor, segundoValor){
	 	return cosas.any({cosa => cosa.peso() >= primerValor and cosa.peso() <= segundoValor})
	}

	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}

	method todosLosPesos(){
		return cosas.map({cosa => cosa.peso()})
	}

	method cantidadTotalDeBultos(){
		return cosas.sum({cosa => cosa.cantidadDeBultos()})
	}
}

object ruta9{
	const property nivelMaximoPeligrosidad = 20
	const property pesoMaximoPermitido = 99999999999 
}

object almacen{
	var property cosas = #{}
}

object caminosVecinales{
	const property nivelMaximoPeligrosidad = 99999999999
	var property pesoMaximoPermitido = 2000
}
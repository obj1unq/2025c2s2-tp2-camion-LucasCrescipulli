object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel{
	var property peso = 0
	method nivelPeligrosidad(){ return 1 }
}

object bumblebee{
	var transformacion = auto
	method peso(){ return 800 }
	method nivelPeligrosidad(){ 
		return transformacion.nivelPeligrosidad()
	}
	method transformacion(_transformacion){
		transformacion = _transformacion
	}
}

object auto{
	const nivelPeligrosidad = 15
	method nivelPeligrosidad() { return nivelPeligrosidad}
}

object robot{
	const nivelPeligrosidad = 30
	method nivelPeligrosidad() { return nivelPeligrosidad}
}

object paqueteDeLadrillos{
	const pesoPorLadrillo = 2
	var cantidadDeLadrillos = 0
	method peso(){
		return pesoPorLadrillo * cantidadDeLadrillos
	}
	method cantidadDeLadrillos(cantidad){
		cantidadDeLadrillos = cantidad
	}
	method nivelPeligrosidad(){ return 2 }
}

object bateriaAntiaerea{
	var property tieneMisiles = false
	method peso(){
		return if (tieneMisiles){
			300
		}
		else {
			200
		}
	}
	method nivelPeligrosidad(){
		return if (tieneMisiles){
			100
		}
		else {
			0
		}
	}
}

object residuosRadiactivos{
	var peso = 0
	method peso(_peso){ 
		peso = _peso 
	}
	method nivelPeligrosidad(){ return 200 }
}

object contenedorPortuario {
	const pesoBase = 100
	const cosasQueContiene = #{}
	method peso(){
		return pesoBase + cosasQueContiene.sum({cadaCosa => cadaCosa.peso()})
	}
	method nivelPeligrosidad(){
		return if (cosasQueContiene.isEmpty()){
			0
		}
		else {
			cosasQueContiene.max({cosa => cosa.nivelPeligrosidad()})
		}
	}
	method cosasQueContiene(cosas){
		cosasQueContiene.add(cosas)
	}
}

object embajaleDeSeguridad{
	var cosaQueEnvuelve = paqueteDeLadrillos
	method peso(){ return cosaQueEnvuelve.peso()}
	method cosaQueEnvuelve(cosa){
		cosaQueEnvuelve = cosa 
	}
	method nivelPeligrosidad(){
		return cosaQueEnvuelve.nivelPeligrosidad() / 2
	}
}
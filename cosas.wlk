object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantidadDeBultos(){
		return 1
	}
	method accidente(){
	}
}

object arenaAGranel{
	var peso = 0
	method nivelPeligrosidad(){ return 1 }
	method peso(_peso){
		peso = _peso
	}
	method peso(){
		return peso
	}
	method cantidadDeBultos(){
		return 1
	}
	method accidente(){
		peso += 20
	}
}

object bumblebee{
	var property transformacion = auto
	method peso(){ return 800 }
	method nivelPeligrosidad(){ 
		return transformacion.nivelPeligrosidad()
	}
	method cantidadDeBultos(){
		return 2
	}
	method accidente(){
		if (transformacion == auto){
			transformacion = robot
		}
		else{
			transformacion = auto
		}
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
	var property cantidadDeLadrillos = 0
	method peso(){
		return pesoPorLadrillo * cantidadDeLadrillos
	}
	method nivelPeligrosidad(){ return 2 }
	method cantidadDeBultos(){
		return if (cantidadDeLadrillos <= 100){
			1
		}
		else if (cantidadDeLadrillos >= 101 and cantidadDeLadrillos <= 300){
			2
		}
		else {
			3
		}
	}
	method accidente(){
		if (cantidadDeLadrillos <= 12){
			cantidadDeLadrillos = 0
		}
		else {
			cantidadDeLadrillos -= 12
		}
	}
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
	method cantidadDeBultos(){
		return if (tieneMisiles){
			2
		}
		else {
			1
		}
	}
	method accidente(){
		tieneMisiles = false
	}
}

object residuosRadiactivos{
	var property peso = 0
	method nivelPeligrosidad(){ return 200 }
	method cantidadDeBultos(){
		return 1
	}
	method accidente(){
		peso += 15
	}
}

object contenedorPortuario {
	const pesoBase = 100
	const property cosasQueContiene = #{}
	method peso(){
		return pesoBase + cosasQueContiene.sum({cadaCosa => cadaCosa.peso()})
	}
	method nivelPeligrosidad(){
		return if (cosasQueContiene.isEmpty()){
			0
		}
		else {
			self.cosaMasPeligrosa().nivelPeligrosidad()
		}
	}
	method cosaMasPeligrosa(){
		return cosasQueContiene.max({cosa => cosa.nivelPeligrosidad()})
	}
	method cantidadDeBultos(){
		return 1 + cosasQueContiene.size()
	}
	method accidente(){
		cosasQueContiene.forEach({cadaCosa => cadaCosa.accidente()})
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
	method cantidadDeBultos(){
		return 2
	}
	method accidente(){
	}
}
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel{
	var property peso = 0
	method nivelPeligrosidad(){ return 1 }
}

object bumblebee{
	const transformacion = auto
	method peso(){ return 800 }
	method nivelPeligrosidad(){ 
		return transformacion.nivelPeligrosidad()
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
	var carga = misiles
	method carga(_carga){ 
		carga = _carga
	}
	method peso(){
		return if (carga == misiles){
			300
		}
		else {
			200
		}
	}
	method nivelPeligrosidad(){
		return if (carga == misiles){
			100
		}
		else {
			0
		}
	}
}

object misiles{}

object residuosRadiactivos{
	var peso = 0
	method peso(_peso){ 
		peso = _peso 
	}
	method nivelPeligrosidad(){ return 200 }
}
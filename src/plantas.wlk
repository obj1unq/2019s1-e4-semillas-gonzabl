class Planta {
	
	method horasDeSolToleradas()= 0 // inicializado para luego ser sobreescrito por cada especie.
	
	method esFuerte()= self.horasDeSolToleradas() > 10
	
	method daNuevasSemillas()= self.esFuerte() || self.condicionEspecial()

	method condicionEspecial()= false // // inicializado para ser sobreescrito por cada especie
	
	method espacioQueOcupa()= 0 // inicializado para ser sobreescrito por cada especie	
	
}

class Menta inherits Planta{
	const anioDeObtencion
	
	var altura
	
	override method horasDeSolToleradas() = 6
	
	override method condicionEspecial() = altura > 0.4
	
	override method espacioQueOcupa() = altura * 3
}

class Soja inherits Planta{
	
	const anioDeObtencion
	
	var altura
	
	override method horasDeSolToleradas()=
		 if (altura < 0.5){ 6 }
		 	else{
				if(altura.between(0.5,1)){ 7 }
				else{ 9 }
			}
	
	override method condicionEspecial() = altura > 1 && anioDeObtencion.year() > 2007
	
	override method espacioQueOcupa() = altura / 2
	
}


class Quinoa inherits Planta {
	
	const anioDeObtencion
	
	var altura
	
	var horasDeTolerancia
	
	method asignarHorasDeTolerancia(_horasDeTolerancia){
		horasDeTolerancia = _horasDeTolerancia 
	} 
	 
	
	override method horasDeSolToleradas() = horasDeTolerancia 
	
	override method condicionEspecial() = anioDeObtencion.year() < 2005 
	
	override method espacioQueOcupa() = 0.5
	
	
}
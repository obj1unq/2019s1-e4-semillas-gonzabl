class Planta {
	
	method horasDeSolToleradas()= 0 // inicializado para luego ser sobreescrito por cada especie.
	
	method esFuerte()= self.horasDeSolToleradas() > 10
	
	method daNuevasSemillas()= self.esFuerte() || self.condicionEspecial()

	method condicionEspecial()= false // // inicializado para ser sobreescrito por cada especie
	
	method espacioQueOcupa()= 0 // inicializado para ser sobreescrito por cada especie	
	
	method estaBienAsociada(parcela) = parcela.esEcologica(self) || parcela.esIndustrial(self) 
}

class Menta inherits Planta{
	const anioDeObtencion
	
	var property altura
	
	override method horasDeSolToleradas() = 6
	
	override method condicionEspecial() = altura > 0.4
	
	override method espacioQueOcupa() = altura * 3
	
	method parcelaIdeal(parcela)= parcela.superficie() > 6 
}

class Soja inherits Planta{
	
	const anioDeObtencion
	
	var property altura
	
	override method horasDeSolToleradas()=
		 if (altura < 0.5){ 6 }
		 	else{
				if(altura.between(0.5,1)){ 7 }
				else{ 9 }
			}
	
	override method condicionEspecial() = altura > 1 && anioDeObtencion.year() > 2007
	
	override method espacioQueOcupa() = altura / 2
	
	method parcelaIdeal(parcela)= self.horasDeSolToleradas() == parcela.hsDeSolRecibidas()
}


class Quinoa inherits Planta {
	
	const anioDeObtencion
	
	var property altura = 0.6
	
	var horasDeTolerancia
	 	
	override method horasDeSolToleradas() = horasDeTolerancia 
	
	override method condicionEspecial() = anioDeObtencion.year() < 2005 
	
	override method espacioQueOcupa() = 0.5
	
	method parcelaIdeal(parcela)= parcela.plantas().all({planta => planta.altura() < 1.5})
	
}

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas() = false
	
	override method parcelaIdeal(parcela)= parcela.cantidadMaximaDePlantas() == 1
}

class HierbaBuena inherits Menta{
	
	override method espacioQueOcupa() = (altura * 3) * 2
}
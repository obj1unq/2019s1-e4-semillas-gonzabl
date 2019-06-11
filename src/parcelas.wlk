class Parcela{
	
	const ancho
	const largo
	const property hsDeSolRecibidas
	const property plantas = []
	
	method superficie() = ancho * largo
	
	method cantidadMaximaDePlantas()=
		if(ancho > largo) {
			self.superficie() / 5
		}else{
			(self.superficie() / 3) + largo
		}
	
	method tieneComplicaciones() = plantas.any({planta => planta.horasDeSolToleradas()< hsDeSolRecibidas  })

	method plantar(planta) {
		if (plantas.size() >= self.cantidadMaximaDePlantas() || self.tieneComplicaciones() ){
			throw new Exception("No se puede plantar mas")
		}else{
			plantas.add(planta)
		}
	}

}

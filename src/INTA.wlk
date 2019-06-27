object inta {
	const property parcelas = []
	
	method promedioDePlantas() = parcelas.sum({parcela => parcela.plantas().size()}) / parcelas.size()
	
	method parcelaMasAutosustentable() =  self.parcelasConMasDe4Plantas().find({parcela => parcela == self.parcelaConMayorCantidadDeAsociaciones() } )

	
	method parcelasConMasDe4Plantas() = parcelas.find({parcela => parcela.plantas().size()> 4})
	
	method parcelaConMayorCantidadDeAsociaciones() = parcelas.find{parcela => parcela.cantidadDeAsociaciones()}
	
	method cantidadDeAsociaciones() = parcelas.map({parcela => parcela.cantidadDePlantasBienAsociadas()}).max()
	
	method cantidadDePlantasBienAsociadas(parcela) = parcela.plantas().count({planta => planta.estaBienAsociada(parcela) })


}

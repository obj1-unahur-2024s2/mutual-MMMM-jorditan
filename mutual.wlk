class Actividad {
  const property idiomas = []

  method esInteresante()=
    idiomas.size() > 1
  
  method sirveParaBroncearse()= true

  method cantidadDeDias() 

  method esRecomendableParaSocio(unSocio)=
    self.esInteresante() and unSocio.leAtraeLaActividad(self) and !unSocio.actividadesRealizadas().contains(self)
  // method condicionInteresante()

  // method implicaEsfuerzo()=
  //   self.implicaEsfuerzo()
  
  // method implicaEsfuerzo()
  // method condicionParaBroncearse()
  // method cantidadDeDias()
}

class ViajeDePlaya inherits Actividad {
  const largo

  override method cantidadDeDias()=
    largo / 500

  method implicaEsfuerzo()=
    largo > 1200
}

class ExcursionACiudad inherits Actividad {
  const atraccionesAVisitar

  override method cantidadDeDias()=
    atraccionesAVisitar / 2
  
  method implicaEsfuerzo()=
    atraccionesAVisitar.between(5, 8)
  
  override method sirveParaBroncearse()=
    false
  
  override method esInteresante()=
    super() or atraccionesAVisitar == 5
}

class ExcursionTropical inherits ExcursionACiudad {
  override method cantidadDeDias()=
    super() + 1
  override method sirveParaBroncearse()=
    true
}

class SalidaDeTrekking inherits Actividad {
  const kilometrosDeSenderos
  const diasDeSolPorAnio

  override method cantidadDeDias()=
    kilometrosDeSenderos / 50
  
  override method sirveParaBroncearse()=
    diasDeSolPorAnio > 200 or (diasDeSolPorAnio.between(100, 200) and kilometrosDeSenderos > 120)
  
  override method esInteresante()=
    super() and diasDeSolPorAnio > 140
}

class ClasesDeGimnasia inherits Actividad {
  method initialize() {
    idiomas.clear()
    idiomas.add("español")
  }

  const property cantidaDeDias = 1

  method implicaEsfuerzo()=
    true
  
  override method sirveParaBroncearse()=
    false
  
  override method esRecomendableParaSocio(unSocio)=
    unSocio.edad().between(20, 30)
}

class TallerLiterario inherits Actividad {
  const libros = []

  method autores()=
    libros.map({
      libro => libro.autor()
    }).asSet()

  method initialize() {
    idiomas.clear()
    libros.forEach({
      libro => idiomas.add(libro.idioma())
    })
  }

  override method cantidadDeDias()=
    libros.count({
      libro => libro.cantPaginas()
    })
  
  override method sirveParaBroncearse()=
    false
  
  override method esRecomendableParaSocio(unSocio)=
    unSocio.idiomasQueHabla().size() > 1
  
  method implicaEsfuerzo()=
    (libros.any({
      libro => libro.cantPaginas() > 500
    }) or self.autores().size() == 1) and libros.size() > 1
}

class Libro {
  const property idioma
  const property cantPaginas
  const property autor
}


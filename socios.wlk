class Socio {
  const property actividadesRealizadas = []
  const property idiomasQueHabla = []
  var edad

  const maximoDeActividades

  method edad()= edad

  method adoradorDelSol()=
    actividadesRealizadas.all({
      acitividad => acitividad.sirveParaBroncearse()
    })
  
  method actividadesEsforazadas()=
    actividadesRealizadas.all({
      actividad => actividad.implicaEsfuerzo()
    })
  
  method registrarActividad(unaActividad) {
    if (maximoDeActividades == actividadesRealizadas.size()) {
      self.error('El socio ya aclanzó el máximo de activiaddes a realizar')
    } else {
      actividadesRealizadas.add(unaActividad)
    }
  }

  method leAtraeLaActividad(unaActividad)
}

class SocioTranquilo inherits Socio {
  override method leAtraeLaActividad(unaActividad)=
    unaActividad.cantidadDeDias() >= 4
}

class SocioCoherente inherits Socio {
  override method leAtraeLaActividad(unaActividad)=
    if (self.adoradorDelSol()) {
      unaActividad.sirveParaBroncearse()
    } else {
      unaActividad.implicaEsfuerzo()
    }
}

class SocioRelajado inherits Socio {
  override method leAtraeLaActividad(unaActividad) {
    idiomasQueHabla.asSet();
    unaActividad.idiomas().asSet()
    return not idiomasQueHabla.intersection(unaActividad).isEmpty()
  }
}
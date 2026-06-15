class Dron {
    var autonomia
    const nivelProcesamiento
    var mision

    method autonomia() = autonomia
    method nivelProcesamiento() = nivelProcesamiento
    method eficienciaOperativa() = autonomia * 10 + mision.extra()
    method esDronAvanzado()

    method disminuirAutonomia(cantidad) {
        autonomia -= cantidad
    }

    method reprogramar(unaMision) {
        mision = unaMision
    } 
}

class DronComercial inherits Dron {
    override method eficienciaOperativa() = super() + (super() * 0.1)
    override method esDronAvanzado() = mision.esDronAvanzadoEnMision(self)
}

class DronDeSeguridad inherits Dron {
    override method esDronAvanzado() = mision.esDronAvanzadoEnMision(self) or nivelProcesamiento > 50
}
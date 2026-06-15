class Dron {
    var autonomia
    const nivelProcesamiento
    var mision

    method autonomia() = autonomia
    method nivelProcesamiento() = nivelProcesamiento
    method mision () = mision
    method eficienciaOperativa() = autonomia * 10 + mision.extra()
    method esAvanzado() = self.esAvanzadoSegunTipo() or mision.esDronAvanzadoEnMision(self)
    method esAvanzadoSegunTipo()

    method disminuirAutonomia() {
        autonomia = autonomia * 0.95
    }

    method reprogramar(unaMision) {
        mision = unaMision
    } 
}

class DronComercial inherits Dron {
    override method eficienciaOperativa() = super() + (super() * 0.1)
    override method esAvanzadoSegunTipo() = false
}

class DronDeSeguridad inherits Dron {
    override method esAvanzadoSegunTipo() = nivelProcesamiento > 50
}
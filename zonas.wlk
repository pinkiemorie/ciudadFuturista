class Escuadron {
    const drones = []

    method hayDronesAvanzados() = drones.any({d => d.esDronAvanzado()})
    method capacidadOperativa() = drones.sum({d => d.eficienciaOperativa()})

    method puedeOperarEnZona(unaZona) {
        return self.hayDronesAvanzados() and 
        self.capacidadOperativa() > (unaZona.tamañoTotal() / 2)
    }

    method operarEnZona(unaZona) {
        if (self.puedeOperarEnZona(unaZona)) {
            unaZona.registrarOperacion()
            drones.forEach({d => d.disminuirAutonomia(d.autonomia() * 0.05)})
        }
    }

    method agregarDron(unDron) {
        if (drones.size() < ciudad.dronesMaximoPorEscuadron()) {
            drones.add(unDron)
        }

        else {
            self.error("Supera la cantidad máxima definida por la ciudad")
        }
    }
}

object ciudad {
    var property dronesMaximoPorEscuadron = 10
}

class Zona {
    const tamañoTotal
    var cantOperaciones = 0

    method tamañoTotal() = tamañoTotal
    method cantOperaciones() = cantOperaciones

    method registrarOperacion() {
        cantOperaciones += 1
    }
}
class Transporte {
    method extra() = 100
    method esDronAvanzadoEnMision(unDron) = unDron.autonomia() > 50
}

class Exploracion {
    method extra() = 0

    method esDronAvanzadoEnMision(unDron) = unDron.eficienciaOperativa() % 2 == 0
}

class Vigilancia {
    const sensor

    method esDronAvanzadoEnMision(unDron) = sensor.durabilidad() * 2 > sensor.capacidad()

    method extra() {
        if (sensor.tieneMejorasTecnologicas()) {
            return sensor.capacidad() * 2
        }

        else {
            return sensor.capacidad()
        }
    }
}

class Sensor {
    const property capacidad
    const property durabilidad
    const property tieneMejorasTecnologicas
}
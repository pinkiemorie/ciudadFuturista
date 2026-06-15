object transporte {
    method extra() = 100
    method esDronAvanzadoEnMision(unDron) = unDron.autonomia() > 50
}

object exploracion {
    method extra() = 0

    method esDronAvanzadoEnMision(unDron) = unDron.eficienciaOperativa() % 2 == 0
}

class Vigilancia {
    const sensores = []

    method esDronAvanzadoEnMision(unDron) = sensores.all({s => s.esDuradero()})
    method haySensoresConMejorasTecnologicas() = sensores.any({s => s.tieneMejorasTecnologicas()})

    method extra() = sensores.sum({s => s.eficiencia()})
}

class Sensor {
    const property capacidad
    const property durabilidad
    const property tieneMejorasTecnologicas

    method esDuradero() = durabilidad > capacidad * 2
    method eficiencia() = if (tieneMejorasTecnologicas)  capacidad * 2 else capacidad

}
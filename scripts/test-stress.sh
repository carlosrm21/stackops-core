#!/bin/bash
URL="http://localhost/"
CONEXIONES_SIMULTANEAS=100
TOTAL_PETICIONES=5000
echo " Iniciando prueba de estrés sobre StackOps-Core..."
echo " Configuración: $TOTAL_PETICIONES peticiones totales ($CONEXIONES_SIMULTANEAS en paralelo)."
echo " Lanzando contenedor de pruebas..."
docker run --rm --network="host" alpine/ab -n $TOTAL_PETICIONES -c $CONEXIONES_SIMULTANEAS $URL
if [ $? -eq 0 ]; then
    echo -e "n Prueba completada con éxito."
else
    echo " La prueba falló o el servidor no respondió correctamente."
fi

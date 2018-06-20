## Artillery

Para instalar artillery, primero ejecutar el comando:

```
npm install --save artillery
```

Asegurarse de que esta instalado:

```
artillery -V
```

Una vez instalado, se pueden realizar los distintos escenarios (utilizando el escenario `root.yaml` como base para crear nuevos). Y luego ejecutarlos es tan simple como:

```
./run-scenario.sh escenario
```

Por ejemplo, el caso base que tenemos:

```
./run-scenario.sh root
```

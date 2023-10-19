# unrarer.sh 

Para practicar Bash y solucionarme un problemilla de paso.

## Un pequeño script para descomprimir grupos de archivos con la misma contraseña 

Solo un pequeño script para practicar Bash y arreglarme un problemilla
¿Alguna vez te has visto descomprimiendo .rars uno por uno poniendo la misma contraseña una y otra vez? ¡NUNCA MÁS!

Puedes utilizarlo desde cualquier directorio, ya que si no encuentra .rars te va a promptear por una dirección, pero es mucho más sencillo desde la propia carpeta donde estén.

### Solo necesitas bash y unrar como dependencias.
``` 
chmod -x ./unrarer.sh 
./unrarer.sh <password>
```

El primer comando lo convierte en un ejecutable.
El segundo lo ejecuta (surprise). Se puede utilizar `./unrarer.sh` y te pedirá la contraseña después (no olvides que los <> no están incluidos)

Si le sirve a alguien, que deje un saludito. Cheers!


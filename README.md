# Resaltador_de_texto
## Integrantes equipo 8
> Ximena Gonzalez A01028604, Sebastian Juncos A01022629, Carolina Ortega A01025254

# Contenidos

- [Resaltador de sintaxis](#resaltador-de-sintaxis)
    - [Descripción del proyecto](#descripción-del-proyecto)
    - [EXPRESIONES REGULARES](#expresiones-regulares)
    - [Implementación del programa](#implementación-del-programa)
- [Resaltador de sintaxis paralelo](#resaltador-de-sintaxis-paralelo)
    - [Descripción paralelo](#descripción-paralelo)
    - [Implementación paralelo](#implementación-paralelo)
    - [Complejidad](#complejidad)
    - [Tiempos de ejecución](#tiempos-de-ejecución)
- [Reflexión](#reflexión)

# Resaltador de sintaxis

## Descripción del proyecto 
Creemos que nuestra solución al reto es muy buena, ya que utilizamos listas para poder separar en varios pedazos e identificar cada token del contenido en el archivo .json, toda la información necesaria para construir el archivo HTML.
Por ser un acercamiento funcional para resolver el problema, no utilizamos ciclos iterativos, solo recursivos; por lo que la complejidad temporal es de O(n). "n" es equivalente al tamaño del archivo json (iteraciones).


## EXPRESIONES REGULARES
-  [(regexp-match #px"^[\\d]+" json-string)]

 Busca un entero

- [(regexp-match #px"^true|false|null" json-string)]

Busca las palabras "true", "false" y "null"

- [(regexp-match #px"^(\"[\\w: -,\\.]+?\")(:)" json-string)]

Busca las llaves, ya que busca cualquier a-z, A-Z, 0-9, ":", "," , "." , ' " ' en un grupo y en otro ":"

- [(regexp-match #px"^\"[\\w: ,\\.-]+?\"" json-string)]

Busca los strings, ya que busca cualquier a-z, A-Z, 0-9, ":", "," , "." , ' " '

- [(regexp-match #px"^[,\\[\\]{}():]" json-string)]

Busca los caracteres , \\ {} () :

- [(regexp-match #px"^[\r\n]+" json-string)]

Busca los enters

- [(regexp-match #px"^\\s" json-string)]

Busca los espacios

Tomamos la decisión para la sintaxis de cada expresión regular, al probar cada una en un simulador llamado Regex101 que nos muestra lo que haría nuestra expresión, iluminando de color azul lo seleccionado. Un ejemplo del simulador se muestra en la imagen de abajo.
<img width="1102" alt="Screen Shot 2021-05-21 at 20 11 40" src="https://user-images.githubusercontent.com/57368415/119210400-97748a00-ba71-11eb-8db4-27ae4e773a3c.png">

## Implementación del programa 
![Screenshot 2021-05-21 211312](https://user-images.githubusercontent.com/56135009/119211714-65ffbc80-ba79-11eb-9369-d42ce30ed9d0.png)

# Resaltador de sintaxis paralelo

## Descripción paralelo

En esta parte, tuvimos que hacer uso del programa de la actividad 3.4 (Resaltador de sintaxis) y extender este programa para que ahora también fuera capaz de identificar dentro de un directorio todos los archivos de terminación .json de manera secuencial. Este programa realiza el mismo proceso pero ahora al hacer uso de funciones future se convierte en paralelo. Elegimos hacer una función (find-files) que leyera los archivos del directorio e identificara a través de un loop con una expresión regular si hay archivos con terminación .json existentes, ésta nos regresa una lista de archivos. 
La expresión regular usada fue:

```regexp-match? #px".json$"```

values-files funciona como una lista vacía a la que se le irán agregando los archivos encontrados en el directorio que cumplan con la condición dada.
Se uso la siguiente expresión para determinar que se recorriera el directorio:

`(map path->string (directory-list))`

Para cumplir con el que el programa fuera paralelo usamos la función de future, la cual se encarga de optimizar el tiempo y hacer uso de los núcleos de la computadora y acelerar el proceso. 
Definimos 2 funciones:
make-future se encarga de llamar al main, que se encarga de que nuestros archivos sean transformados a html para su visualización. 
La función lambda nos ayuda a definir que la función future deberá de tomar en cuenta a main y al archivo en el que estamos.

` (future (lambda()(main current-file)))`

divide-in-futures se encarga de definir que hacer la función anterior por todos los archivos .json encontrados y eso lo logramos con map, la cual nos ayuda a que la lista de los archivos pase por la función main que al final pasa a los archivos a html. La función de futures se inicializa con touch.

`(define futures (map make-future (find-files)))
  (map touch futures)`
  
## Implementación paralelo

Resultados obtenidos: 


## Complejidad

Las funciones loop funcionan como complejidad temporal O(n) ya que actúa en los ciclos de una manera recursiva. En el caso de la complejidad espacial, también es O(n) porque generamos listas que son proporcionales a la lista de archivos .json. 

## Tiempos de ejecución

Speedup obtenido:


# Reflexión


Este tipo de tecnología puede ayudar a muchas personas ya que para muchas generaciones hacer uso de la tecnología es difícil, especialmente los dispositivos como celulares y computadoras que usamos hoy en día, ya que aunque son amigables para que los usuarios las usen fácilmente en su vida diaria, es algo muy nuevo que nunca les enseñaron a usar. 
El poder ser capaces de diferenciar cosas para ellos como en el caso de este programa, diferenciar con colores diferentes expresiones, les puede facilitar el uso y entendimiento del funcionamiento básico de estos.


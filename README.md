# Resaltador_de_texto
## Integrantes equipo 8
> Ximena Gonzalez A01028604, Sebastian Juncos A01022629, Carolina Ortega A01025254

# Descripción del proyecto
Creemos que nuestra solución al reto es muy buena, ya que utilizamos listas para poder separar en varios pedazos e identificar cada token del contenido en el archivo .json, toda la información necesaria para construir el archivo HTML.
Por ser un acercamiento funcional para resolver el problema, no utilizamos ciclos iterativos, solo recursivos; por lo que la complejidad temporal es de O(n). "n" es equivalente al tamaño del archivo json (iteraciones).
## EXPRESIONES REGULARES:
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



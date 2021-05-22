# Resaltador_de_texto
## Integrantes equipo 8
> Ximena Gonzalez A01028604, Sebastian Juncos A01022629, Carolina Ortega A01025254

# Descripción del proyecto
Creemos que nuestra solución al reto es muy buena, ya que utilizamos listas para poder separar en varios pedazos e identificar cada token del contenido en el archivo .json, toda la información necesaria para construir el archivo HTML.
Por ser un acercamiento funcional para resolver el problema, no utilizamos ciclos iterativos, solo recursivos; por lo que la complejidad temporal es de O(n). "n" es equivalente al tamaño del archivo json (iteraciones).
EXPRESIONES REGULARES:
- [(regexp-match #px"^[\\d]+" json-string)]
Busca un entero
- [(regexp-match #px"^true|false|null" json-string)]
Busca las palabras "true", "false" y "null"
- [(regexp-match #px"^(\"[\\w: -,\\.]+?\")(:)" json-string)]
Busca las llaves, ya que busca cualquier a-z, A-Z, 0-9, ":", "," , "." , ' " ' en unngrupo y en otro ":"
- [(regexp-match #px"^\"[\\w: ,\\.-]+?\"" json-string)]
Busca los strings, ya que busca cualquier a-z, A-Z, 0-9, ":", "," , "." , ' " '
- [(regexp-match #px"^[,\\[\\]{}():]" json-string)]
busca los caracteres , \\ {} () :
- [(regexp-match #px"^[\r\n]+" json-string)]
busca los enters
- [(regexp-match #px"^\\s" json-string)]
busca los espacios
, decision

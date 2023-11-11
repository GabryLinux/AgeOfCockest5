extends Node

# classe che incorpora la tripla <Mesh,Vector,Duration>
# per implementare al meglio la concatenazione di interpolazioni di traslazioni
class_name MeshVectorTranslation




#--------------ATTRUBUTI--------------#

# rappresenta la mesh sulla quale applicare la traslazione
var mesh: 	MeshInstance3D

# rappresenta il vettore di traslazione
var vector: Vector3

# la durata dell'animazione di traslazione in secondi
var duration: float

#--------------ATTRUBUTI--------------#





#---------------METODI----------------#


# costruttore che accetta:
# - la mesh sul quale effettuare l'animazione
# - il vettore v di traslazione
# - durata di animazione (di default = 0.5)
func _init(m: MeshInstance3D, v, d: float = 0.5):
	mesh = m
	duration = d
	if v is Vector3:
		vector = v
	if v is Coord:
		vector = Vector3(v.x, 0, v.y)
	else:
		assert("type not valid!")
		
#---------------METODI----------------#	
	

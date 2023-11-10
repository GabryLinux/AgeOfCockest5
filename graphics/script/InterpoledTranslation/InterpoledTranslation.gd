extends Node

# classe statica che esegue l'interpolazione di una traslazione su una mesh
# non dev'essere istanziata, bisogna solamente chiamare la funzione animate
# per eseguire l'animazione
class_name InterpoledTranslation

#--------------ATTRUBUTI--------------#

# property indica il tipo di proprietà della mesh da animare
# si può cercare nella documentazione godot quali altre property esistono
# 
const property = "position"

#--------------ATTRUBUTI--------------#


#---------------METODI----------------#

# effettua il casting della coordinata Coord a Vector3
static func CoordToVector(coord: Coord) -> Vector3:
	return Vector3(coord.x, 0, coord.y)


# effettua il casting di un array di Coord in array di Vector3
static func CoordsToVectors(coords: Array) -> Array:
	var ar = []
	for n in coords.size():
		var vector = CoordToVector(coords[n])
		ar.append(vector)
	
	return ar


# funzione che interpola la traslazione di vettore vect 
# (o di coordinate vect, viene effettuata la conversione automaticamente)
static func animate(mesh: MeshInstance3D, vect, duration : float = 0.5):
	var tween
	tween = mesh.create_tween()
	if vect is Vector3:
		tween.tween_property(mesh, property, vect, duration)
	if vect is Coord:
		var v = CoordToVector(vect)
		tween.tween_property(mesh, property, v, duration)
	pass


# funzione che concatena le animazioni di una array di MeshVectorTranslation 
static func animateSequence(meshVectorTranslation: Array):
	var tween
	for i in meshVectorTranslation.size():
		var meshVect = meshVectorTranslation[i] as MeshVectorTranslation
		tween = meshVect.mesh.create_tween()
		tween.chain().tween_property(meshVect.mesh, property, meshVect.vector, meshVect.duration)
	pass
	
#---------------METODI----------------#

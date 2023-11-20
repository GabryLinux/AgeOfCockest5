extends MeshInstance3D

var coords = [
	Coord.new(0,0),
	Coord.new(-66,-8),
	Coord.new(-33,67),
	Coord.new(60,30),
	Coord.new(-150,40)
]		



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var i = 1

# esempio di uso della classe InterpoledTranslation
func _unhandled_input(event):
	
	var ar = InterpoledTranslation.CoordsToVectors(coords)
	if (
		event is InputEventMouseButton and
		event.is_pressed() and 
		event.button_index == MOUSE_BUTTON_LEFT
	):
		#var v = Vector3(coords[i].x,0, coords[i].y)
		InterpoledTranslation.animate(get_node("."),coords[i  % ar.size()])
		i = (i + 1)
		

#func _process(delta):

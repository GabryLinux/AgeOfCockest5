extends MeshInstance3D

var coords = [
	Coord.new(0,0),
	Coord.new(20,10),
	Coord.new(140,30),
	Coord.new(140,70)
]		



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var i = 0

# esempio di uso della classe InterpoledTranslation
func _unhandled_input(event):
	
	var ar = InterpoledTranslation.CoordsToVectors(coords)
	if (
		event.is_pressed() and 
		event.button_index == MOUSE_BUTTON_LEFT
	):
		var v = Vector3(coords[i].x,0, coords[i].y)
		InterpoledTranslation.animate(get_node("."),v)
		i = (i + 1) % ar.size()
		

func _process(delta):

	pass

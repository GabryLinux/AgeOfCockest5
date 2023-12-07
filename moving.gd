extends Camera3D

#-------------------COSTANTI--------------------#

# passo di incremento per spostarsi a destra o sinistra col mouse
const passo = 0.5

# fattore di divisione per il mouseDrag (normalmente le componenti del vettore sono troppo grandi)
# diminuisco fattore -> aumento la velocità
const fattore = 40

# flag che si alza quando premo il MouseButton, si abbassa quando lo rilascio
var clickPressed = false

#-------------------COSTANTI--------------------#

# il riferimento alla camera di Gioco 
var camera: Camera3D



func _ready():
	camera = get_viewport().get_camera_3d()
	pass # Replace with function body.

# Input Handling
func _unhandled_input(event):
	
	if event is InputEventKey:
		keyboardMovement(event)
	if event is InputEventMouseMotion:
		mouseDrag(event)
	if event is InputEventMouseButton:
		mouseWheel(event)
	
	return

func keyboardMovement(event):
	# prendo la chiave da tastiera
	var key = event.as_text_keycode()
		
	# in base al carattere posso spostarmi sopra/sotto o sinistra/destra
	match key:
		"A":
			camera.position.x -= passo
		"D":
			camera.position.x += passo
		"W":
			camera.position.z += passo
		"S":
			camera.position.z -= passo
			
	return

func mouseWheel(event):
	
	# catturo l'evento della rotella del mouse
	if event.is_pressed():
		var scroll = event.button_index
		
		if scroll == MOUSE_BUTTON_WHEEL_UP:
			camera.position.y -= passo * 4
			
		if scroll == MOUSE_BUTTON_WHEEL_DOWN:
			camera.position.y += passo * 4
		
	
	# questo if a parte è per la gestione del mouse drag
	if event.is_pressed():
		clickPressed = true
	else:
		clickPressed = false
	return

func mouseDrag(event):
	# se clicco il mouseButton allora posso muovermi nella mappa
	if clickPressed:
		
		#print(event.get_relative())
		var delta = event.get_relative() as Vector2
		var x = camera.position.x - delta.x / fattore
		var z = camera.position.z - delta.y / fattore
		camera.set_position(Vector3(x,camera.position.y,z))
	return



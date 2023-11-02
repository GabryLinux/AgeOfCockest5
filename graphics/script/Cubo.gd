extends MeshInstance3D

var i


# Called when the node enters the scene tree for the first time.
func _ready():
	i = 0
	pass # Replace with function body.


var vecCoords = [
	Vector3(200,0,100),
	Vector3(-200,0,-150),
]

func valAss(n :int) -> int:
	if n >= 0:
		return n
	else:
		return -n
		
		
		
class Coord:
	var x: float
	var y: float
	
func CoordCostr(x: float, y: float):
	var c = Coord.new()
	c.x = x
	c.y = y
	return c
	
var coords = [
	CoordCostr(0,0),
	CoordCostr(20,10),
	CoordCostr(140,30),
	CoordCostr(140,70)
]		
		

var xDir = 0
var zDir = 0 
var flagAnimFinita = false #true fin quando devo eseguire delle animazioni
var tempoAnim = 2 #secondo

func interpTransl(direz: Vector3, delta) :
	if valAss(xDir) < valAss(direz.x) && valAss(zDir) < valAss(direz.z):
		var passi = tempoAnim/delta
		
		var xAmount = direz.x / passi
		var zAmount = direz.z / passi
		var deltaVec = Vector3(xAmount,0,zAmount)
		
		if direz.x < 0:
			xDir = xDir - xAmount
		else:
			xDir = xDir + xAmount
		
		if direz.y < 0:
			zDir = zDir - zAmount
		else:
			zDir = zDir + zAmount
			
		tempoAnim = tempoAnim - delta
		
		translate(deltaVec)
	else :
		#reset variabili per nuova animazione
		xDir = 0
		zDir = 0
		tempoAnim = 2
		flagAnimFinita = true
	return
	

func getNextVect(c: Coord) -> Vector3:
	var vect = Vector3()
	var actualCoords = global_position
	vect.x = c.x - actualCoords.x
	vect.z = c.y - actualCoords.y
	return vect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(i)
	#se l'attuale animazione è finita
	if flagAnimFinita && i < coords.size():
		flagAnimFinita = false
		i+=1
	if i < coords.size():
		#altrimenti continuo a interpolare il i-esimo vettore
		var v = getNextVect(coords[i])
		interpTransl(v,delta)
		
		
	
	pass

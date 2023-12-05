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
		and false
	):
		#var v = Vector3(coords[i].x,0, coords[i].y)
		InterpoledTranslation.animate(get_node("."),coords[i  % ar.size()])
		i = (i + 1)
		
func rotation(v: Vector3, rotation: Vector3) -> Vector3:
	v.rotated(Vector3(1,0,0), rotation.x)
	v.rotated(Vector3(0,1,0), rotation.y)
	v.rotated(Vector3(0,0,1), rotation.z)
	
	return v


func mouse3DProjectedPosition(mousePosition: Vector2):
	var spaceState = get_world_3d().direct_space_state
	
	var camera3d = get_viewport().get_camera_3d()
	#camera3d.
	const RAY_LENGTH = 1000
	var from = camera3d.project_ray_origin(mousePosition)
	var to = from + camera3d.project_ray_normal(mousePosition) * RAY_LENGTH
	
	from = rotation(from, camera3d.rotation)
	to = rotation(to, camera3d.rotation)
	
	#from.y = camera3d.position.y - from.y
	
	var params = PhysicsRayQueryParameters3D.create(from,to)
	
	params.collide_with_areas = true
	params.hit_from_inside = true
	
	#print(from, " -> ", to)
	var rayArray = spaceState.intersect_ray(params)
	add_child(await line(from, to))
	#print(rayArray)
	if rayArray:
		return rayArray
	return Vector3(0,0,0)


func line(pos1: Vector3, pos2: Vector3, color = Color.WHITE_SMOKE, persist_ms = 0) -> MeshInstance3D :
	var mesh_instance := MeshInstance3D.new()
	var immediate_mesh := ImmediateMesh.new()
	var material := ORMMaterial3D.new()
	
	mesh_instance.mesh = immediate_mesh
	mesh_instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material)
	immediate_mesh.surface_add_vertex(pos1)
	immediate_mesh.surface_add_vertex(pos2)
	immediate_mesh.surface_end()
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	get_tree().get_root().add_child(mesh_instance)
	if persist_ms:
		await get_tree().create_timer(persist_ms).timeout
		mesh_instance.queue_free()
		return null
	else:
		return mesh_instance



func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#var projectedmouse = mouse3DProjectedPosition(event.position)
		#print(projectedmouse)
		#var regione = selezionaRegione(arrayCentri, projectedmouse)
		#print(regione)
		#mouse3DProjectedPosition(event.position)
		pass
		
		#var material = mesh.surface_get_material(34)
		#animateGlowingEffect(material)
		#print(from,to)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

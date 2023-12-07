extends MeshInstance3D


const FEATURE_EMISSION = 1

const RAY_LENGTH = 5
var SCALE_FACTOR = self.scale.x
const DEGTORAD = 0.0174533
var arrayCentri = []

var ACTUAL_REGION_SELECTED = 0
var STARTING_MATERIAL = null
var tween = null
var arraySHAPES = []

func animateGlowingEffect(material):
	
	#fermo eventualmente un animazione precedente
	if tween != null:
		tween.stop()
		
	const DURATION = 0.5
	const PROPERTY = "emission"
	
	STARTING_MATERIAL = material.get_emission()
	
	var colorStart = material.get_emission()
	var colorEnd = Color(0.8,0.8,0.8,1)
	material.emission_enabled = true
	#material.set_emission(Color(1,1,1,1))
	#material.set_emission_intensity(1)
	tween = create_tween().set_loops()
	tween.tween_property(material, PROPERTY, colorEnd, DURATION)
	tween.tween_property(material, PROPERTY, colorStart, DURATION)
	#tween.start()


# Called when the node enters the scene tree for the first time.
func _ready():
	
	generateCollisionShape2(mesh)
	
	print(arraySHAPES)
	
	arrayCentri = centersCalculation(mesh)
	drawPoints(arrayCentri)
	
	#self.create_convex_collision()
	print(get_tree().get_node_count())
	#print()
	pass # Replace with function body.

func scaleVector(vec: Vector3) -> Vector3:
	return Vector3(vec.x*SCALE_FACTOR, vec.y*SCALE_FACTOR, vec.z*SCALE_FACTOR)
	
func scaleVector2(vec: Vector2) -> Vector2:
	return Vector2(vec.x*SCALE_FACTOR, vec.y*SCALE_FACTOR)

func centerCalculation(vertices) -> Vector3:
	var sumX = 0.0
	var sumZ = 0.0
	
	#sommo tutte le componenti dei vertici
	for i in vertices.size():

		var v = vertices[i] as Vector3
		
		sumX += v.x
		sumZ += v.z
	
	var X = sumX / vertices.size()
	var Z = sumZ / vertices.size()
	return Vector3(X*SCALE_FACTOR,0,Z*SCALE_FACTOR) 

func centersCalculation(mesh) -> Array:
	var centersSurfaces = []
	for i in mesh.get_surface_count():
		var vertices = mesh.surface_get_arrays(i)[0]

		var center = centerCalculation(vertices)
		#print(center)
		centersSurfaces.append(center)
	return centersSurfaces	



func generateCollisionShape(mesh):
	for i in mesh.get_surface_count():
		
		var vertices = mesh.surface_get_arrays(i)[0]
		#print(vertices[0])
		vertices = scaleAllPoints(vertices)
		#print(vertices[0])
		#print("")
		var staticbody = StaticBody3D.new()
		var polygon = ConvexPolygonShape3D.new()
		polygon.set_points(vertices)
		
		var shape = CollisionShape3D.new()
		
		shape.set_shape(polygon)
		
		staticbody.create_shape_owner(shape)
		
		get_tree().get_root().add_child(staticbody)
	pass

func generateCollisionShape2(mesh):
	for i in mesh.get_surface_count():
		var surface = mesh.surface_get_arrays(i)
		var istMesh = MeshInstance3D.new()
		var meshNUOVA = Mesh.new()
		
		var arrMesh = ArrayMesh.new()
		
		var st = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		
		
		var verts = surface[ArrayMesh.ARRAY_VERTEX]
		var uvs = surface[ArrayMesh.ARRAY_TEX_UV]
		var normals = surface[ArrayMesh.ARRAY_NORMAL]  
		#var indices = surface[ArrayMesh.ARRAY_INDEX]
		
		for v in verts.size():
			verts[v] = scaleVector(verts[v])
		
		print(verts[0])
		var arrays = []
		arrays.resize(Mesh.ARRAY_MAX)
		
		arrays[ArrayMesh.ARRAY_VERTEX] = verts
		arrays[ArrayMesh.ARRAY_TEX_UV] = uvs
		arrays[ArrayMesh.ARRAY_NORMAL] = normals
		
		
		#print(arrays)
		arrMesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		
		#st.generate_normals()
			
		#meshNUOVA
		#istMesh.mesh = mesh.surface_get_arrays(i)
		
		var material = ORMMaterial3D.new()
		material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		material.albedo_color = Color.NAVAJO_WHITE
		
		arrMesh.surface_set_material(0, material)
		
		istMesh.mesh = arrMesh

		get_tree().get_root().add_child(istMesh)
		get_node(istMesh.get_path()).visible = false
		istMesh.create_convex_collision()
		
		arraySHAPES.append(
			get_tree().get_root()									#Dalla radice
			.get_child(get_tree().get_root().get_child_count()-1)	#seleziono l'ultimo figlio aggiunto
			.get_children()[0].get_instance_id()					#seleziono la foglia dell'ultimo figlio aggiunto
		)
		

#NOTA BENE
#SI PUO IMPLEMENTARE COME BINARY SEARCH DAL MOMENTO CHE GLI ID SONO ORDINATI
func findIndexFromID(ID: int) -> int:
	for i in arraySHAPES.size():
		if arraySHAPES[i] == ID:
			return i
	
	return -1
	pass
func scaleAllPoints(pointsArr: Array) -> Array:
	#var newArr = Array(pointsArr)
	
	var center = centerCalculation(pointsArr)
	get_tree().get_root().add_child(point(center))
	
	for i in pointsArr.size():
		var newV = pointsArr[i]
		
		newV = Vector3(newV.x * SCALE_FACTOR, 0, newV.z * SCALE_FACTOR)
		#newV = newV + self.position
		
		pointsArr[i] = newV
	
	
	#print("Center ->", center)
	
	return pointsArr

func point(center: Vector3) -> MeshInstance3D:
	var meshistance = MeshInstance3D.new()
	var sphereMesh = SphereMesh.new()
	var material = ORMMaterial3D.new()
	
	
	meshistance.mesh = sphereMesh
	meshistance.position = center
	
	sphereMesh.material = material
	
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = Color.NAVAJO_WHITE
	
	return meshistance

func drawPoints(arrayCenters: Array):
	for i in arrayCenters.size():
		#print(arrayCenters[i])
		get_tree().get_root().add_child(point(arrayCenters[i]))
	
	return	


func selezionaRegione(arrayCentri: Array, mousePosition: Vector3) -> int:
	var Xmin = 1000000
	var Ymin = 1000000
	var min = -1
	
	for i in arrayCentri.size():
		var xdiff = abs(arrayCentri[i].x - mousePosition.x)
		var ydiff = abs(arrayCentri[i].z - mousePosition.z)
		
		if xdiff < Xmin and ydiff < Ymin:
			min = i
			Xmin = xdiff
			Ymin = ydiff
			#print(i, " ", arrayCentri[i], " ", mousePosition)
	
	return min
	

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
	#add_child(await line(from, to))
	#print(rayArray)
	if rayArray:
		return rayArray
	return Dictionary()


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


func restoreMaterial(region):
	if STARTING_MATERIAL != null:
		if tween != null:
			tween.stop()
		var mat = mesh.surface_get_material(region)
		mat.emission = STARTING_MATERIAL
		mesh.surface_set_material(region, mat) 


func getIndex(string: String) -> int:
	var index = 0
	string = string.get_slice("_",2)
	
	return index

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#var projectedmouse = mouse3DProjectedPosition(event.position)
		#print(projectedmouse)
		#var regione = selezionaRegione(arrayCentri, projectedmouse)
		#print(regione)
		var collision = await mouse3DProjectedPosition(event.position)
		
		restoreMaterial(ACTUAL_REGION_SELECTED)
		
		
		#var collider = collision["collider"] as StaticBody3D
		if collision != Dictionary():
			var id_collision = findIndexFromID(instance_from_id(collision["collider_id"]).get_instance_id())
			
			ACTUAL_REGION_SELECTED = id_collision
			var material = mesh.surface_get_material(ACTUAL_REGION_SELECTED)
			
			animateGlowingEffect(material)
		else: 
			restoreMaterial(ACTUAL_REGION_SELECTED)
		pass
		
		
		#print(from,to)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

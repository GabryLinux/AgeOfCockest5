extends MeshInstance3D


const FEATURE_EMISSION = 1

func animateGlowingEffect(material):
	const DURATION = 0.5
	const PROPERTY = "emission"
	var colorStart = material.get_emission()
	var colorEnd = Color(0.8,0.8,0.8,1)
	material.emission_enabled = true
	#material.set_emission(Color(1,1,1,1))
	#material.set_emission_intensity(1)
	
	var tween = create_tween().set_loops()
	
	tween.tween_property(material, PROPERTY, colorEnd, DURATION)
	tween.tween_property(material, PROPERTY, colorStart, DURATION)
	#tween.start()


# Called when the node enters the scene tree for the first time.
func _ready():

	var material = mesh.surface_get_material(32)
	animateGlowingEffect(material)

	#print()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

extends Button



func _on_pressed():
	print("clicked")
	get_tree().change_scene_to_file("res://gamegraphic/MainGame.tscn")





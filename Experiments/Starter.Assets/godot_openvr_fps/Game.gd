extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var VR = ARVRServer.find_interface("OpenVR")
	if VR and VR.initialize():
		get_viewport().arvr = true
		
		OS.vsync_enabled = false
		Engine.target_fps = 90
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

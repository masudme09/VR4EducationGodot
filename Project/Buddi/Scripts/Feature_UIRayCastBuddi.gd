extends Spatial


export var active := true;
export var ui_raycast_length := 3.0;
export var ui_mesh_length := 1.0;

export var adjust_left_right := true;

export(vr.CONTROLLER_BUTTON) var ui_raycast_visible_button := vr.CONTROLLER_BUTTON.TOUCH_INDEX_TRIGGER;
export(vr.CONTROLLER_BUTTON) var ui_raycast_click_button := vr.CONTROLLER_BUTTON.INDEX_TRIGGER;

# Initialize the variables
var controller : ARVRController = null;
onready var ui_raycast_position : Spatial = $RayCastPosition;
onready var ui_raycast : RayCast = $RayCastPosition/RayCast;
onready var ui_raycast_mesh : MeshInstance = $RayCastPosition/RayCastMesh;
onready var ui_raycast_hitmarker : MeshInstance = $RayCastPosition/RayCastHitMarker;

const hand_click_button := vr.CONTROLLER_BUTTON.XA;

var is_colliding := false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

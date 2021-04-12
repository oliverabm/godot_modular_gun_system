extends Spatial
class_name Bullet
# An example projectile for the gun.
# It will move forward with constant speed and is not affected by gravity.
# Collision is handled by a raycast node that is set to start
# at the bullet's location on the previous frame and extend to it's current
# location to avoid having the bullet pass through objects when it
# is moving at high speeds


export (NodePath) var ray_cast

var speed = 0
var ray
var previousFrame
var nowFrame
var timer
var destroyTime = 5
var orientation


func _ready():
	ray = get_node("RayCast")
	ray.set_enabled(true)
	previousFrame = global_transform
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout",self,"onTimerSignal")
	timer.set_one_shot(true)
	timer.start(destroyTime)


func _physics_process(delta):
	orientation = transform.basis
	transform.origin += orientation*Vector3(0,0,speed)*delta
	ray.global_transform = previousFrame
	var dist = previousFrame.origin.distance_to(global_transform.origin)
	ray.set_cast_to(Vector3(0,0,dist))
	previousFrame = get_global_transform()
	if ray.is_colliding():
		var col = ray.get_collider()
		if col.is_in_group("col"):
			print("collision")
			col.set_health(0)
		call_deferred("queue_free")


func set_speed(s):
	speed = s


func onTimerSignal():
	self.call_deferred("free")

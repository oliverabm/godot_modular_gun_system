extends Spatial
# Simple script using the functionality of a Gun.
# The node will continuously shoot the gun when it can.

onready var gun = $Gun


func _process(_delta):
	if gun.can_fire():
		gun.fire()

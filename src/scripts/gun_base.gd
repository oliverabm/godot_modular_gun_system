extends Spatial
class_name Gun
# A base class for gun functionality.
# It uses a GunStats object for storing and getting
# it's information like fire rate and bullet speed.


export(Resource) var stats
export(PackedScene) var bullet
export var fired_bullets = 1
export(bool) var canFire
export(NodePath) var fire_point

var timer
onready var firePoint = get_node(fire_point)
onready var audioPlayer = get_node("GunshotAudio")


func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout",self,"_fire_timer_out")
	timer.start(0.1)


func can_fire():
	return canFire


func fire():
	audioPlayer.play(0.0)
	var i = fired_bullets
	while i > 0:
		var projectile = bullet.instance()
		get_tree().current_scene.add_child(projectile)
		projectile.transform = firePoint.global_transform
		var XSpread = rand_range(stats.spread_vector.x,-stats.spread_vector.x)
		var YSpread = rand_range(stats.spread_vector.y,-stats.spread_vector.y)
		var ZSpread = rand_range(stats.spread_vector.z,-stats.spread_vector.z)
		var spread = Vector3(XSpread,YSpread,ZSpread)
		projectile.set_rotation(projectile.rotation + spread)
		projectile.set_speed(stats.get_bullet_force())
		i -= 1
	canFire = false
	timer.start(stats.get_fire_rate())


func _fire_timer_out():
	canFire = true


func get_stats_recoil():
	return stats.get_recoil()


func set_stats(newStats):
	stats = newStats
	canFire = false
	timer.start(stats.get_fire_rate())	

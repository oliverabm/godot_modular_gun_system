extends Resource
class_name GunStats
# Simple data object to contain gun related information


export (String) var name = "gun"
export(float) var bullet_force = 300
export(int) var damage = 10
export(float) var fire_rate = 0.4
export(Vector3) var spread_vector = Vector3(0,0,0)
export (float) var recoil = 0.2


func get_name():
	return name


func set_name(n):
	self.name = n


func get_recoil():
	return recoil


func set_recoil(n):
	self.recoil = n


func get_damage():
	return damage


func set_damage(n):
	self.damage = n


func get_bullet_force():
	return bullet_force


func set_bullet_force(force):
	self.bullet_force = force


func get_fire_rate():
	return fire_rate


func set_fire_rate(n):
	self.fire_rate = n


func get_spread_vector():
	return spread_vector


func set_spread_vector(v):
	self.spread_vector = v

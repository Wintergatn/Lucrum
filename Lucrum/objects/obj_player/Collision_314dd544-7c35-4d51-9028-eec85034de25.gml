//Take damage
if (invincible == false) {
	invincible = true;
	alarm[3] = invincibilityTime;
	alarm[2] = flickerTime;
	collidedWith = other.id;
	obj_player_stats.cHealth -= other.damage;
	show_debug_message("health: " + string(obj_player_stats.cHealth)); 
	state = scr_damage_state;
}
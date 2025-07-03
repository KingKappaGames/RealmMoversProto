enum moveDir {
	hold = 0,
	up = 1,
	down = 2,
	right = 3,
	left = 4
}

enum criteriaOptions {
	bossKills,
	questItems,
	secretPath,
	gameProgression
}

enum bossName {
	bossHold = 0,
	boss1 = 1,
	boss2 = 2,
	boss3 = 3,
	boss4 = 4,
	boss5 = 5,
	boss6 = 6,
	boss7 = 7,
	boss8 = 8,
	boss9 = 9,
	boss10 = 10,
	boss11 = 11,
	boss12 = 12,
}

randomize();

global.bossSpawnIndex = 1;

#region
global.sys = part_system_create();
part_system_depth(global.sys, -2000);

global.bloodPart = part_type_create();
part_type_shape(global.bloodPart, pt_shape_square);
part_type_size(global.bloodPart, .09, .14, -.0045, 0);
part_type_life(global.bloodPart, 16, 25);
part_type_color2(global.bloodPart, #b20000, #ed1212);
part_type_direction(global.bloodPart, 0, 360, 0, 0); // changed changed with use
part_type_speed(global.bloodPart, 1.5, 4.2, -.14, 0); // changed changed with use
part_type_gravity(global.bloodPart, .08, 270)
part_type_orientation(global.bloodPart, 0, 360, 0, 0, 0);

global.glimmerPart = part_type_create();
part_type_shape(global.glimmerPart, pt_shape_square);
part_type_size(global.glimmerPart, .09, .14, -.0045, 0);
part_type_life(global.glimmerPart, 16, 25);
part_type_color2(global.glimmerPart, c_yellow, c_white);
part_type_direction(global.glimmerPart, 0, 360, 0, 0); // changed changed with use
part_type_speed(global.glimmerPart, 1.5, 4.2, -.14, 0); // changed changed with use
part_type_gravity(global.glimmerPart, .08, 270)
part_type_orientation(global.glimmerPart, 0, 360, 0, 0, 0);
#endregion

application_surface_draw_enable(false);

ppxManager = new PPFX_Renderer();
global.ppx = ppxManager;

global.invertEffect = new FX_InvertColors(false, 0);

var effects = [
    new FX_Bloom(true, 4, .97, 10, 1.25),
	global.invertEffect
];

mainProfile = new PPFX_Profile("Main", effects);

ppxManager.ProfileLoad(mainProfile);

influenceSurf = -1;
getInfluenceSurf = function() {
	if(!surface_exists(influenceSurf)) {
		influenceSurf = surface_create(room_width, room_height);
		
		surface_set_target(influenceSurf);
		
		shader_set(shd_influences);
		
		with(obj_influenceDraw) {
			var _uvs = sprite_get_uvs(spr_square, 0);
			shader_set_uniform_f(shader_get_uniform(shd_influences, "pos"), x / room_width, y / room_height);
			shader_set_uniform_f(shader_get_uniform(shd_influences, "color"), color[0], color[1], color[2]);
			shader_set_uniform_f(shader_get_uniform(shd_influences, "uvs"), _uvs[0], _uvs[1], _uvs[2], _uvs[3]);
			shader_set_uniform_f(shader_get_uniform(shd_influences, "alpha"), alpha);
			
			draw_sprite_ext(spr_square, 0, x, y, radius, radius, 0, c_white, 1);
		}
		
		shader_reset();
		
		surface_reset_target();
	}
	
	return influenceSurf;
}
	
	
	
	
	
	
	
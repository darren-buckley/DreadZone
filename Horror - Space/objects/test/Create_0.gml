// Setup:
owner = noone;
sys_particle = part_system_create()
part_system_layer(sys_particle, layer)
part_particle = part_type_create()
part_type_shape(part_particle, pt_shape_cloud)
part_type_size(part_particle, 0.02, 0.4, 0, 0)
part_type_scale(part_particle, 0.5, 0.5)
part_type_color1(part_particle, c_black)
part_type_alpha3(part_particle, 0, 0.41, 0.15)
part_type_speed(part_particle, 0.25, 1.75, 0, 0)
part_type_direction(part_particle, 0, 321, 0, 0)
part_type_gravity(part_particle, 0, 0)
//part_type_orientation(part_particle, 180, 180, 0, 0, 0)
part_type_blend(part_particle, 0)
part_type_life(part_particle, 30, 75)
part_system_depth(sys_particle,-999)
emit_particle = part_emitter_create(sys_particle)


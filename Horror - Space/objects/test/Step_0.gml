if(instance_exists(owner)){
part_emitter_region(sys_particle, emit_particle, owner.x, owner.x + 2, owner.y-10,owner.y+10, ps_shape_rectangle, ps_distr_linear)
part_emitter_burst(sys_particle, emit_particle, part_particle, 20)
}

/// Draw event
if (hit) { 
	uc_shake(10);
	shader_set(shFlash);  // apply white flash
    draw_self();  
    shader_reset();

} else {
    draw_self(); // no shader is applied.
}
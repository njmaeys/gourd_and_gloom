/// @description 


// Manage any room specific quest things
if room == rm_witches_home 
	and self.quest_tracker.introduction.completed
{
	instance_destroy(obj_mushroom_red);
	instance_destroy(obj_sunflower);
}



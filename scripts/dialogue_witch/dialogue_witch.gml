function dialogue_witch(_dialogue_state) {
	// Determine the things the witch needs to say
	// I should also consider having a bit of logic somewhere to choose the quest recipes for NPCs
	switch (_dialogue_state) {
		case "Introduction":
			if obj_quest_manager.quest_tracker.introduction.completed {
				return;
			}

			return [
				"Ahh... I see you are ready to get going.",
				"I created you to help me brew my potions.",
				"Every day we have a new list of customer requests, \nand some personal requests.",
				"To get started, go grab the [c_red]Red Mushrooms[/c] and \n[c_yellow]Sunflowers[/c] by the bookshelves and bring them to \nthe [c_lime]Cauldron[/c].",
				"We will be making a [c_red]Basic Health Potion[/c] to start.",
			]
			
		case "First Potions":
			if obj_quest_manager.quest_tracker.first_potions.completed {
				return;
			}

			// Allow the player to leave the witches house
			// NOTE: This causes a bit of a bug if the player leaves before talking to the Witch
			obj_room_transition.can_use = true;
			// TODO: Put up a little banner or poster of how the cauldron works on the wall as a reminder
			return [
				"That was simple enough, now we need to get to work.",
				"You'll need to find ingredients in the [c_orange]garden[/c] and \nin the nearby [c_orange]woods[/c].",
				"I need you to make three more [c_red]Basic Health Potions[/c] \ntoday.",
				"You can check the [c_orange]desk[/c] to see what you have left \nto do.",
				"You can select which potion you want to work on \nfirst. Also, we cannot mix ingredients, \nthat would [shake]ruin[/shake] the brew!",
				"If you choose a different potion your ingredients \nwill be lost! \nEven if it was the same potion type. \nThat's just how it works...",
				"You can check the cauldron to see what potion \nrecipe is currently being brewed.",
			]
	}
}


function quest_finished(_progress, _exit_criteria, _dialogue_state) {

	if array_length(_progress) <= 0 {
		// No point to do anything if the array is just an empty thing
		return;
	}

	// New strat
	// Look at the summation of the potion count in exit criteria vs progress.
	// With the assumtion I'm continuing to use then 1:1 in potion progress should eventually match complated quest count of potions brewed
	// NOTE: I may make other exit criteria per quest but for now I like this as the entry criteria into a question complet... Simple question. Have you brewed it all?
	var _exit_count = 0;
	var _progress_count = 0;
	
	for (var _i = 0; _i < array_length(_exit_criteria); _i += 1) {
		_exit_count += _exit_criteria[_i].potion_count;
		_progress_count += _progress[_i].potion_count;
	}
	
	//show_debug_message($"Exit count: {_exit_count}");
	//show_debug_message($"Prog count: {_progress_count}");
	
	if _exit_count == _progress_count
		and _exit_count != 0
	{
		obj_player.quest_completed = true;


		//show_debug_message("### Criteria met ###");
		//show_debug_message(_dialogue_state);

		switch (_dialogue_state) {
			case "Introduction":
				if obj_quest_manager.quest_tracker.introduction.completed {
					return;
				}
				
				// TODO: Can do more here with setting up what I need the player to do next.
				obj_player.recipe_quest_exit = [];
				obj_player.recipe_quest_progress = [];

				reset_dialogue(obj_witch);
				obj_quest_manager.quest_tracker.introduction.completed = true;
				
				// Set the next interaction with the wtich
				obj_witch.has_new_quest = true;
				obj_witch.current_dialogue = "First Potions"
				quest_operations(obj_witch.current_dialogue);
				obj_quest_manager.quest_tracker.first_potions.started = true;
				
				obj_quest_manager.has_used_cauldron_once = true;
				break;
			
		
			case "First Potions":
				//show_debug_message("### COMPLETING First Potions ####");
				if obj_quest_manager.quest_tracker.first_potions.completed {
					return;
				}
				
				// TODO: Can do more here with setting up what I need the player to do next.
				obj_player.recipe_quest_exit = [];
				obj_player.recipe_quest_progress = [];

				reset_dialogue(obj_witch);
				obj_quest_manager.quest_tracker.first_potions.completed = true;
				
				// Set the next interaction with the wtich
				obj_witch.has_new_quest = false;
				obj_witch.current_dialogue = "" // TODO: Figure out what is next
				//quest_operations(obj_witch.current_dialogue);
				
				// TODO: Move around as I progress
				obj_cauldron.current_recipe = -1; // For now this is just a reset til the next quest is 
				obj_cauldron.current_recipe_index = 0; // For now this is just a reset til the next quest is 
				obj_player_inventory.temp_game_end = true;
				break;
		}
	}
	
	obj_player.quest_completed = false;
}


function quest_operations(_quest_name) {
	switch (_quest_name) {
		case "":
			// Set some default stuff when no quest needed
			obj_cauldron.current_recipe = -1;
		
		case "Introduction":
			// Ensure that if the quest has already started we kick out
			if obj_quest_manager.quest_tracker.introduction.started {
				break;
			}
		
			// The player can't move at this point so after the dialogue is done then they are free to move
			// which means I can just set the initial quest objects ready to collect
			with (obj_par_recipe_items) {
				can_collect = true;
			}
			
			// Set the cauldron indicator
			obj_quest_manager.has_used_cauldron_once = false;
			
			// Create the exit criteria and starting values
			obj_player.recipe_quest_exit = [
				{
					potion_name: "Basic Health Potion",
					potion_count: 1,
					potion_spr: spr_basic_health_potion
				}
			]
			obj_player.recipe_quest_progress = [
				{
					potion_name: "Basic Health Potion",
					potion_count: 0,
					potion_spr: spr_basic_health_potion
				}
			]
			
			// For the introduction it will set to the first one
			obj_cauldron.current_recipe = known_recipes(obj_player.recipe_quest_progress[0].potion_name)
			obj_cauldron.current_recipe_index = 0;
			obj_quest_manager.quest_tracker.introduction.started = true;
			obj_quest_manager.last_witch_quest = "Introduction";
			
			return;
			
		case "First Potions":
			// Ensure that if the quest has already started we kick out
			if obj_quest_manager.quest_tracker.first_potions.started {
				break;
			}
			
			// Create the exit criteria and starting values
			obj_player.recipe_quest_exit = [
				{
					potion_name: "Basic Health Potion",
					potion_count: 1,
					potion_spr: spr_basic_health_potion
				},
				{
					potion_name: "Basic Health Potion",
					potion_count: 1,
					potion_spr: spr_basic_health_potion
				},
				{
					potion_name: "Basic Health Potion",
					potion_count: 1,
					potion_spr: spr_basic_health_potion
				}
			]
			obj_player.recipe_quest_progress = [
				{
					potion_name: "Basic Health Potion",
					potion_count: 0,
					potion_spr: spr_basic_health_potion
				},
				{
					potion_name: "Basic Health Potion",
					potion_count: 0,
					potion_spr: spr_basic_health_potion
				},
				{
					potion_name: "Basic Health Potion",
					potion_count: 0,
					potion_spr: spr_basic_health_potion
				}
			]
			
			// Always default to setting the current recipe to the 0th element
			obj_cauldron.current_recipe = known_recipes(obj_player.recipe_quest_progress[0].potion_name)
			obj_cauldron.current_recipe_index = 0;
			obj_quest_manager.last_witch_quest = "First Potions";

			return;
			
	}
}

function known_quests() {
	return {
		introduction: {
			completed: false,
			started: false,
		},
		first_potions: {
			completed: false,
			started: false,
		}
	}
}

///scr_behavior_tree

//tree[0] = root node
//tree[1], [2], [3], ... [9] are children
//etc...

//Selector will test each child node, and return true if one succeeds and false if none do.
//Sequence will test each child node, adn return true if all succeed and false otherwise.

//Run the tree

//To iterate downwards: tree[node * 10 + x], where x ranges from 0 to 9

if (obj_enemy_fox.tree[node] == "Selector") {
	
	stack = ds_stack_create();
	
	//need to run through each child node
	/*obj_enemy_fox.node *= 10;
	for (i = 0; i < 3; i++) {
		obj_enemy_fox.node += 1;
		show_debug_message(obj_enemy_fox.tree[node]);
	}*/
	
	ds_stack_push(stack, obj_enemy_fox.tree[node]);
	while (!ds_stack_empty(stack)) {
		obj_enemy_fox.node *= 10;
		ds_stack_pop(stack);
		for (i = 0; i < 3; i++) {
			obj_enemy_fox.node += 1;
			show_debug_message(obj_enemy_fox.tree[node]);
			//ds_stack_push(stack, obj_enemy_fox.tree[node]);
		}
	}
	
}
///End cutscene
if (cutsceneEnd == true) {
	switch (alarm[0]) {
		case 56:
			obj_cutscene.bandx = 29;
			break;
	
		case 50:
			obj_cutscene.bandx = 28;
			break;
	
		case 44:
			obj_cutscene.bandx = 26;
			break;
	
		case 38:
			obj_cutscene.bandx = 10;
			break;
		
		case 32:
			obj_cutscene.bandx = 5;
			break;
		
		case 26:
			obj_cutscene.bandx = 2;
			break;
		
		case 20:
			obj_cutscene.bandx = 1;
			break;
		
		case 14:
			obj_cutscene.bandx = 0;
			endCutscene = false;
			break;
	}
}
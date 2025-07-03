draw_set_color(c_black);
var _screenRight = view_wport[0] - 282;
draw_text(_screenRight, 30, $"Current: {realmCurrent}");
draw_text(_screenRight, 50, $"Goal: {realmGoal}");
draw_text(_screenRight, 70, $"Path pos: {path_position}");
draw_text(_screenRight, 90, $"Moving: {currentlyMoving}");
draw_text(_screenRight, 110, $"Speed: {path_speed}");
draw_text(_screenRight, 130, $"Vulnerable: {!godmode}");
draw_text(_screenRight, 150, $"Alive: {!currentlyDying}");
draw_set_color(c_white);




if(showProgressionGui) {
	draw_set_color(c_black);
	draw_text(view_wport[0] / 2 - 100, 40, global.bossKillsArray);
	draw_text(view_wport[0] / 2 - 100, 70, global.questItemsArray);
	draw_text(view_wport[0] / 2 - 100, 100, global.secretPathArray);
	draw_text(view_wport[0] / 2 - 100, 130, global.gameProgressArray);
	draw_set_color(c_white);
}
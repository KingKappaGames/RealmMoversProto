entitySource = 1 + irandom(5);

radius = 500 + irandom(700); // NORMALIZED

color = choose([1, 0, 0], [0, 1, 0], [0, 0, 1]); // normalized color array (vec3) (red)
alpha = random_range(.4, 1);
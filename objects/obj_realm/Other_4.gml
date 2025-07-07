deathConnection = [];

repeat(2) {
	array_push(deathConnection, instance_find(obj_realm, irandom(instance_number(obj_realm) - 1)));
}
class Game

	constructor: (player, enemies) ->
		@player = new Player player
		@enemies = (new Enemy enemy for enemy in enemies)

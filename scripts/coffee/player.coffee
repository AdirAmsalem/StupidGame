class Player

	constructor: (@name) ->
		@score = 0
		@bullets = 30
		@position =
			x: 100
			y: window.innerHeight - 100

		@spawn()

	spawn: ->
		@dom = document.createElement "div"
		@dom.className = "player"
		@dom.dataset.name = @name
		@dom.style.webkitTransform = "translate(#{@position.x}px, #{@position.y}px)"
		document.body.appendChild @dom

		@registerEvents()

	registerEvents: ->
		document.addEventListener "click", (e) =>
			@attack
				x: e.layerX
				y: e.layerY

		document.addEventListener "keydown", (e) =>
			if e.which is 38 and @position.y > 30
				@move(-30)
			else if e.which is 40 and @position.y < window.innerHeight - 100
				@move(30)

	move: (amount) ->
		@position.y += amount
		@dom.style.webkitTransform = "translate(#{@position.x}px, #{@position.y}px)"

	attack: (target) ->
		new Fireball @position, target if @bullets and --@bullets

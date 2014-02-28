class Enemy

	randomPosition = ->
		maxWidth = window.innerWidth - 100
		minWidth = maxWidth - (maxWidth / 3)
		maxHeight = window.innerHeight - 100

		x: Math.floor Math.random() * (maxWidth - minWidth + 1) + minWidth
		y: Math.floor Math.random() * (maxHeight - 50 + 1) + 50

	constructor: (@name) ->
		@position = randomPosition()
		@alive = true

		@spawn()

	spawn: ->
		@dom = document.createElement "div"
		@dom.className = "enemy"
		@dom.dataset.name = @name
		@dom.style.webkitTransform = "translate(#{@position.x}px, #{@position.y}px)"
		document.body.appendChild @dom

		@registerEvents()

	registerEvents: ->
		@dom.addEventListener "click", (e) =>
			setTimeout =>
				@die()
			, 1500

	die: ->
		@alive = false
		@dom.remove()

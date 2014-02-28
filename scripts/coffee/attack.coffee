class Attack

	constructor: (@source, @target) ->
		@fire()

	fire: (type) ->
		@dom = document.createElement "div"
		@dom.className = "attack"
		@dom.className += " " + type if type?
		@dom.style.webkitTransform = "translate(#{@source.x}px, #{@source.y}px)"
		document.body.appendChild(@dom)

		requestAnimationFrame =>
			@dom.style.webkitTransform = "translate(#{@target.x}px, #{@target.y}px)"

			setTimeout =>
				@destroy()
			, 1500

	destroy: ->
		@dom.remove()

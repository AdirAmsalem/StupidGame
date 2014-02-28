App = (->

	registerEvents = ->
		restartButton = document.querySelector(".restart-button")

		restartButton.addEventListener "click", (e) ->
			e.preventDefault()
			e.stopPropagation()

			methods.restart()

	methods =
		init: ->
			new Game "You", ["Kio", "Neo", "Danke", "Kawita"]
			registerEvents()

		restart: ->
			window.location.reload()

)()

App.init()
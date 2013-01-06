#= require_self
#= require ./app/routes/router
#= require_tree ./app/models
#= require_tree ./app/controllers
#= require_tree ./app/views
#= require_tree ./app/templates
#= require_tree ./app/routes

soundManager.setup({
  url: '/swf',
  debugMode: false
})

@App = Ember.Application.create()

App.episodes = Ember.A([])
App.years = Ember.A([])

App.ready = ->
  Ember.$.getJSON "/data.json", (json) ->
    for e in json.episodes
      App.episodes.pushObject(App.Episode.create(e))

    for y in json.years
      App.years.pushObject(App.Year.create(y))


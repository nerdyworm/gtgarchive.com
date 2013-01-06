App.EpisodesByYearRoute = Ember.Route.extend
  model: (params) ->
    App.Year.create params

  setupController: (controller, model) ->
    @controllerFor('filteredEpisodes').set('year', model)

  renderTemplate: ->
    @render 'episodes', into: 'application', controller: 'filteredEpisodes'


App.ApplicationRoute = Ember.Route.extend
  events:
    pause: (episode) ->
      @controllerFor('player').pause(episode)

    play: (episode) ->
      @controllerFor('player').play(episode)

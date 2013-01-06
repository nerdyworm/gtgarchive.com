App.ApplicationRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'playerController', @controllerFor('player')

  events:
    pause: (episode) ->
      @controllerFor('player').pause(episode)

    play: (episode) ->
      @controllerFor('player').play(episode)

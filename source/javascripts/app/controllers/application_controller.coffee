App.ApplicationController = Ember.Controller.extend
  needs: ['player']

  player: Ember.computed ->
    @controllerFor('player')

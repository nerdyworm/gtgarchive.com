App.EpisodeView = Ember.View.extend
  templateName: 'episode'

  didInsertElement: ->
    episodeEl = @$(".episode")
    @$("img").on 'load',  ->
      episodeEl.addClass('in')

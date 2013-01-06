App.WaveformView = Ember.View.extend
  classNames: ['waveform-view']

  template: Ember.Handlebars.compile """
    <div class="background"></div>
    <div class="loaded" {{bindAttr style="view.loadedStyle"}}></div>
    <div class="progress" {{bindAttr style="view.progressStyle"}}></div>
    <img {{bindAttr src="view.episode.waveform"}} class="overlay">
  """

  progress: Ember.computed ->
    if @get('episode')
      100 * (@get('episode.position') / @get('episode.duration'))
    else
      0
  .property 'episode.position', 'episode.duration'

  loaded: Ember.computed ->
    if @get('episode')
      100 * (@get('episode.bytesLoaded') / @get('episode.bytesTotal'))
    else
      0
  .property 'episode.bytesLoaded', 'episode.bytesTotal'

  progressStyle: Ember.computed ->
    "width: #{@get('progress')}%"
  .property 'progress'

  loadedStyle: Ember.computed ->
    "width: #{@get('loaded')}%"
  .property 'loaded'

  didInsertElement: ->
    @width = @$().width()

  click: (e) ->
    @scrubbing = false
    @jumpEvent(e)

  jumpEvent: (e) ->
    @get('episode').jump @getX(e) / @width

  getX: (e) ->
    e.pageX - $(e.currentTarget).offset().left

  mouseMove: (e) ->
    @jumpEvent(e) if @scrubbing

  mouseDown: (e) ->
    e.preventDefault()
    @scrubbing = true

  mouseUp: (e) ->
    @scrubbing = false

  mouseLeave: (e) ->
    @scrubbing = false

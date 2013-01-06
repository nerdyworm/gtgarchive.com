App.PlayerController = Ember.ObjectController.extend
  content: null

  play: (episode) ->
    @stopOtherEpisodes(episode)
    @playEpisode(episode)

  stopOtherEpisodes: (episode) ->
    content = @get 'content'
    return unless content
    unless Ember.isEqual(content, episode) then @stop()

  stop: ->
    if @sound
      @sound.destruct()
      @sound = null
      @reset()

  reset: ->
    @setProperties
      isPlaying: false
      isPaused: false
      position: 0
      duration: 0
      bytesLoaded: 0
      bytesTotal: 0

  playEpisode: (episode) ->
    @set 'content', episode
    @reset()
    @sound = soundManager.createSound(@soundOptions())
    @set 'content.sound', @sound
    @sound.play()
    @set 'isPlaying', true

  soundOptions: ->
    id: "current-sound"
    url: @get('download')
    whileplaying: => @whileplaying()
    whileloading: => @whileloading()

  whileplaying: ->
    @setProperties
      position: @sound.position
      duration: @sound.durationEstimate

  whileloading: ->
    @setProperties
      bytesLoaded: @sound.bytesLoaded
      bytesTotal:  @sound.bytesTotal

  pause: (episode) ->
    @sound.pause() if @sound
    @set 'isPlaying', false
    @set 'isPaused', true


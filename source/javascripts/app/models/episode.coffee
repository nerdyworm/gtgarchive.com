App.Episode = Ember.Object.extend
  position: 0

  waveform: Ember.computed ->
    "http://gtgarchive.com/waveforms/#{@get('id')}.png"
  .property 'id'

  download: Ember.computed ->
    "http://gtgarchive.com/episodes/#{@get('id')}.mp3"
  .property 'id'

  artist: Ember.computed ->
    part2 = @get 'part2'
    if Ember.isEmpty(part2) then @get('part1') else part2
  .property 'part1', 'part2'

  # XXX - here?
  jump: (float) ->
    sound = @get 'sound'
    sound.setPosition(float * sound.durationEstimate)

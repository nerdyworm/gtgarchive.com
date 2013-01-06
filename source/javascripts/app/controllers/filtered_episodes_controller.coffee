App.FilteredEpisodesController = Ember.ArrayController.extend
  year: null
  content: App.episodes
  filtered: Ember.computed ->
    @filterProperty 'year', @get('year.id')
  .property '@each.year', 'year'

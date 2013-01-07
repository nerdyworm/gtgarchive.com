App.YearsController = Ember.ArrayController.extend
  thing: null
  content: App.years
  latest: Ember.computed ->
    @get('firstObject')
  .property "@each"

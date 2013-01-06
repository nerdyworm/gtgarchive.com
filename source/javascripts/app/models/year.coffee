App.Year = Ember.Object.extend
  name: Ember.computed ->
    @get('id').toString()
  .property('id')


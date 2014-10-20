module.exports =
  map: (doc) ->
    if doc.type and doc.type is 'game' and doc.scoreEntered
      emit [ doc.tossups, doc.room ], 1
  reduce: '_count'

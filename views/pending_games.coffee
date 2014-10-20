module.exports =
  map: (doc) ->
    if doc.type and doc.type is 'game' and !doc.playersEntered
      emit doc._id

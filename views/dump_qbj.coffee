module.exports =
  map: (doc) ->
    to_id = (name) -> name.toLowerCase().replace /[^a-z0-9]+/g, '_'
    if doc.type
      if doc.type is 'game' and doc.playersEntered
        emit [1, 'match', doc.round, doc._id], doc
      if doc.type is 'school'
        emit [0,'registration', doc._id], doc
      if doc.type is 'tournament'
        emit [2,'tournament', doc._id], doc

module.exports =
  map: (doc) ->
    if doc.type and doc.type is 'game' and doc.scoreEntered
      emit [ doc.round, doc.team1.name, doc.team1.points, doc.team2.name, doc.team2.points ], doc.round
  reduce: '_stats'

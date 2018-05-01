module.exports =
  map: (doc) ->
    if doc.type and doc.type is 'game' and doc.scoreEntered
      if (doc.team1.points is 1 or doc.team2.points is 1) and doc.tossups is 0
        emit [ doc.round, doc.team1.name, (if doc.team1.points == 0 then 'Forfeit Loss' else 'Forfeit Win'), doc.team2.name, (if doc.team2.points == 0 then 'Forfeit Loss' else 'Forfeit Win')], doc.round
      else
        emit [ doc.round, doc.team1.name, doc.team1.points, doc.team2.name, doc.team2.points ], doc.round
  reduce: '_stats'

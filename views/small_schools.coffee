module.exports =
  map: (doc) ->
    if doc.type and doc.type is 'school' and doc.small
      for team in doc.teams
        emit team.id, team.name
  reduce: '_count'

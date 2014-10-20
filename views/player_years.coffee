module.exports =
  map: (doc) ->
    if doc.type and doc.type is 'school'
      for team in doc.teams
        for player in team.players
          emit [ team.name, player.name ], player.year if player.year?
  reduce: '_sum'

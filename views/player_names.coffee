module.exports =
  map: (doc) ->
    emit_names = (team) ->
      index = 1
      for player in team.players
        emit [team.name, player.name], index
        index += 1
    if doc.type
      if doc.type is 'school'
        emit_names team for team in doc.teams
      if doc.type is 'game'
        emit_names team for team in [doc.team1, doc.team2]
  reduce: '_sum'

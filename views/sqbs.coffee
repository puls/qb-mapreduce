module.exports =
  map: (doc) ->
    numeric_id = (id) -> if id.indexOf '_' >= 0 then id.split('_')[1] else id
    to_id = (name, id) ->
      namePart = name.toLowerCase().replace /[^a-z0-9]+/g, '_'
      if id? then namePart + '_' + numeric_id(id) else namePart
    if doc.type
      if doc.type is 'game' and doc.playersEntered
        emit ['scores', doc.bracket, doc.round, to_id(doc.team1.name, doc.team1.id), to_id(doc.team2.name, doc.team2.id), doc.team1.points, doc.team2.points, doc.tossups], null
        for player in doc.team1.players
          emit ['indstats', doc.bracket, doc.round, to_id(doc.team1.name, doc.team1.id), to_id(doc.team2.name, doc.team2.id), player.name, doc.tossups, player.tossups, player.fifteens, player.tens, player.negFives], null if player.name
        for player in doc.team2.players
          emit ['indstats', doc.bracket, doc.round, to_id(doc.team2.name, doc.team2.id), to_id(doc.team1.name, doc.team1.id), player.name, doc.tossups, player.tossups, player.fifteens, player.tens, player.negFives], null if player.name
      if doc.type is 'school'
        for team in doc.teams
          if team.id?
            id = numeric_id(team.id)
            emit ['teams', to_id(team.name, team.id), "#{team.name} team_id:#{id}", doc.name, doc.city, doc.small || false], null
          else
            emit ['teams', to_id(team.name, team.id), team.name, doc.name, doc.city, doc.small || false], null
          for player in team.players
            if player.id?
              id = numeric_id(player.id)
              emit ['_players', to_id(team.name, team.id), player.name], "#{player.name} team_member_id:#{id}"

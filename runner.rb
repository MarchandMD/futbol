require 'erb'
require './lib/stat_tracker'

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'

game_path2 = './data/games_dummy.csv'
team_path2 = './data/teams_dummy.csv'
game_teams_path2 = './data/game_teams_dummy.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

locations2 = {
  games: game_path2,
  teams: team_path2,
  game_teams: game_teams_path2
}

stat_tracker = StatTracker.from_csv(locations)

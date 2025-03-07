require 'rspec'
require './lib/stat_tracker'

RSpec.describe StatTracker do
  before(:each) do
    game_path = './data/games_dummy.csv'
    team_path = './data/teams_dummy.csv'
    game_teams_path = './data/game_teams_dummy.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  describe '#initialize' do
  end

  describe '#highest_total_score' do
    it 'returns highest total score of all games' do
      expect(@stat_tracker.highest_total_score).to eq(5)
    end
  end

  describe '#lowest_total_score' do
    it 'returns lowest total score of all games' do
      expect(@stat_tracker.lowest_total_score).to eq(1)
    end
  end

  describe '#sum_goals_array' do
    it 'returns an array of the sums of home goals and away goals' do
      expect(@stat_tracker.sum_goals_array).to be_an(Array)
    end
  end

  describe '#percentage_ties' do
    it 'returns the percent that the games have ended in a tie' do
      expect(@stat_tracker.percentage_ties).to eq(0.06)
    end
  end

  describe '#average_goals_per_game' do
    it 'returns the average number of goals scored in a game across all seasons' do
      expect(@stat_tracker.average_goals_per_game).to eq(3.9)
    end
  end

  describe '#percentage_home_wins' do
    it 'returns the percentage of the home team wins' do
      expect(@stat_tracker.percentage_home_wins).to eq(0.5)
    end
  end

  describe '#percentage_visitor_wins' do
    it 'returns the percentage of the visitor team wins' do
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.5)
    end
  end

  describe '#count_of_teams' do
    it 'counts all unique teams' do
      expect(@stat_tracker.count_of_teams).to eq(9)
    end
  end

  describe 'count_of_games_by_season' do
    it 'counts games by season' do
      expect(@stat_tracker.count_of_games_by_season).to eq({ "20122013" => 9, "20132014" => 1 })
    end
  end

  describe '#average_goals_by_season' do
    it 'tabulates average goals by season' do
      expect(@stat_tracker.average_goals_by_season).to eq({ "20122013" => 3.78, "20132014" => 5.0 })
    end
  end

  describe '#best_offense' do
    it 'can return Name of the team with the highest avg # of goals/game scored across all seasons' do
      # require 'pry'; binding.pry
      expect(@stat_tracker.best_offense).to be_a String
    end
  end

  describe '#worst_offense' do
    it 'can return Name of the team with the lowest avg # of goals/game scored across all seasons' do
      # require 'pry'; binding.pry
      expect(@stat_tracker.worst_offense).to be_a String
    end
  end

  describe '#winningest_coach' do
    it 'can return Name of the Coach with the best win percentage for the season' do
      expect(@stat_tracker.winningest_coach("20122013")).to eq("Claude Julien")
    end
  end
  describe '#worst_coach' do
    it 'can return Name of the Coach with the best win percentage for the season' do
      expect(@stat_tracker.worst_coach("20122013")).to be_a String
    end
  end

  describe '#percentage_home_wins' do
    it 'finds the percetage of home wins' do
      # cool code goes here
    end
  end

  describe '#average_win_percentage' do
    it 'calculates average win percentage of a single team' do
      expect(@stat_tracker.average_win_percentage('3')).to eq(0)
      expect(@stat_tracker.average_win_percentage('16')).to eq(0.43)
    end
  end

  describe '#most_goals_scored' do
    it 'can return highest number of goals a particular team has scored in a single game' do
      # allow(@stat_tracker).to receive(:most_goals_scored) { 4 }
      expect(@stat_tracker.most_goals_scored(6)).to eq(4)
    end
  end

  describe '#fewest_goals_scored' do
    it 'can return lowest number of goals a particular team has scored in a single game' do
      # allow(@stat_tracker).to receive(:fewest_goals_scored) { 1 }
      expect(@stat_tracker.fewest_goals_scored(6)).to eq(1)
    end
  end

  describe '#most_accurate_team' do
    it 'returns name of team with the best shots to goals ratio' do
      expect(@stat_tracker.most_accurate_team('20122013')).to eq('FC Dallas')
    end
  end

  describe '#least_accurate_team' do
    it 'returns name of team with the worst shots to goals ratio' do
      expect(@stat_tracker.least_accurate_team('20122013')).to eq('Sporting Kansas City')
    end
  end

  describe '#highest_scoring_visitor' do
    it 'returns the name of the team with the highest average score per game across all seasons when they are away' do
      expect(@stat_tracker.highest_scoring_visitor).to eq('FC Dallas')
    end
  end

  it "#most_tackles" do
    expect(@stat_tracker.most_tackles("20122013")).to eq "FC Dallas"
  end

  it "#fewest_tackles" do
    allow(@stat_tracker).to receive(:team_finder).and_return('Atlanta United')
    expect(@stat_tracker.fewest_tackles("20122013")).to eq "Atlanta United"
  end

  describe '#lowest_scoring_visitor' do
    it 'returns the name of the team with the lowest average score per game across all seasons when they are away' do
      expect(@stat_tracker.lowest_scoring_visitor).to eq('Sporting Kansas City')
    end
  end

  describe '#highest_scoring_home_team' do
    it 'returns the name of the team with the highest average score per game across all seasons when they are home' do
      expect(@stat_tracker.highest_scoring_home_team).to eq('FC Dallas')
    end
  end

  describe '#lowest_scoring_home_team' do
    it 'returns the name of the team with the lowest average score per game across all seasons when they are home' do
      expect(@stat_tracker.lowest_scoring_home_team).to eq('Sporting Kansas City')
    end
  end

  describe '#team_info' do
    it 'returns a hash with the team info' do
      expect(@stat_tracker.team_info('1')).to eq({ 'team_id' => '1', 'franchise_id' => '23', 'team_name' => 'Atlanta United', 'abbreviation' => 'ATL', 'link' => '/api/v1/teams/1' })
    end
  end

  describe '#favorite opponent' do
    it 'returns opponent that the team has the best record against' do
      expect(@stat_tracker.favorite_opponent('6')).to eq('Houston Dynamo')
    end
  end

  describe '#rival' do
    it 'returns opponent that the team has the best record against' do
      expect(@stat_tracker.rival('6')).to eq('Houston Dynamo')
    end
  end

  describe '#best_season' do
    it 'returns the season with the highest win percentage for a team' do
      expect(@stat_tracker.best_season("6")).to eq "20122013"
    end
  end

  describe '#worst_season' do
    it "returns the season with the lowest win percentage for a team" do
      expect(@stat_tracker.worst_season("6")).to eq "20122013"
    end
  end

  describe '#game_data_for_a_season' do
    it 'returns an array of csv_rows' do
      expect(@stat_tracker.game_data_for_a_season('20122013')).to be_an Array
    end
  end

  describe '#return_column' do
    it 'returns column of information from data set' do
      data_set = [
        { team: 1, goals: 2, wins: 4 },
        { team: 2, goals: 2, wins: 4 },
        { team: 3, goals: 2, wins: 4 },
        { team: 4, goals: 2, wins: 4 }
      ]

      expect(@stat_tracker.return_column(data_set, :goals)).to eq([2, 2, 2, 2])
    end
  end
end

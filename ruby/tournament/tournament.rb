class Tournament
  PATTERN = /^([\w ]+);([\w ]+);(win|loss|draw)$/
  INVERT_RESULT = {win: :loss, draw: :draw, loss: :win}

  class << self
    def tally(input)
      teams = calcul_stats(input)
      result = ['Team                           | MP |  W |  D |  L |  P']

      teams.sort_by { |team, value| value[:points] }.reverse.each_with_object(result) do |partial_result, result|
        team_name = partial_result.first
        stats = partial_result.last
        line = [team_name.ljust(30), stats[:matches_played], stats[:win], stats[:draw], stats[:loss], stats[:points]]
        result << line.join(' |  ')
      end.join("\n") + "\n"
    end

    private

    def calcul_stats(input)
      teams = Hash.new { |hash, team| hash[team] = Hash.new { |team, result| team[result] = 0 } }

      input.each_line.with_object(teams) do |line, teams|
        next if line.scan(PATTERN).first.nil?
        action = $3.to_sym
        first_team, second_team = $1, $2
        case action
        when :win
          teams[first_team][:points] += 3
        when :loss
          teams[second_team][:points] += 3
        when :draw
          teams[second_team][:points] += 1
          teams[first_team][:points] += 1
        end
        teams[first_team][action] += 1
        teams[second_team][INVERT_RESULT[action]] += 1
        teams[first_team][:matches_played] += 1
        teams[second_team][:matches_played] += 1
      end
    end
  end
end
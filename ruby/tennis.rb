class TennisGame
  DEFAULT_NAMES = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty",
  }

  DEUCE = "Deuce"
  ALL_SUFIX = "-All"
  ADVANTAGE = "Advantage"
  WIN_FOR = "Win for"


  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def score
    return equal_points_result(@p1points) if is_equal_points?(@p1points, @p2points)

    if is_potential_winner?(@p1points, @p2points)
      return potential_winner_result(@p1points, @p2points, @player1Name, @player2Name)
    end

    normal_result(@p1points, @p2points)
  end

  def is_equal_points?(p1points, p2points)
    p1points == p2points
  end

  def equal_points_result(p1points)
    return DEUCE if p1points > 2

    DEFAULT_NAMES[p1points] + ALL_SUFIX
  end

  def is_potential_winner?(p1points, p2points)
    p1points >= 4 or p2points >= 4
  end

  def potential_winner_result(p1points, p2points, player1Name, player2Name)
    minusResult = p1points - p2points

    return ADVANTAGE + " " + player1Name if minusResult == 1
    return ADVANTAGE + " " + player2Name if minusResult == -1
    return WIN_FOR + " " + player1Name if minusResult >= 2

    WIN_FOR + " " + player2Name
  end

  def normal_result(p1points, p2points)
    DEFAULT_NAMES[p1points] + "-" + DEFAULT_NAMES[p2points]
  end
end

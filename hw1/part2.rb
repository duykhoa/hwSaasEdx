class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # R>S, S>P, P>R
  strategy = ['P','S','R']
  raise NoSuchStrategyError unless strategy.include?(m1[1]) && strategy.include?(m2[1])
  return m1 if m1[1] == m2[1]
  win_strategy = {R: :S, S: :P, P: :R}
  win_strategy[m1[1].to_sym] == m2[1].to_sym ? m1 : m2
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
  if !tournament[0][0].is_a? Array
    rps_game_winner(tournament)
  else
    rps_result rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])
  end
end

#puts rps_game_winner([["Khoa","R"],["Thu","P"]])
tournament = [
  [
    ["Khoa","R"],["Thu","P"]
  ],
  [
    ["Chris","S"],["Phuong","R"]
  ]
]
puts rps_tournament_winner tournament
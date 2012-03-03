#Part 2: Rock-Paper-Scissors
#In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P),
#or Scissors (S). The rules are: Rock beats Scissors, Scissors beats Paper, but
#Paper beats Rock.
#A rock-paper-scissors game is encoded as a list, where the elements are 2-element
#lists that encode a player’s name and a player’s strategy.
#[  [ "Armando", "P" ], [ "Dave", "S" ] ]
#   => returns the list ["Dave", "S"] wins since S>P

# G Conant


#(a) Write a method rps_game_winner that takes a two-element list and behaves
#as follows:
#- If the number of players is not equal to 2, raise WrongNumberOfPlayersError
#- If either player's strategy is something other than "R", "P" or "S" (case-insensitive),
#raise NoSuchStrategyError
#- Otherwise, return the name and strategy of the winning player. If both players use
#the same strategy, the first player is the winner.

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def strategy_is_valid(playerAndStrategy)
  strategy = playerAndStrategy[1]
  raise NoSuchStrategyError unless strategy =~ /^[rps]$/i
  true
end
def play_wins(play1, play2)
  #puts play1 + ' wins against ' + play2 + '?'
  if (play1 == play2) ; return true; end

  result =    (play1 == 'R') && (play2 == 'S') ||
    (play1 == 'P') && (play2 == 'R') ||
    (play1 == 'S') && (play2 == 'P') 
  
  #puts result
  result
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  #puts game[0].to_s + ' versus ' + game[1].to_s
  strategy_is_valid(game[0]) && strategy_is_valid(game[1])
  if (play_wins(game[0][1], game[1][1]))
    return game[0]
  else
    return game[1]
  end 

end
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'R'], ['Monster Mash', 'R']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'R'], ['Monster Mash', 'P']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'R'], ['Monster Mash', 'S']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'P'], ['Monster Mash', 'R']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'P'], ['Monster Mash', 'P']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'P'], ['Monster Mash', 'S']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'S'], ['Monster Mash', 'R']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'S'], ['Monster Mash', 'P']]).to_s
#puts 'Winner: ' + rps_game_winner([['Weirdy', 'S'], ['Monster Mash', 'S']]).to_s

def is_two_person_game?(tournament)
  if(tournament[0].kind_of?(Array) and tournament[0][0].is_a?(String))
     return true
  else
    return false
  end
end

def contains_tournaments?(tournament)
  if(tournament.length == 2 and tournament[0][0].kind_of?(Array))
    return true
  end
end

def rps_tournament_winner(tournament)
#puts tournament.length
  #puts "start tournament: " + tournament.to_s
  winner = []
  winner1 = []
  winner2 = []
  #puts "  tournament: " + tournament.to_s
  nextGame = []
  
  if (tournament.kind_of?(Array))
    if(is_two_person_game?(tournament))
      #print "    game 1: " + tournament[0][0].to_s + ' versus ' + tournament[1][0].to_s + "\r\n"
      winner = rps_game_winner(tournament)
      #print "    winner: " + winner.to_s + "\r\n"
    elsif(contains_tournaments?(tournament))
      winner1 = rps_tournament_winner(tournament[0])
      winner2 = rps_tournament_winner(tournament[1])
      #puts "    winner1: " + winner1.to_s
      #puts "    winner2: " + winner2.to_s
      nextGame.push(winner1)
      nextGame.push(winner2)
      #print "   next game: " + nextGame.to_s + "\r\n"
      winner = rps_tournament_winner(nextGame)
    end
  end
  return winner
end

tournament = 
  [
    [
      [ 
        ["Armando", "P"], ["Dave", "S"] 
      ],
      [ 
        ["Richard", "R"],  ["Michael", "S"] 
      ],
    ],
    [
      [
        ["Allen", "S"], ["Omer", "P"] 
      ],
      [
        ["David E.", "R"], ["Richard X.", "P"]
      ]
    ]
  ]

result = rps_tournament_winner(tournament)

# Test Case - ["Richard", "R"] is the winner
print result.to_s + "\r\n"
if (result.to_s != "[\"Richard\", \"R\"]".to_s)
  puts "Failure"
else
  puts "Success"
end


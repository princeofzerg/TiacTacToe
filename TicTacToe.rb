puts "Welcome to Tic Tac Toe game:"
#Initialize the boards
board=Array.new(9){|element|element=' '}
#Draw the boards

def draw_the_boards(board)
for i in 0..board.size-1
  if i == 2 || i == 5 || i == 8
    puts board[i]
    puts "---------"
  else
    print board[i]+ ' | '
  end
end
end
#User picks

def user_picks(board)
  board2=board.each_index.select{|x|board[x] == ' '}
  puts "Please pick any number in #{board2} positions on the board"
  position=gets.chomp
  position=position.to_i
  while  !board2.include?position
    puts "Please enter again"
    position=gets.chomp
    position=position.to_i
  end
  board[position]='X'
  puts "---------------"
  return board
end
#Computer picks

def computer_picks(board)
  puts board
  puts "Computer picks"
  puts board
  slots=board.each_index.select{|x|board[x] ==' '}
  if(slots.size!=0)
    computer_position=slots.sample
    board[computer_position]='O'
  end
  puts "---------------"
end
#Check winner

def check_winner(board)
  winner=' '
  winning_lines=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
  winning_lines.each do |x|
     if board.values_at(*x).count('X')==3
       winner='You Wins'
       break
     end
     if board.values_at(*x).count('O')==3
       winner='Computer wins'
       break
     end
  end
  return winner
end
#play the game

def playthegame(board)
  message=' '
  while message == ' ' && board.include?(' ')
    draw_the_boards(board)
    user_picks(board)
    message=check_winner(board)
    if message != ' '
      break
    end
    computer_picks(board)
    message=check_winner(board)
  end
  if message == ' '
    message = 'Game Tie'
  end
  puts message
  draw_the_boards(board)
end
playthegame(board)

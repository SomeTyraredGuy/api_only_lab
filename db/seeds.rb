require 'faker'

def create_user
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

def create_board
  Board.create(
    name: Faker::Lorem.paragraph_by_chars(number: 10),
    description: Faker::Lorem.paragraph_by_chars(number: 400)
  )
end

def create_canvas_object(board)
  CanvasObject.create(
    board: board,
    x: rand(0..1000),
    y: rand(0..1000),
    width: rand(50..200),
    height: rand(50..200)
  )
end

def create_member(user, board, role)
  Member.create(
    user: user,
    board: board,
    role: role
  )
end

users = []
boards = []

5.times do
  user = create_user
  users << user
  board = create_board
  boards << board
  create_member(user, board, :owner)

  5.times { create_canvas_object(board) }
end

boards.each_with_index do |board, i_b|
  users.each_with_index do |user, i_u|
    next if i_b == i_u
    create_member(user, board, [ :editor, :viewer ].sample)
  end
end

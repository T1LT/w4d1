require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos ||= prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    res = []
    mark = next_mover_mark == :x ? :o : :x
    (0..2).each do |i|
      (0..2).each do |j|
        if board.empty?([i, j])
          temp = board.dup
          temp[[i, j]] = next_mover_mark
          res << TicTacToeNode.new(temp, mark, [i, j])
        end
      end
    end
    res
  end
end

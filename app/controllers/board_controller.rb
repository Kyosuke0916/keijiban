class BoardController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @comment = @board.comments.new
    @comments = @board.comments.all
  end

  def new
    @board = Board.new
  end


  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      render :new
    end
  end

  def board_params
    params.require(:board).permit(:name)
  end
end

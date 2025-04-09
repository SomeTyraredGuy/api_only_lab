module Api
  module V1
    class BoardsController < ApplicationController
      before_action :set_board, only: %i[ show update destroy ]

      def index
        @boards = Board.joins(:members).where(members: { user_id: params[:user_id] })

        render json: @boards
      end

      def show
        render json: @board, include_canvas_objects: true
      end

      def create
        @board = Board.new(board_params)
        @owner = Member.new(user_id: params[:user_id], role: :owner)

        ActiveRecord::Base.transaction do
          @board.save!
          @owner.board_id = @board.id
          @owner.save!
        end

        render json: @board, status: :created, location: api_v1_user_board_url(params[:user_id], @board)

      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def update
        if @board.update(board_params)
          render json: @board
        else
          render json: @board.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @board.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_board
          @board = Board.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def board_params
          params.expect(board: [ :name, :description ])
        end
    end
  end
end

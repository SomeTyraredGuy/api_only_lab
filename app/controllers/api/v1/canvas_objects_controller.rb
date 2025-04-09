module Api
  module V1
    class CanvasObjectsController < ApplicationController
      before_action :set_canvas_object, only: %i[ show update destroy ]

      # GET /canvas_objects
      def index
        @canvas_objects = CanvasObject.joins(:board).where(boards: { id: params[:board_id] })

        render json: @canvas_objects
      end

      # GET /canvas_objects/1
      def show
        render json: @canvas_object
      end

      # POST /canvas_objects
      def create
        @canvas_object = CanvasObject.new(canvas_object_params)

        if @canvas_object.save
          render json: @canvas_object, status: :created, location: api_v1_user_board_canvas_object_url(params[:user_id], params[:board_id], @canvas_object)
        else
          render json: @canvas_object.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /canvas_objects/1
      def update
        if @canvas_object.update(canvas_object_params)
          render json: @canvas_object
        else
          render json: @canvas_object.errors, status: :unprocessable_entity
        end
      end

      # DELETE /canvas_objects/1
      def destroy
        @canvas_object.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_canvas_object
          @canvas_object = CanvasObject.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def canvas_object_params
          params.expect(canvas_object: [ :board_id, :x, :y, :width, :height ])
        end
    end
  end
end

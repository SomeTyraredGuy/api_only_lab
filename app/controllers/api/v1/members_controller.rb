module Api
  module V1
    class MembersController < ApplicationController
      before_action :set_member, only: %i[ show update destroy ]

      # GET /members
      def index
        @members = Member.all

        render json: @members
      end

      # GET /members/1
      def show
        render json: @member
      end

      # POST /members
      def create
        @member = Member.new(member_params)

        if @member.save
          render json: @member, status: :created, location: api_v1_user_board_member_url(@member.user_id, @member.board_id, @member)
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /members/1
      def update
        if @member.update(member_params)
          render json: @member
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      # DELETE /members/1
      def destroy
        @member.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_member
          @member = Member.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def member_params
          params.expect(member: [ :user_id, :board_id ])
        end
    end
  end
end

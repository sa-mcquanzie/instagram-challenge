class FriendshipsController < ApplicationController
      before_action :set_friendship, only: %i[ destroy ]

  # GET /comments or /comments.json
  def index
    @friendships = Friendship.all
  end

  # GET /comments/new
  def new
    @friendship = Friendship.new
  end

  # POST /comments or /comments.json
  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to request.referer, notice: "You made a new friend :-)" }
      else
        format.html { redirect_to request.referer, notice: "Failed to add friend :-(" }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Unfriended." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_friendship
      @friendship = Friendship.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def friendship_params
      params.permit(:user_id, :friend_id)
    end
end

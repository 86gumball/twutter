class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
    @all_users = User.all.compact
    @all_users.delete(current_user)
  end

  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
    if @friendship.save
      redirect_to friendships_path, notice: 'Friendship was successfully created.'
    else
      redirect_to friendships_path, notice: 'Friendship failed to be created.'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friendships_url, notice: 'Friendship was successfully destroyed.'
  end

  private
    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end

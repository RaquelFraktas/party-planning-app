class CommentsController < ApplicationController
    before_action :require_login
    
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    current_user.comments << @comment
    @comment.save
    @party = Party.find(params[:comment][:party_id])
    redirect_to party_path(@party)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :party_id)
  end

end

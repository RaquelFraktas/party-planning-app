class CommentsController < ApplicationController
    before_action :require_login
    
  def new
  end

  def create
    # @comment = Comment.create(contemt)
    current_user.comments.build(comment_params)
    @party = Party.find(params[:comment][:party_id])
    @party.comments << @comment
    byebug
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

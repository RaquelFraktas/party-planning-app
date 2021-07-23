class CommentsController < ApplicationController
    before_action :require_login

  def index
    if params[:party_id]
        @comments = Party.find(params[:party_id]).comments
      else
        @comments = Comment.all
      end
  end

  def create
    @comment = Comment.new(comment_params)
    current_user.comments << @comment
    @comment.save
    @party = Party.find(params[:comment][:party_id])
    redirect_to party_path(@party)
  end

  def edit
    @comment = Comment.find(params[:id])
    redirect_back(fallback_location: root_path) unless current_user == @comment.user
    # return head(:forbidden) unless current_user == @comment.user
    #deciding on which is better.
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to party_path(@comment.party)
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    party = comment.party
    comment.destroy
    redirect_to party_path(party)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :party_id)
  end

end

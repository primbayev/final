class CommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params)

    @comment.user_id = current_user.id

    @comment.save

    redirect_to @place
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to @comment.place
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :food_quality, :service_quality, :interior)
  end
end

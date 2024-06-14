class CommentsController < ApplicationController
    def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment, status: :created
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end
  
    def show
      comment = Comment.find(params[:id])
      render json: comment
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      head :no_content
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
  end
  
class CommentsController < ApplicationController
    def index
        if params[:artwork_id]
          comments = Comment.where(artwork_id: params[:artwork_id])
          render json: comments 
        elsif params[:author_id]
          comments = Comment.where(author_id: params[:author_id])
          render json: comments
        else
          render json: Comment.all
      end
    end

   
    def create
        comment = Comment.new(comment_params)
        if comment.save
          render json: comment
        else
          render json: comment.errors.full_messages, status: :unprocessable_entity
        end
      end

    def destroy 
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to comment_url
    end 

    private 
    def comment_params
        params.require(:comment).permit(:author_id,:artwork_id,:body)
    end 

end


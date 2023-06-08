class CommentsController < ApplicationController





    
    def index


        render json: Comment.all
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


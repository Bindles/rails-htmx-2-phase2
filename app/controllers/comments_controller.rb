class CommentsController < ApplicationController
  before_action :set_post

  def create
    # rails 8 and up only:
    # @post.comments.create! params.expect(comment: [ :content ])
    @post.comments.create! params.require(:comment).permit(:content)
  end
  
  private
    def set_post
      @post = Post.find(params[:post_id])
    end
      
end

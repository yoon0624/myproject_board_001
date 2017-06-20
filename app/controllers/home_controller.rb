class HomeController < ApplicationController
   before_action :require_login, except: [:index] #only: [:index, :write] 
  
  def index
    #if user_signed_in?
      @posts = Post.all
    #else
    # redirect_to '/users/sign_in'
    #end
  end
  
  def reply_write
    reply = Reply.new
    reply.problem = params[:problem]
    reply.answer = params[:answer]
    reply.post_id = params[:post_id]
    if reply.save
      redirect_to "/home/index"
    else
      render js: "alert('comments is empty');"
    end
  end
  
  def write
    post = Post.new
    post.categoryname = params[:categoryname]
    post.user= current_user
    uploader = AvatarUploader.new
    uploader.store!(params[:pic])
    post.image_url= uploader.url
    
    if post.save
      redirect_to "/home/index"
    else
      render js: "alert('categoryname is empty');"
    end
  end
  
  def delete
    @one_reply = Reply.find(params[:id])
    @one_reply.delete
    redirect_to "/home/index"
  end
  
  def update_view
    @one_reply = Reply.find(params[:id])
  end
  
  def updatecategory_view
    @one_post = Post.find(params[:id])
  end
  
  def update
    @one_reply = Reply.find(params[:id])
    @one_reply.problem = params[:problem]
    @one_reply.answer = params[:answer]
    @one_reply.save
    
    redirect_to "/home/index"
  end
  
  def updatecategory
    @one_post = Post.find(params[:id])
    @one_post.categoryname = params[:categoryname]
    @one_post.save
    
    redirect_to "/home/index"
  end
  
  def deletecategory
    @one_post = Post.find(params[:id])
    @one_post.delete
    redirect_to "/home/index"
  end
end
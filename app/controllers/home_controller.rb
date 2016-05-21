require 'json'

class HomeController < ApplicationController
  
  MainPageCount = 10
  
  def login
    # 로그인 전 메인 페이지
  end
  
  def main
    # 로그인 후 메인 페이지
    if user_signed_in?
      @posts = Post.all.reverse.take(MainPageCount)
    else
      redirect_to '/users/sign_in'
    end
  end
  
  def mypost
    @posts = Post.all
    @postsarr =[]
    @posts.each do |post|
      if post.email == current_user.email
        @postsarr.push(post)
      end
    end
    
  end
  
  def post_write
    @posts = Post.new(email: current_user.email,
                      content: params[:content],
                      tags: params[:tags])
                      # image_url: image_url)
    # image_url = ''
    file = params[:pic]
    uploader = ImageUploader.new
    uploader.store!(file)
    uploader.url
    @posts.image_url = uploader.url
    @posts.save
    redirect_to '/main'
  
  end
  
=begin
  def post_like
    
  end
=end

  def post_destory
    @post = Post.find(params[:post_id])
    
    if @post.email == current_user.email
      @post.destroy
    end    
    redirect_to '/main'
    
  end

  def post_edit
    
    @post = Post.find(params[:post_id])
    if @post.email == current_user.email
      
    @post.content = params[:content]
    @post.tags = params[:tags]
    @post.image_url = params[:image_url]
    @post.save
    
    redirect_to '/main'
  else 
    redirect_to :back
  end
  end
  
  def post_edit_view
    @post = Post.find(params[:post_id])
    
    if @post.email != current_user.email
      redirect_to '/main'
    end
  end
  
  def comment_write
    @comment = Comment.new(email: current_user.email, content: params[:content], post_id: params[:post_id])
    @comment.save
    redirect_to '/main'
  end
  
  def comment_destroy
    @comment = Comment.find(params[:comment_id])
    
    if @comment.email != current_user.email
      redirect_to '/main'
    else
      @comment.destroy
    end
  end
  
  def comment_edit
    @comments = Comment.find(params[:comment_id])
    
    if @comment.email != current_user.email
      redirect_to '/main'
    else
      @comments.content = params[:content]
      # @comments.image_url = params[:image_url]
      @comments.save
      redirect_to '/main'
    end
  end
  
  def post_search
    
    @words = params[:words]
    
    if @words.nil?
      redirect_to :back
    end
    
    @posts = Post.all
    @postsarr = []
    @wordsplit = @words.split
    
    @posts.each do |p|
      @wordsplit.each do |w|
        if p.content.include?(w)
          @postsarr.push(p)
          break
        end
      end
    end
    
  end
end

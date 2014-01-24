class PostsController < ApplicationController
  http_basic_authenticate_with name: "Sidebottom1", password: "secret", except: [:index, :show]
  
  def index
    @posts = Post.all
  end
  
  def new            #tutorial didn't explicitly say to add "@post = Post.new" as far as I can tell,
    @post = Post.new  #but I saw it in a later text window of the code that they had for this file later,
  end                  #after adding "def new", so I added it myself
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end  #not in the tutorial thingy, added myself
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to post_path
  end
    
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
    
  def update
    @post = Post.find(params[:id])
    
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end
    
  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end

class UsersController < ApplicationController
  
  def new
    @maker = Maker.new
  end
  
  def index
    @maker = Maker.all
  end
  
  def create
    @maker = Maker.new(maker_params)
    
    if @maker.save
      redirect_to @maker
    else
      render 'new'
    end
  end
  
  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy

    redirect_to maker_path
  end
    
  def show
    @maker = Maker.find(params[:id])
  end
  
  def edit
    @maker = Maker.find(params[:id])
  end
    
  def update
    @maker = Maker.find(params[:id])
    
    if @maker.update(params[:maker].permit(:name, :nickname, :email, :imageURL))
      redirect_to @maker
    else
      render 'edit'
    end
  end
    
  private
    def maker_params
      params.require(:maker).permit(:name, :nickname, :email, :imageURL)
    end
  
end

class KittensController < ApplicationController
  
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = "Congratulations adding a new super cute Kitten"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @kitten  }
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:notice] = "Congratulations editing a cute Kitten"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "To bad you destroy super cute Kitten"
    redirect_to root_url
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end

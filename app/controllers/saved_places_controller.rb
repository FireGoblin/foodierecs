class SavedPlacesController < ApplicationController
  before_filter :admin_user,  :only => [:index, :edit, :update, :destroy]
  
  def new
  end

  def create
    @savedplace = SavedPlaces.new(params[:save_place])
    
    #remove it if it is already there
    if( !SavedPlaces.where( :user_id => @savedplace.user_id, :restaurant_id => @savedplace.restaurant_id ).exists? )
      if @savedplace.save
        render :text => "OK"
      else
        render :text => "FAIL"
      end
    else
      SavedPlaces.destroy_all( :user_id => @savedplace.user_id, :restaurant_id => @savedplace.restaurant_id )
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

end

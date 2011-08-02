class OpinionsController < ApplicationController
  # GET /opinions
  # GET /opinions.xml
  def index
    @opinions = Opinion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opinions }
    end
  end

  # GET /opinions/1
  # GET /opinions/1.xml
  def show
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/new
  # GET /opinions/new.xml
  def new
    @opinion = Opinion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  # GET /opinions/1/edit
  def edit
    @opinion = Opinion.find(params[:id])
  end

  # POST /opinions
  # POST /opinions.xml
  def create
    @opinion = Opinion.new(params[:opinion])

    if @opinion.save
      #we need to update the restaurant table
      @rest = Restaurant.where( :id => @opinion.restaurant_id )
      puts "\n\n\nrestaurant id is #{restaurant.id}\n\n\n"
      if current_user.foodie
        if @opinion.like == 1
          @rest.foodie_likes += 1
        else
          @rest.foodie_dislikes += 1
        end
      else
        if @opinion.like == 1
          @rest.nonfoodie_likes += 1
        else
          @rest.nonfoodie_dislikes += 1
        end
      end
      @rest.save   

      render :text => "OK"
    else
      render :text => "FAIL"
    end
    #respond_to do |format|
    #  if @opinion.save
    #    render :text => "OK"
    #  else
    #    render :text => "FAIL"
    #  end
    #end
  end

  # PUT /opinions/1
  # PUT /opinions/1.xml
  def update
    @opinion = Opinion.find(params[:id])

    respond_to do |format|
      if @opinion.update_attributes(params[:opinion])
        format.html { redirect_to(@opinion, :notice => 'Opinion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opinion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.xml
  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy

    respond_to do |format|
      format.html { redirect_to(opinions_url) }
      format.xml  { head :ok }
    end
  end
end

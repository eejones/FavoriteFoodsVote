class FooditemsController < ApplicationController
  # GET /fooditems
  # GET /fooditems.json
  def index
    #@fooditems = Fooditem.all
    @fooditems = Fooditem.find(:all, :limit => 50, :order => [" score DESC"])
#    respond_to do |format|
 #     format.html # index.html.erb
  #    format.json { render :json => @fooditems }
   # end
  end

  # GET /fooditems/1
  # GET /fooditems/1.json
  def show
    @fooditem = Fooditem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fooditem }
    end
  end

  # GET /fooditems/new
  # GET /fooditems/new.json
  def new
    @fooditem = Fooditem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fooditem }
    end
  end

  # GET /fooditems/1/edit
  def edit
    @fooditem = Fooditem.find(params[:id])
    @fooditem.score += params[:score].to_i
    @fooditem.totalvotes += 1.to_i
    @fooditem.save
    render fooditems_path
  end

  # POST /fooditems
  # POST /fooditems.json
  def create
    @fooditem = Fooditem.new(params[:fooditem])

    respond_to do |format|
      if @fooditem.save
        format.html { redirect_to @fooditem, :notice => 'Fooditem was successfully created.' }
        format.json { render :json => @fooditem, :status => :created, :location => @fooditem }
      else
        format.html { render :action => "new" }
        format.json { render :json => @fooditem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fooditems/1
  # PUT /fooditems/1.json
  def update
    @fooditem = Fooditem.find(params[:id])

    respond_to do |format|
      if @fooditem.update_attributes(params[:fooditem])
        format.html { redirect_to @fooditem, :notice => 'Fooditem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fooditem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fooditems/1
  # DELETE /fooditems/1.json
  def destroy
    @fooditem = Fooditem.find(params[:id])
    @fooditem.destroy

    respond_to do |format|
      format.html { redirect_to fooditems_url }
      format.json { head :no_content }
    end
  end

  def voteup
    @fooditem = Fooditem.find(params[:id])
    fooditem.score=fooditem.score + 1
    fooditem.score += 1
    fooditem.votes += 1
    render :text => fooditem.score
  end

  def vote_down
    @fooditem = Fooditem.find(params[:id])
    fooditem = Fooditem.find(params[:id])
    fooditem = Fooditem.find(params[:id])
    render :text => "You have already voted up for this fooditem."
    voter = Voter.new
    voter.fooditem_id = params[:id]
    voter.user_id = session[:user_id]
    voter.value = true
    voter.save
    fooditem.score -= 1.to_i
    fooditem.votes += 1.to_i
    fooditem.save
    render :text => fooditem.score
  end


end

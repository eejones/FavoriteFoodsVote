class VotersController < ApplicationController
  # GET /voters
  # GET /voters.json
  def index
    @voters = Voter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @voters }
    end
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
    @voter = Voter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @voter }
    end
  end

  # GET /voters/new
  # GET /voters/new.json
  def new
    @voter = Voter.new
    render :text => "You have already voted up for this fooditem."
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @voter }
    end
  end

  # GET /voters/1/edit
  def edit
    @voter = Voter.find(params[:id])
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(params[:voter])

    respond_to do |format|
      if @voter.save
        format.html { redirect_to @voter, :notice => 'Voter was successfully created.' }
        format.json { render :json => @voter, :status => :created, :location => @voter }
      else
        format.html { render :action => "new" }
        format.json { render :json => @voter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /voters/1
  # PUT /voters/1.json
  def update
    @voter = Voter.find(params[:id])

    respond_to do |format|
      if @voter.update_attributes(params[:voter])
        format.html { redirect_to @voter, :notice => 'Voter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @voter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def voteup
    @fooditem = Fooditem.find(params[:id])
    fooditem = Fooditem.find(params[:id])
    check = Voter.find(:first, :conditions => ["user_id = ? AND item_id = ?", session[:user_id], params[:id]])
      if check.nil?
        voter = Voter.new
        voter.id = params[:id]
        voter.user_id = session[:user_id]
        voter.value = true
        voter.save
        fooditem.score = 1
        fooditem.save
        render :text => fooditem.score
        redirect_to fooditems_path
      elsif check.value == false
        check.value = true
        check.save
        fooditem.score = 2
        fooditem.save
        render :text => fooditem.score
        redirect_to fooditems_path
      else
        render :text => "You have already voted up for this item."
        redirect_to fooditems_path
    end
  end

  def vote_down
    @fooditem = Fooditem.find(params[:id])
    fooditem = Fooditem.find(params[:id])
    @fooditem.voter = Voter.new(params[:voter])
    render :text => "You have already voted up for this fooditem."
    if check.nil?
      voter.fooditem_id = params[:id]
      voter.user_id = session[:user_id]
      voter.value = true
      voter.save
      fooditem.score -= 1
      fooditem.votes += 1
      render :text => fooditem.score
    elsif check.value == true
      check.value = false
      check.save
      fooditem.score -= 2
      fooditem.votes += 2
      fooditem.save
      render :text => fooditem.score
    else
      render :text => "You have already voted down for this fooditem."
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    @voter = Voter.find(params[:id])
    @voter.destroy

    respond_to do |format|
      format.html { redirect_to voters_url }
      format.json { head :no_content }
    end
  end
end

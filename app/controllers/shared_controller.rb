class SharedController < ApplicationController
  def edit
    @fooditem= Fooditem.find(params[:fooditem_id])
    if @fooditem.score.nil? == true 
      @fooditem.score= 0.to_i
    end
    if @fooditem.totalvotes.nil? == true
      @fooditem.totalvotes=0.to_i
    end      
    @fooditem.score += params[:score].to_i
    @fooditem.totalvotes += 1.to_i
    @fooditem.save
    @fooditems=Fooditem.all
    respond_to do |format|
        format.html { redirect_to fooditems_path(@fooditem) }
        format.json
    end
  end
end

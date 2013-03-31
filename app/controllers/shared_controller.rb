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
    render home
  end
end

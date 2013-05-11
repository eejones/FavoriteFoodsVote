Ranking Favorite Foods
=========

This program allows users to vote on foods that they like and dislike. The actually voting mechanism is written into the code, it doesn't use any gems for voting. Foods are ranked in order of how much people like them. Users can add different types of food to vote on as well. If any of the voting gets out of hand, the food item can later be removed.

User Interface
------------

Users can vote for their favorite food directly from the rankings screen, which will list food items by the percentage of up votes out of the total votes:
![RankingFood rankfoodfoodindex](/app/assets/images/rankfoodfoodindex.png)

Users can also add their favorite food to the rankings if it is not already there:
![RankingFood foodranknewitem](/app/assets/images/foodranknewitem.png)

Additional Details
------------
Voting is controlled in the edit action:

```ruby
def edit
  @fooditem = Fooditem.find(params[:id])
  @fooditem.score += params[:score].to_i
  @fooditem.totalvotes += 1.to_i
  @fooditem.save
  respond_to do |format|
    if @fooditem.save(params[:score])
      format.html { redirect_to @fooditem, :notice => 'Your vote went through successfully.' }
      format.json { head :no_content }
    else
      format.html { render :action => "edit" }
      format.json { render :json => @fooditem.errors, :status => :unprocessable_entity }
    end
  end
end
```

(function(){
  
  var View = Hanoi.View = function(game, $el){
    this.game = game;
    this.$el = $el;
    this.bindEvents();
    this.render();
    this.firstTower = null;
    this.secondTower = null;
  };
  
  View.prototype.bindEvents = function () {
    this.$el.on("click", ".tower", this.clickTower.bind(this));
  };
  
  View.prototype.render = function(){
    var towersString = "";
    for(var i = 0; i < 3 ; i++){

      towersString += "<div class='tower' data-number="+ i +" >";
      for(var d = 0; d < this.game.towers[i].length ; d++){
        var discSize = this.game.towers[i][d];
        towersString += "<div class='disc' data-size="+ discSize +"></div>"
      }
      towersString += "</div>";
    } 
    
    return this.$el.html(towersString)
  }
  
  View.prototype.clickTower = function(event) {
    var $currentTower = $(event.currentTarget);
    if (this.firstTower !== null) {
      this.secondTower = parseInt($currentTower.data("number"));
     
      this.makeMove();
    } else {
      this.firstTower = parseInt($currentTower.data("number"));
      
    }
     
    $currentTower.toggleClass('highlight');
  }
  
  View.prototype.makeMove = function() {
    var move = this.game.move(this.firstTower, this.secondTower);
    if(!move){
      alert("invalid move");
    }
    this.firstTower = null;
    this.secondTower = null;
    this.render();
    if(this.game.isWon()){
      alert("congrats, you have won")
      this.$el.off("click");
    }
  }  
  
  
})();
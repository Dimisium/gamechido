morrita = require("../../recursos/niña.png")
morritajson = require("../../recursos/niña.json")

class Morrita extends PIXI.Graphics

    constructor: (app) ->
        super()
        @app = app
        @build()
        
  
    
    build: () =>
     @girl = []
     for  i in [1...5] by 1
         @girl.push(PIXI.Texture.fromFrame("niña_#{i}.png"))
     
     
     @movie = new PIXI.extras.AnimatedSprite(@girl)
     @movie.position.set(530)
     @movie.x= 600
     @movie.scale.x = 1.5
     @movie.scale.y = 1.5
     @movie.anchor.set(0.5)
     @movie.animationSpeed = 0.01 
     @movie.scale.x = -0.5
     @movie.scale.y = 0.5
     @movie.play()
     @app.stage.addChild(@movie)
        
       
        
        

module.exports = Morrita
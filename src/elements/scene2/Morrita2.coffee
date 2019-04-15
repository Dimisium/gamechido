morrita2 = require("../../recursos/niña.png")
morritajson = require("../../recursos/niña.json")

class Morrita2 extends PIXI.Graphics

    constructor: (container) ->
        super()
        @container= container
        @radio= @container.radio
        @radio.on 'berrinche', =>
            @girl.splice(0,23)
            for  i in [15,15] by 1
             @girl.push(PIXI.Texture.fromFrame("niña_#{i}.png")) 

        @build()
        
  
    
    build: () =>
     @girl = []
     for  i in [1...5] by 1
         @girl.push(PIXI.Texture.fromFrame("niña_#{i}.png"))
     
     
     @movie = new PIXI.extras.AnimatedSprite(@girl)
     @movie.position.set(530)
     @movie.x= 750
     @movie.y = -305
     @movie.scale.x = 1.5
     @movie.scale.y = 1.5
     @movie.anchor.set(0.5)
     @movie.animationSpeed = 0.01 
     @movie.scale.x = -0.5
     @movie.scale.y = 0.5
     @movie.play()
     @container.addChild(@movie)
        
       
        
        

module.exports = Morrita2
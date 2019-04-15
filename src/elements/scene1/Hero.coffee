
herojson = require("../../recursos/jejee.json")
herojson = require("../../recursos/jejee.png")


class Hero extends PIXI.Graphics
    move = true
    constructor: (app) ->
        super()
        @app = app
        @build()
        window.addEventListener 'keypress', @onKeyPress
        window.addEventListener 'keyup', @onKeyUp
        
        right: false
        @move = true
        @radio = @app.radio
        @radio.on "to:sad", @sad
        null
        
        
    
        
    onKeyPress: (evt) =>
      if(@move)
         if evt.key is 'd' || evt.key is 'D'
             @zero.splice(0,23)
             for  i in [13..18] by 1
                 @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
             @right = true
             null
        null
           
        
            
          
       
    sad:()=>
     @zero.splice(0,53)
     for  i in [31..33] by 1
         @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
     null

    dialogo:()=>
        @movie.x= 449
        @zero.splice(0,23)
        for  i in [1..6] by 1
              @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
        @radio.emit('dialogo:on')
       
        null

    onKeyUp: (evt) =>
      if evt.key is 'd'|| evt.key is 'D'
         @zero.splice(0,23)
         for  i in [1..6] by 1
             @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
         @right = false
         null
         
    
    build: () =>
     @zero = []
     for  i in [1...6] by 1
         @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
     
     @movie = new PIXI.extras.AnimatedSprite(@zero)
     @movie.position.set(530)
     @movie.x=50
     @movie.scale.x = 1.5
     @movie.scale.y = 1.5
     @movie.anchor.set(0.5)
     @movie.animationSpeed = 0.1  
     @movie.play()
     @app.addAnimationNodes(@)
     @app.stage.addChild(@movie)
     null

    animate:()=>
       
      if (@movie.x >= 450 )
          @move = false
          @dialogo()
          null
          
        
      if @right is true && @move is true
          @movie.x += 2
          null
        
       
        
        

module.exports = Hero
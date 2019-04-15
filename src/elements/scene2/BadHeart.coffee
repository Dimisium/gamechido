Math = require "mathjs"
Roto= require '../../recursos/roto.png'
class BadHeart extends PIXI.Graphics
    
    active: false
    constructor: (container) ->
        super()
        @container = container
        @radio= @container.radio
        @y = -400
        
        @x = Math.randomInt(0,800)
        
        @draw()
        @active = false

    draw: =>
        
            @container.addChild(@)
            @container.app.addAnimationNodes(@)
            #@beginFill(0x960007)
            #@drawRect(0, 0, 40,40)
            #@endFill()

            roto = PIXI.Sprite.fromImage(Roto)
            roto.width = 40
            roto.height= 40
            
            
            @.addChild(roto)
            
        

    animate: =>
     @y += 3
     @heroPosition()
     
     
     @colisions()


    colisions:=>
        
        if @y >= 600
            @container.garbageCollector(@)
        if (@heroX < @x + 35 && @heroX + @heroWidth > @x && @heroY < @y + 35 && @heroHeight + @heroY > @y)
           if @active is false
             @radio.emit 'dead'
             @active=true
            
    heroPosition:=>
        @heroX= @container.app.hero2.movie.x-@container.app.hero2.movie.width/2
        @heroY= @container.app.hero2.movie.y-@container.app.hero2.movie.height/2
        @heroWidth = @container.app.hero2.movie.width
        @heroHeight = @container.app.hero2.movie.height

module.exports = BadHeart
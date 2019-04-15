class Trigger1 extends PIXI.Graphics

    active:false
    
    constructor: (container) ->
        super()
        @radio = container.radio
        @container = container
        @active = false
        @build()
        

  

    build: =>    
        
        
        @x = 520
        @y = 140
        @container.addChild(@)
        @container.app.addAnimationNodes(@)
        

    animate :=>
        @heroPosition()
        @colisions()

    colisions:=>
        
        if (@heroX < @x + 100 && @heroX + @heroWidth > @x && @heroY < @y + 30 && @heroHeight + @heroY > @y)
           if @active is false
             @radio.emit 'derrame'
             @active=true
            
    heroPosition:=>
        @heroX= @container.app.hero2.movie.x-@container.app.hero2.movie.width/2
        @heroY= @container.app.hero2.movie.y-@container.app.hero2.movie.height/2
        @heroWidth = @container.app.hero2.movie.width
        @heroHeight = @container.app.hero2.movie.height
       
         

module.exports = Trigger1
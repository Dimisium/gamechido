class Trigger1 extends PIXI.Graphics

    active:false
    
    constructor: (container) ->
        super()
        @radio = container.radio
        @container = container
        @container.addChild(@)
        @active = false
        @container.app.addAnimationNodes(@)
        @build()
        

  

    build: =>    
        
    
        @x = 680
        @y =-340
        @container.addChild(@)
        

    animate :=>
        @heroPosition()
        @colisions()

    colisions:=>
        if (@heroX < @x + 100 && @heroX + @heroWidth > @x && @heroY < @y + 100 && @heroHeight + @heroY > @y)
           if @active is false
             @radio.emit 'dialogo2'
             @active=true
            
    heroPosition:=>
        @heroX= @container.app.hero2.movie.x-@container.app.hero2.movie.width/2
        @heroY= @container.app.hero2.movie.y-@container.app.hero2.movie.height/2
        @heroWidth = @container.app.hero2.movie.width
        @heroHeight = @container.app.hero2.movie.height
       
         

module.exports = Trigger1
class DeadFloor extends PIXI.Graphics

    active:false
    derramando:false
    constructor: (container) ->
        super()
        
        @container = container  
        @container.addChild(@)
        @active = false
        @derramando= false
        @container.app.addAnimationNodes(@)
        @radio = @container.app.radio
        @radio.on 'derrame', =>
            @derramando= true
            null
        
        
        @build()
        
        

  
    
        
          
    build: =>    
        
        
        @x = 0
        @y = 280
        @container.addChild(@)
        null
        

    animate :=>
        @heroPosition()
        @colisions()

    colisions:=>
        if @derramando is true
         if (@heroX < @x + 800 && @heroX + @heroWidth > @x && @heroY < @y + 30 && @heroHeight + @heroY > @y)
           if @active is false
             @container.app.hero2.muriendo=30
             @active=true
            
    heroPosition:=>
        @heroX= @container.app.hero2.movie.x-@container.app.hero2.movie.width/2
        @heroY= @container.app.hero2.movie.y-@container.app.hero2.movie.height/2
        @heroWidth = @container.app.hero2.movie.width
        @heroHeight = @container.app.hero2.movie.height
       
         

module.exports = DeadFloor
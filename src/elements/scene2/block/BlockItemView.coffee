class BlockItemView extends PIXI.Graphics

    

    constructor: (model, container) ->
        super()
        @radio = container.radio
        
        @model = model
        @container = container
        @container.app.addAnimationNodes(@)
        
        @build()
        

  

    build: =>
        #@beginFill(0xFFFF00)
        #@drawRect(0, 0, @model.width, @model.height)
        #@endFill()
        @x = @model.x
        @y = @model.y
        @container.addChild(@)
        #@buildSizes()

    buildSizes:()=>
        #left
        #@beginFill(0xFF0000)
        #@drawRect(-5.1, 0, 5.1, @model.height)
        #@endFill()
        #top
        #@beginFill(0xFF0000)
        #@drawRect(0, -6, @model.width, 6)
        #@endFill()
        #right
        #@beginFill(0xFF0000)
        #@drawRect(@model.width, 0, 5, @model.height)
        #@endFill()
        #down
        #@beginFill(0xFF0000)
        #@drawRect(0, @model.height, @model.width, 3)
        #@endFill()
        
        


    animate: =>
       @heroPosition()
       
       
       @colisions()  

    colisions:=>
        #if (@heroX < @x + @model.width && @heroX + @heroWidth > @x && @heroY < @y + @model.height && @heroHeight + @heroY > @y)
         
            
            
        

        #left 
        if (@heroX < @x-5.1 + 5.1 && @heroX + @heroWidth > @x-5.1 && @heroY < @y + @model.height && @heroHeight + @heroY > @y)
            @radio.emit 'left:wall', 2
          
        #top
        if (@heroX < @x + @model.width && @heroX + @heroWidth > @x && @heroY < @y-7.1 + 7.1 && @heroHeight + @heroY > @y-7.1)
          
          @radio.emit 'pongan:piso', 2
        
         
        #right
        if (@heroX <@x+ @model.width + 5.1 && @heroX + @heroWidth > @x+@model.width && @heroY < @y + @model.height && @heroHeight + @heroY > @y)
          @radio.emit 'right:wall', 2
            
        #bot 
        if (@heroX < @x + @model.width && @heroX + @heroWidth > @x && @heroY < @y+@model.height + 3 && @heroHeight + @heroY > @y+@model.height)
             
            @container.app.hero2.jumping = 0
        
        

       
    heroPosition:=>
       @heroX= @container.app.hero2.movie.x-@container.app.hero2.movie.width/2
       @heroY= @container.app.hero2.movie.y-@container.app.hero2.movie.height/2
       @heroWidth = @container.app.hero2.movie.width
       @heroHeight = @container.app.hero2.movie.height
       
         

module.exports = BlockItemView
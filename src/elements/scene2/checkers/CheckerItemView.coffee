Corazon = require '../../../recursos/kokoro.png'
class CheckerItemView extends PIXI.Graphics

    active:true
    constructor: (checker, container) ->
        super()
        @radio = container.radio
        
        @checker = checker
        @container = container
        @container.app.addAnimationNodes(@)
        @active = true
        @build()
        

  

    build: =>
        
        #@beginFill(0x00FF00)
        #@drawRect(0, 0, @checker.width, @checker.height)
        #@endFill()
        @x = @checker.x
        @y = @checker.y
        @container.addChild(@)

        corazon = PIXI.Sprite.fromImage(Corazon)
        corazon.width = 40
        corazon.height= 40
        @.addChild(corazon)
        

    animate :=>
        @heroPosition()
        @colisions()

    colisions:=>
        if (@heroX < @x + @checker.width && @heroX + @heroWidth > @x && @heroY < @y + @checker.height && @heroHeight + @heroY > @y)
            if @active is true
                @alpha = 0
                @container.app.hero2.score +=1
                
                @active = false
            
    heroPosition:=>
        @heroX= @container.app.hero2.movie.x-@container.app.hero2.movie.width/2
        @heroY= @container.app.hero2.movie.y-@container.app.hero2.movie.height/2
        @heroWidth = @container.app.hero2.movie.width
        @heroHeight = @container.app.hero2.movie.height
       
         

module.exports = CheckerItemView
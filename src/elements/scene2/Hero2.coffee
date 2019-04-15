
herojson = require("../../recursos/jejee.json")
herojson = require("../../recursos/jejee.png")


class Hero2 extends PIXI.Graphics
    transition : false
    floor: false
    death: false
    alfin:false
    wining:false
    jumping: 0
    score: 0
    muriendo: 0
    constructor: (app) ->
        super()
        @app = app
        @radio= @app.radio
        @build()
        window.addEventListener 'keypress', @onKeyPress
        window.addEventListener 'keyup', @onKeyUp
        @radio.on 'dead', @dead
        @radio.on 'dialogo2', =>
            @wining = true
        @radio.on 'win', @win
        @radio.on 'pongan:piso', @pisandoCollider
        @radio.on 'left:wall', @leftW
        @radio.on 'right:wall', @rightW
        @score = 0
        @muriendo = 0
        @jumping = 0
        right: false
        @alfin= false
        @death = false
        left: true
        @wining= false
        transition: false
        floor: false

    dead: ( ) =>
        if @wining == false
            @death = true 
            @makeAnimation(31,33)
            @muriendo = 100
        
    win: ( ) =>
        @alfin= true 
         
    pisandoCollider: (modelo) =>
        
        if modelo == 2
         
         @floor = true      
        else 
         
         @floor = false

    leftW: (modelo) =>
        
        if modelo == 2
         
         @leftTop= true
        else 
         
         @leftTop = false
    rightW: (modelo) =>
        
        if modelo == 2
         
         @rightTop= true
        else 
         
         @rightTop = false
     
    
        
        


    onKeyPress: (evt) =>
      if @death is false && @alfin is false
         if evt.key is 'd' || evt.key is 'D'
             @movie.scale.x = 1.5
             @makeAnimation(19,24)
            
             @right = true
            

         if evt.key is 'w' || evt.key is 'W'  
             @up = true

         if evt.key is 'a' || evt.key is 'A'
             @movie.scale.x = -1.5
             @makeAnimation(19,24)
             @left = true
             
       
         
    makeAnimation:(de,desde)=>
     @zero.splice(0,23)
     for  i in [de..desde] by 1
         @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
     

    onKeyUp: (evt) =>
        if @death is false

            if evt.key is 'w' || evt.key is 'W'
                    @upDown = true  
            if evt.key is 'd'|| evt.key is 'D'     
                @movie.scale.x = 1.5
                @makeAnimation(1,6)
                @right = false

                if @transition && @left
                    @movie.scale.x = -1.5
                    @makeAnimation(1,6)
                    @transition= false
                    @right = false
                null

            if evt.key is 'a'|| evt.key is 'A'       
                @movie.scale.x = -1.5
                @makeAnimation(1,6)
                @left = false


                if @transition && @right
                    @movie.scale.x = 1.5
                    @makeAnimation(19,24)
                    @left = false
                    @transition = false


                null  

         
    
    build: () =>
     @zero = []
     for  i in [1...6] by 1
         @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))
     
     @movie = new PIXI.extras.AnimatedSprite(@zero)
     @movie.position.set(530)
     @movie.x= 50
     
     
     @movie.scale.x = 1.5
     @movie.scale.y = 1.5
     @movie.anchor.set(0.5)
     @movie.animationSpeed = 0.1  
     @movie.play()
     @app.addAnimationNodes(@)
     @app.block.addChild(@movie)
     

    animate:()=>
        @matenmePorqueMeMuero()
        
        @moving()
        @pisandoCollider()
        @leftW()
        @rightW()

      
        
      
          
    matenmePorqueMeMuero:()=>
        
      if @muriendo >= 1
           @muriendo -=1
      if @muriendo == 1     
         @radio.emit 'stage2'
         
    moving:()=>
      if @floor is false     
         @movie.y += 7
              
      if @death is false
        if @floor is false
            @up = false   
        if @up is true 
            @jumping=18
            
        @movie.y -=@jumping
        
        if @jumping >= 0.5
            
            @jumping-=0.5  
            
        if @floor is false 
            @zero.splice(0,23)
            for  i in [36,36] by 1
             @zero.push(PIXI.Texture.fromFrame("niñochido_#{i}.png"))    
        else   
            @makeAnimation(1,6)  
            if @upDown
                @makeAnimation(1,6)  
                
            if @upDown  && (@right || @left)
                @makeAnimation(19,24)
            @upDown= false        
                    
        if @right is true && @leftTop is false
            @movie.x += 5
            if @floor
             @makeAnimation(19,24)
            
        if @right is true 
            @transition = true
            
        
        if @left is true && @rightTop is false
            @movie.x -= 5
            if @floor
             @makeAnimation(19,24)
        
       
        
        

module.exports = Hero2
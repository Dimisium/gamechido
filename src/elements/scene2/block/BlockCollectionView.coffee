Collection = require './BlockCollection'
ItemView = require './BlockItemView'

CheckerCollection = require '../checkers/CheckerCollection'
CheckerItemView = require '../checkers/CheckerItemView'

Trigger1 = require '../Trigger1'
Trigger2 = require '../Trigger2'

Morrita2= require '../Morrita2'

BadHeart= require '../BadHeart'
DeadFloor= require '../DeadFloor'
Background= require '../../../recursos/corazones.png'


Nube3= require '../../../recursos/nube3.png'

Nube5 = require '../../../recursos/nube5.png'
Vhs = require '../../../recursos/vhs.jpg'
Feliz = require '../../../recursos/feliz.jpg'
End= require '../../../recursos/final.png'


class BlockCollectionView extends PIXI.Graphics
    collection: Collection
    checkerCollection: CheckerCollection
    subida:false
    enamorada: false
    enemies: []
    interval= null
    constructor: (app) ->
        super()
        
        @app = app
        @subida = false
        @enamorada= false
        @app.stage.addChild(@)
        @app.addAnimationNodes(@)
        @radio = app.radio   
        @buildItemViews()
        @radio.on 'derrame',@derrame
        @radio.on 'win',@win
        @radio.on 'stage2',=>
            clearInterval(@interval)
        
        
        
        
    derrame:()=>
      @subida = true
      

    win:()=>
     
     clearInterval(@interval)
     
      

    garbageCollector: (item) =>
        enemyChild = @enemies.indexOf(item)
        enemyChildd = @children.indexOf(item)
        enemyChilddd = @app.animationNodes.indexOf(item)
        
        
        if (enemyChild > -1)
          @enemies.splice(enemyChild,1)
          @app.animationNodes.splice(enemyChilddd,1)
          @children.splice(enemyChildd,1)  

    buildItemViews: =>
        background = PIXI.Sprite.fromImage(Background)
        background.y= -990
        @.addChild(background)
        
        for model in @collection
            new ItemView(model, @)
         
        for checker in @checkerCollection
            new CheckerItemView(checker, @)
         
        trigger1= new Trigger1(@) 
        trigger2= new Trigger2(@) 
        morrita2= new Morrita2(@)
        deadFloor= new DeadFloor(@)
        @buildNubes()
        @buildHearts()

    buildNubes:=>
        Feliz2 = PIXI.Sprite.fromImage(Feliz)
        Feliz2.width = 90
        Feliz2.height= 80    
        Feliz2.y+= 494
        Feliz2.x+= 195
        @.addChild(Feliz2)

        nube1 = PIXI.Sprite.fromImage(Nube5)
        nube1.scale.y = -1
        nube1.scale.x = 1.27
        nube1.anchor.set(0.5)
        nube1.y+=108
        nube1.x+=140
        @.addChild(nube1)

        nube2 = PIXI.Sprite.fromImage(Nube5)
        nube2.scale.y = -2
        nube2.scale.x = 5
        nube2.anchor.set(0.5)
        nube2.y+=615
        nube2.x+=400
        @.addChild(nube2)

        nube3 = PIXI.Sprite.fromImage(Nube5)
        nube3.scale.y = -0.6
        nube3.scale.x = 0.45
        nube3.anchor.set(0.5)
        nube3.y+=190
        nube3.x+=570
        @.addChild(nube3)

        nube4 = PIXI.Sprite.fromImage(Nube5)
        nube4.scale.y = -0.7
        nube4.scale.x = 0.9
        nube4.anchor.set(0.5)
        nube4.y-=30
        nube4.x+=90
        @.addChild(nube4)

        nube5 = PIXI.Sprite.fromImage(Nube5)
        nube5.scale.y = -0.7
        nube5.scale.x = 0.9
        nube5.anchor.set(0.5)
        nube5.y-=160
        nube5.x+=0
        @.addChild(nube5)

        nube6 = PIXI.Sprite.fromImage(Nube5)
        nube6.scale.y = -0.5
        nube6.scale.x = -0.2
        nube6.anchor.set(0.5)
        nube6.y-=135
        nube6.x+=370
        @.addChild(nube6)

        nube7 = PIXI.Sprite.fromImage(Nube5)
        nube7.scale.y = -0.5
        nube7.scale.x = -0.2
        nube7.anchor.set(0.5)
        nube7.y-=184
        nube7.x+=530
        @.addChild(nube7)

        nube8 = PIXI.Sprite.fromImage(Nube5)
        nube8.scale.y = -0.7
        nube8.scale.x = -0.9
        nube8.anchor.set(0.5)
        nube8.y-=240
        nube8.x+=725
        @.addChild(nube8)

        Feliz1 = PIXI.Sprite.fromImage(Feliz)
        Feliz1.width = 60
        Feliz1.height= 60        
        Feliz1.y-=53
        Feliz1.x+=545
        @.addChild(Feliz1)

        Feliz3 = PIXI.Sprite.fromImage(Feliz)
        Feliz3.width = 70
        Feliz3.height= 70       
        Feliz3.y=284
        Feliz3.x+=725
        @.addChild(Feliz3)

        vhs1= PIXI.Sprite.fromImage(Vhs)
        vhs1.width = 200
        vhs1.height= 70     
        vhs1.y=294
        vhs1.x+=-5
        @.addChild(vhs1)

        vhs2= PIXI.Sprite.fromImage(Vhs)
        vhs2.width = 200
        vhs2.height= 80     
        vhs2.y=394
        vhs2.x+=395
        @.addChild(vhs2)

        end= PIXI.Sprite.fromImage(End)
        end.y=-680
        end.scale.x = 1.3
        end.anchor.set(0.5)
        end.x=400
        @.addChild(end)
        
        

    
    buildHearts: =>
        @interval = setInterval =>
            
            badHeart = new BadHeart(@)
            
            @enemies.push badHeart 
        , 600
        
    subiendo:()=>
     
     if (@y <= 370 && @subida is true)   
         @y+= 8
            
    animate:()=>
      
     if @enamorada == true
         if @y<= 987
             
             @y+=3

     @subiendo()

    


module.exports = BlockCollectionView
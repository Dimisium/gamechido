dialogo = require("../../recursos/dialogo.png")
class Dialogo extends PIXI.Graphics
    dialogos:0
    nextstage: false
    constructor: (app) ->
        super()
        @app = app
        @radio = app.radio
        window.addEventListener 'keypress', @onKeyPress
        nextstage:false
        @build()
        
       
        
        
    onKeyPress:(evt)=>
        
        if evt.key is 'E'|| evt.key is 'e'
         
          @dialogos += 1
          
          switch @dialogos
                  
             when 1
                  @skip.alpha = 0
                  @radio.emit('to:sad')
                  @texto.text= 'No tienes trabajo ni vida'
                  @app.stage.addChild(@texto)
             when 2
                  @texto.text = 'No pareces ser detallista'
             when 3
                  @texto.text = 'Sin mencionar que eres feo'
             when 4
                  @texto.text = 'Tal vez si trabajas en eso...'
             when 5
                  @cuadro = new PIXI.Graphics()
                  @cuadro.beginFill(0x000000)
                  @cuadro.drawRect(0, 0, 800, 600)
                  @cuadro.endFill()
                  @cuadro.alpha = 0
                  @app.stage.addChild(@cuadro)
                  @app.addAnimationNodes(@)

        
                
        
    

            
    animate:()=>    
      @cuadro.alpha+= 0.01
      if(@cuadro.alpha>=1 && @nextstage is false)
           @radio.emit('stage2')
           @nextstage= true

    build: () =>
        ventana = PIXI.Sprite.fromImage(dialogo)
        ventana.scale.x = -0.7
        ventana.scale.y = 0.3
        ventana.x= 350
        ventana.y = 320
        ventana.anchor.set(0.5)
        ventana.alpha *= 0.8
        @app.stage.addChild(ventana)


        @styleGirl = new PIXI.TextStyle({
         fontFamily: 'Arial',
         fontSize: 36,
         fontStyle: 'italic',
         
         fill: ['#CBD615', '#00ff99']
         stroke: '#4a1850',
         strokeThickness: 4,
        })

        @texto = new PIXI.Text('Lo siento, no eres mi tipo', @styleGirl) 
        @texto.x= 350
        @texto.y = 300
        @texto.anchor.set(0.5)
        @app.stage.addChild(@texto)

        @skip = new PIXI.Text('Presiona "E"')
        @skip.x= 500
        @skip.y = 250
        @skip.anchor.set(0.5)
        @app.stage.addChild(@skip)

        
        
        
        
      
    

       
        
    
module.exports = Dialogo
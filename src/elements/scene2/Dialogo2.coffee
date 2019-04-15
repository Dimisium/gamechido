Dialogo = require("../../recursos/viñetilla.png")
class Dialogo2 extends PIXI.Graphics

    constructor: (app,hero) ->
        super()
        @app = app
        @radio = app.radio
        @hero= hero
        @build()
        
       
        
    


    build: () =>
        @ventana = PIXI.Sprite.fromImage(Dialogo)
        @ventana.scale.x = 1.4
        @ventana.scale.y = 0.75
        @ventana.x= 400
        @ventana.y = 320
        @ventana.anchor.set(0.5)
        @ventana.alpha *= .9
        @app.stage.addChild(@ventana)

        @styleGirl = new PIXI.TextStyle({
         fontFamily: 'Arial',
         fontSize: 36,
         fontStyle: 'italic',
         
         fill: ['#CBD615', '#00ff99']
         stroke: '#4a1850',
         strokeThickness: 4,
        })
        @styleBoy = new PIXI.TextStyle({
         fontFamily: 'Arial',
         fontSize: 36,
         fontStyle: 'italic',
         
         fill: ['#5B372C', '#FF3B00']
         stroke: '#4a1850',
         strokeThickness: 4,
        })
        dialogoNum = 0
        switch @hero.score
             when 0
                 textoG = new PIXI.Text("", @styleGirl) 
                 textoG.x= 400
                 textoG.y = 450
                 textoG.anchor.set(0.5)
                 @app.stage.addChild(textoG)
                 textoB = new PIXI.Text("", @styleBoy) 
                 textoB.x= 400
                 textoB.y = 450
                 textoB.anchor.set(0.5)
                 @app.stage.addChild(textoB)
                 dialogos= setInterval =>
                      @radio.emit 'win'
                      dialogoNum++  
                      if dialogoNum <= 2
                         textoB.text= 'Tengo el presentimiento...'
                         

                      if dialogoNum >=3  &&  dialogoNum <= 5
                         textoB.text='De que no importa lo que haga'
                         
                      if dialogoNum >=6  &&  dialogoNum <= 9
                         textoB.text='Asi que ya no me importa'
                         
                      if dialogoNum == 9
                         @radio.emit 'berrinche'
                      if dialogoNum >=10  &&  dialogoNum <= 12
                         textoB.text=''
                         textoG.text = '¡Espera!'
                         
                      if dialogoNum >=13  &&  dialogoNum <= 15
                         textoG.text = 'Podemos salir a algun lado'
                         
                      if dialogoNum == 17
                         @app.block.enamorada= true
                         clearInterval(dialogos)
                         textoG.text = ''
                         @ventana.alpha = 0

                     

                      
                     
                 , 1000
                 
                  
             when 1
                 @text('!Es que no me agradas¡')
                 @radio.emit 'dead'
             when 2
                 @text('Eres muy conformista para mi')
                 @radio.emit 'dead'
             when 3
                 @text('Que basico eres')
                 @radio.emit 'dead'
             when 4
                 @text('Sigues siendo feo')
                 @radio.emit 'dead'
             when 5
                 @text('Eres muy perfecto para mi')
                 @radio.emit 'dead'
                 

    text: (texting) =>
        texto = new PIXI.Text(texting, @styleGirl) 
        texto.x= 400
        texto.y = 450
        texto.anchor.set(0.5)
        @app.stage.addChild(texto)
        

        
         

       
        
    
module.exports = Dialogo2
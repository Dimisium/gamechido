
herojson = require("./recursos/jejee.json")
Background = require("./elements/scene1/Background")
Hero = require("./elements/scene1/Hero")
Dialogo = require("./elements/scene1/Dialogo")
Dialogo2 = require("./elements/scene2/Dialogo2")
Morrita = require("./elements/scene1/Morrita")
morritajson = require("./recursos/niña.json")
Radio = require 'nanoevents'
Hero2 = require("./elements/scene2/Hero2")
Hero2 = require("./elements/scene2/Hero2")
Blocks = require("./elements/scene2/block/BlockCollectionView")

Fragil = require("./recursos/fragil.mp3")
class App extends PIXI.Application
  animation:true
  animationNodes:[]
  radio: new Radio()
  
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    @radio.on "dialogo:on", @sendDialogo
    @radio.on 'dialogo2',@sendDialogo2
    @radio.on "stage2", @delateStage
    
    PIXI.loader.add(herojson).add(morritajson).add(Fragil).load(@stage1)
    
    
    

  stage1:=>
    @background = new Background(@)
    @morrita = new Morrita(@)
    @hero = new Hero(@)
    @animate()
    


  stage2:=>
    @block= new Blocks(@)
    @hero2= new Hero2(@)
    
    @block.y = .10
    
    
    
    
    
    
    
    
    
  delateStage:=>
    @ticker.update(1)
    for n in  @stage.children
     @stage.children.splice(n,1)
    for n in @animationNodes
     @animationNodes.splice(n,1)
    
    @stage2()
    
    
  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  sendDialogo:()=>
    
    @dialogo = new Dialogo(@)

  sendDialogo2:()=>
    @dialogo2 = new Dialogo2(@,@hero2)
    

  animate:=>
    
    @ticker.add ()=>
      
      
      
      for n in @animationNodes
        return unless n
        n.animate?()

    null

module.exports = App

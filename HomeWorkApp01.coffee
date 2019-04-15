Rectangule = require("./elements/Rectangule")
DataRectangule = require('./data/Rectangules')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    @build()
    @animate()

  build:=>
    Rectangule= new Rectangule(100,300,30,15,'0x757575')
    @stage.addChild Rectangule
    Rectangule2= new Rectangule(600,500,50,25,'0xCD5C5C')
    @stage.addChild Rectangule2


  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App

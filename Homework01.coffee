class Rectangule extends PIXI.Graphics

  constructor:(_x,_y,_width,_height,_color)->
    super()
    @myX = _x
    @myY = _y
    @myW = _width
    @myH = _height
    @myC = _color
    @build()

  build:()->
        @beginFill(@myC)
        @lineStyle(1,@myC)
        @drawRectangule(@myX,@myY,@myW,@H)


module.exports = Rectangule

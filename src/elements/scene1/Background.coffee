bground = require("../../recursos/1.jpg")
class Background extends PIXI.Graphics

    constructor: (app) ->
        super()
        @app = app
        @build()

    build: () =>
        background = PIXI.Sprite.fromImage(bground)
        background.scale.x *= 1.25
        background.scale.y*= 1.25
        background.x = -100
        @app.stage.addChild(background)
        
        

module.exports = Background
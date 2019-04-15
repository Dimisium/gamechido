constructor:(child)->
  super()
  @data = child
  @build()

build:()->
    @beginFill(@data.color)
    @lineStyle(1,@data.color)
    @drawCircle(@data.x,@data.y,@data.radius)
    @endFill()

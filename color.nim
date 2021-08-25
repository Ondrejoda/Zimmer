type Color* = ref object of RootObj
    ## This is the Zimmer's implementation of Color.
    r, g, b, a: uint8

proc newColor*(r:uint8, g:uint8, b:uint8, a:uint8): Color =
    ## Initiates a new Color object. It takes in the red, green, blue and alpha values.
    var color = new Color
    color.r = r
    color.g = g
    color.b = b
    color.a = a
    return color

proc newColor*(all:uint8, a:uint8): Color =
    ## Initiates a new Color object. It takes in red, green and blue as one value and alpha value seperately.
    var color = new Color
    color.r = all
    color.g = all
    color.b = all
    color.a = a
    return color

proc newColor*(all:uint8): Color =
    ## Initiates a new Color object. It takes in red, green and blue as one value. Alpha defaults to 255.
    var color = new Color
    color.r = all
    color.g = all
    color.b = all
    color.a = 255
    return color
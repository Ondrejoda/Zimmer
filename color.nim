type Color* = object of RootObj
    ## This is the Zimmer's implementation of Color.
    r, g, b, a: uint8

proc newColor*(r:SomeNumber, g:SomeNumber, b:SomeNumber, a:SomeNumber): Color =
    ## Initiates a new Color object. It takes in the red, green, blue and alpha values.
    result = Color(r: r.uint8, g: g.uint8, b: b.uint8, a: a.uint8)

proc newColor*(r:SomeNumber, g:SomeNumber, b:SomeNumber): Color =
    ## Initiates a new Color object. It takes in the red, green and blue values. Alpha defaults to 255.
    result = Color(r: r.uint8, g: g.uint8, b: b.uint8, a: 255)

proc newColor*(all:SomeNumber, a:SomeNumber): Color =
    ## Initiates a new Color object. It takes in red, green and blue as one value and alpha value seperately.
    result = Color(r: all.uint8, g: all.uint8, b: all.uint8, a: a.uint8)

proc newColor*(all:SomeNumber): Color =
    ## Initiates a new Color object. It takes in red, green and blue as one value. Alpha defaults to 255.
    result = Color(r: all.uint8, g: all.uint8, b: all.uint8, a: 255)
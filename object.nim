import math
include ./vec2
include ./color

type Object* = ref object of RootObj
    ## This is an Object. Every visible thing on the screen is (to an extent) an Object.
    ## Objects are rendered as rects. Use TexObject to render textures.
    ## They are kept in a seq[] in the scene, which then gets passed to the engine to render, apply physics and more. 
    pos, size, velocity: Vec2
    color: Color
    damping: float32
    z_index: int32
    fill: bool

proc newObject*(pos, size: Vec2, color: Color, z_index: int32, fill: bool): Object =
    ## Initiates a new Object object. 
    ## It takes in the object's position, size, color, z_index and fill arguments respectively.
    var self = new Object
    self.pos = pos
    self.size = size
    self.damping = 1.0
    self.velocity = newVec2(0, 0)
    self.color = color
    self.z_index = z_index
    self.fill = fill
    return self

proc apply_impulse*(self: Object, impulse:Vec2) =
    ## Applies impulse to the Object. Uses a Vec2 for the impulse. 
    self.velocity += impulse

proc apply_impulse*(self: Object, x:SomeNumber, y:SomeNumber) =
    ## Applies impulse to the Object. Uses the x and y values for the impulse. 
    self.velocity.x += x.float
    self.velocity.y += y.float

proc update_physics*(self: Object) =
    ## Updates position and velocity of the Object. Doesn't take in any arguments except the Object.
    self.pos += self.velocity
    self.velocity *= self.damping

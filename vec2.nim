import math

type Vec2* = ref object of RootObj
    ## This is Zimmer's implementation of Vector2.
    x, y: float32

proc newVec2*(x: SomeNumber, y: SomeNumber): Vec2 =
    ## Initiates a new Vec2 object. It takes in the vector's x and y coordinates.
    var self = new Vec2
    self.x = x.float
    self.y = y.float
    return self

proc `+`(self:Vec2, to_add:Vec2): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x + to_add.x
    newVec.y = self.y + to_add.y
    return newVec

proc `-`(self:Vec2, to_sub:Vec2): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x - to_sub.x
    newVec.y = self.y - to_sub.y
    return newVec

proc `*`(self:Vec2, to_mul:Vec2): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x * to_mul.x
    newVec.y = self.y * to_mul.y
    return newVec

proc `/`(self:Vec2, to_div:Vec2): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x / to_div.x
    newVec.y = self.y / to_div.y
    return newVec

proc `+`(self:Vec2, to_add:SomeNumber): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x + to_add.float
    newVec.y = self.y + to_add.float
    return newVec

proc `-`(self:Vec2, to_sub:SomeNumber): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x - to_sub.float
    newVec.y = self.y - to_sub.float
    return newVec

proc `*`(self:Vec2, to_mul:SomeNumber): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x * to_mul.float
    newVec.y = self.y * to_mul.float
    return newVec

proc `/`(self:Vec2, to_div:SomeNumber): Vec2 =
    var newVec = new Vec2
    newVec.x = self.x / to_div.float
    newVec.y = self.y / to_div.float
    return newVec

proc `+=`(self:Vec2, to_add:Vec2) =
    self.x += to_add.x
    self.y += to_add.y

proc `-=`(self:Vec2, to_sub:Vec2) =
    self.x -= to_sub.x
    self.y -= to_sub.y

proc `*=`(self:Vec2, to_mul:Vec2) =
    self.x *= to_mul.x
    self.y *= to_mul.y

proc `/=`(self:Vec2, to_div:Vec2) =
    self.x /= to_div.x
    self.y /= to_div.y

proc `+=`(self:Vec2, to_add:SomeNumber) =
    self.x += to_add.float
    self.y += to_add.float

proc `-=`(self:Vec2, to_sub:SomeNumber) =
    self.x -= to_sub.float
    self.y -= to_sub.float
proc `*=`(self:Vec2, to_mul:SomeNumber) =
    self.x *= to_mul.float
    self.y *= to_mul.float

proc `/=`(self:Vec2, to_div:SomeNumber) =
    self.x /= to_div.float
    self.y /= to_div.float

proc rotate*(self:Vec2, input_angle:SomeNumber) = 
    ## Rotates the Vec2. It takes in a radian and rotates the Vec2 accordingly.
    ## This does not return a modified Vec2, it instead rotates the Vec2 passed in.
    ## If you want to pass in a degree instead of a radian, use d2r() accordingly.
    var x_1 = self.x
    var angle = input_angle.float
    self.x = ((self.x * cos(angle)) - (self.y * sin(angle))).float
    self.y = ((x_1 * sin(angle)) + (self.y * cos(angle))).float
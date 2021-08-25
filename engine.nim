## Welcome to the Zimmer engine documentation!

import sdl2
import math
include ./scene

proc clamp*(num: SomeNumber, min: SomeNumber, max: SomeNumber): SomeNumber =
    ## Clamps and returns a value (num) between a minimum value (min) and a maximum value (max).
    if num < min:
        return min
    elif num > max:
        return max
    else:
        return num

proc d2r*(degree: SomeNumber): float =
    ## Converts degrees to radians.
    return degree.float / 57.2958

proc r2d*(radian: SomeNumber): float =
    ## Converts radians to degrees.
    return radian.float * 57.2958

type Engine* = ref object of RootObj
    ## This is the Engine object. The Engine is what it is. It renders, it updates physics, it handles input and more.
    window: WindowPtr
    renderer: RendererPtr
    scene: Scene
    bgcolor: Color
    window_size, mouse_pos: Vec2
    keyboard: ptr array[0..512, uint8]
    running: bool

proc newEngine*(bgcolor: Color, window_size: Vec2, window_name: string): Engine =
    ## Creates new Engine object. Requires background color and window size as paramaters.
    var self = new Engine
    self.bgcolor = bgcolor
    self.window_size = window_size
    sdl2.init(sdl2.INIT_EVERYTHING)
    self.window = createWindow(window_name, 0, 0, window_size.x.cint, window_size.y.cint, SDL_WINDOW_SHOWN)
    self.renderer = self.window.createRenderer(index = -1, flags = Renderer_PresentVsync)
    self.running = true
    return self

proc handle_keyboard*(self: Engine) =
    ## Updates engine's 'keyboard' value. To see what keys are pressed, compare it with the SDL_SCANCODEs in an if statement.
    pumpEvents()
    self.keyboard = getKeyboardState(nil)

proc handle_events*(self: Engine) =
    ## Handles window exit event and mouse movement.
    var event: Event
    while pollEvent(event):
        if event.kind == QuitEvent:
            self.running = false;
        # if event.kind == MouseMotion:
        #     self.mouse_pos.x = event.motion.x.float
        #     self.mouse_pos.y = event.motion.y.float

proc set_scene*(self: Engine, scene: Scene) = 
    ## Sets current scene of the engine. This scene will be rendered if render() is called.
    self.scene = scene

proc render_object*(self: Engine, obj: Object) =
    ## Renders a single object. DO NOT USE THIS! THIS IS USED BY render() ONLY!
    self.renderer.setDrawColor(obj.color.r, obj.color.g, obj.color.b, 255)
    var rect = rect(obj.pos.x.cint, obj.pos.y.cint, obj.size.x.cint, obj.size.y.cint)
    if obj.fill:
        self.renderer.fillRect(rect)
    else:
        self.renderer.drawRect(rect)

proc render*(self: Engine) =
    ## Renders all objects in the current scene. Doesn't need any arguments.
    self.renderer.setDrawColor(self.bgcolor.r, self.bgcolor.g, self.bgcolor.b, 255)
    self.renderer.clear()
    for obj in self.scene.objects:
        self.render_object(obj)
    self.renderer.present()

proc update_physics*(self: Engine) =
    ## Updates the positions in all of the objects in the current scene.
    for obj in self.scene.objects:
        obj.update_physics()
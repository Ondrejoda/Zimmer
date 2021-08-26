import sdl2
include ./engine

var engine = newEngine(newColor(0), newVec2(600, 600), "Window")

var scene = newScene()

var obj = newObject(newVec2(10, 10), newVec2(100, 100), newColor(255), 1, true)
obj.damping = 0.9
scene.add_object(obj)

engine.set_scene(scene)

while engine.running:
    engine.handle_events()
    engine.handle_keyboard()
    if engine.keyboard[SDL_SCANCODE_LEFT.ord] > 0:
        obj.apply_impulse(-0.3, 0.0)
    if engine.keyboard[SDL_SCANCODE_RIGHT.ord] > 0:
        obj.apply_impulse(0.3, 0.0)
    if engine.keyboard[SDL_SCANCODE_UP.ord] > 0:
        obj.apply_impulse(0.0, -0.3)
    if engine.keyboard[SDL_SCANCODE_DOWN.ord] > 0:
        obj.apply_impulse(0.0, 0.3)
    engine.update_physics()
    engine.render()
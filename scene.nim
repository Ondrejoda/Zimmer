include ./object

type Scene* = ref object of RootObj
    ## This is the Scene object. It contains all of the objects that are shown in the current scene.
    ## Scenes are passed to the engine to be rendered, to get it's physics updated, ect.
    objects: seq[Object]

proc newScene*(): Scene =
    ## Creates new Scene object.
    return new Scene

proc add_object*(self: Scene, obj:Object) =
    ## This adds an object to the seq in the Scene.
    self.objects.add(obj)

proc remove_object*(self: Scene, idx:SomeNumber) =
    ## This removes an object from the seq in the Scene.
    self.objects.del(idx)
window.TaskApp = class TaskApp extends Spine.Controller
  elements:
    ".items": "items"

  constructor: ->
    super
    Task.bind('create', @addOne)
    Task.bind('refresh', @addAll)
    Task.fetch()

  addOne: (task) =>
    view = new Tasks(item: task)
    @items.append(view.render().el)

  addAll: =>
    Task.each(@addOne)

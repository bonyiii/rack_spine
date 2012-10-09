window.TaskApp = class TaskApp extends Spine.Controller
  events:
    "submit form":  "create"
    "click .clear": "clear"

  elements:
    ".items":     "items"
    "form input": "input"

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

  create: (e) ->
    e.preventDefault()
    Task.create(name: @input.val())
    @input.val("")

  clear: ->
    Task.destroyDone()

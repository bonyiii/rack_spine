window.Tasks = class Tasks extends Spine.Controller
  constructor: ->
    super
    @item.bind("update", @render)
    @item.bind("destroy", @remove)
  
  render: ->
    @replace $('#taskTemplate').tmpl(@item)
    @

  remove: ->
    @el.remove()

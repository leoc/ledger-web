LedgerWeb.Views.Report ||= {}

class LedgerWeb.Views.Report.Tabs extends Backbone.View
  template: JST['report_tabs']
  tabTemplate: JST['report_tab']

  events:
    'click .tabs .tab': 'switchTab'

  switchTab: (e) =>
    newTab = $(e.currentTarget).data('tab-index')
    @$el.attr class: "report-content tab-#{newTab}"

  render: =>
    @$el.html(@template(report: @model))

    @views = []
    @$tabs = @$el.find('.tabs')
    @$tabLayers = @$el.find('.tab-layers')
    @model.get('reports').each (subreport, i) =>
      @$tabs.append(@tabTemplate(report: subreport.toJSON(), index: i))
      @$tabLayers.append("<div class=\"tab-layer tab-#{i}\"></div>")
      @views[i] = new LedgerWeb.Views.Report
        model: subreport
        el: @$tabLayers.find(".tab-#{i}")
      @views[i].render()
    @$el.attr class: 'report-content tab-0'
    this

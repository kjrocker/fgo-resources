$(document).ready(function(){

  var filterState = {
    class: [],
    rarity: []
  }

  function prunedState() {
    var result = {}
    Object.keys(filterState).forEach(function(k) {
      if (filterState[k].length > 0) {
        result[k] = filterState[k]
      }
    })
    return result
  }

  $('#servantTableFilter li.filter').on('click', function(e) {
    listElement = $(e.currentTarget)
    listData = listElement.data()
    filterField = listData.field
    filterValue = listData.value.toString()
    if (filterState[filterField].includes(filterValue)) {
      filterState[filterField] = filterState[filterField].filter(function(x) {
        return x !== filterValue
      })
      listElement.removeClass('active')
    } else {
      filterState[filterField].push(filterValue.toString())
      listElement.addClass('active')
    }
    $('#servantTable').bootstrapTable('filterBy', prunedState())
  })

  $('#servantTableFilter li.reset').on('click', function(e) {
    resetField = $(e.currentTarget).data().field
    filterState[resetField] = []
    $('#servantTableFilter li.filter[data-field="' + resetField + '"]').removeClass('active')
    $('#servantTable').bootstrapTable('filterBy', prunedState())
  })


});

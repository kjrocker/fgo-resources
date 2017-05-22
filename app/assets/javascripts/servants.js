$(document).ready(function(){

  var filterState = {
    class: [],
    rarity: []
  }

  $('#servantTableFilter').on('click', function(e) {
    listElement = $(e.target).closest('li')
    listData = listElement.data()
    filterField = listData.filterField
    filterValue = listData.filterValue.toString()
    if (filterState[filterField].includes(filterValue)) {
      filterState[filterField] = filterState[filterField].filter(function(x) {
        return x !== filterValue
      })
      listElement.removeClass('active')
    } else {
      filterState[filterField].push(filterValue.toString())
      listElement.addClass('active')
    }
    var prunedState = {};
    Object.keys(filterState).forEach(function(k) {
      if (filterState[k].length > 0) {
        prunedState[k] = filterState[k]
      }
    })
    $('#servantTable').bootstrapTable('filterBy', prunedState)
  })

});

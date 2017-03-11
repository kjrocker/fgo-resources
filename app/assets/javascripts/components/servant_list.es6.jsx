class ServantList extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      filter: {
        className: [],
        rarity: []
      },
      order: {
        field: null,
        direction: null,
      }
    }
    this.sortBy = this.sortBy.bind(this);
    this.displayServant = this.displayServant.bind(this)
    this.handleFilter = this.handleFilter.bind(this);
    this.handleSort = this.handleSort.bind(this);
    this.compare = this.compare.bind(this);
  }

  handleFilter(field, value) {
    let values = this.state.filter[field]
    const valueIndex = values.indexOf(value)
    if (valueIndex == -1) {
      values.push(value)
    } else {
      values.splice(valueIndex, 1)
    }
    this.setState({ filter: { ...this.state.filter, [field]: values } })
  }

  handleSort(field) {
    const currentOrder = this.state.order
    let newDirection = 'desc'
    if (currentOrder.field == field && currentOrder.direction == 'desc') {
      newDirection = 'asc'
    }
    this.setState({ order: {field, direction: newDirection }})
  }

  compare(x, y) {
    return x > y ? 1 : (x == y ? 0 : -1)
  }

  sortBy(s1, s2) {
    const { field, direction } = this.state.order;
    const { x, y } = { x: s1[field], y: s2[field] }
    switch (direction) {
      case 'asc':
        return this.compare(s1[field], s2[field]);
      case 'desc':
        return this.compare(s2[field], s1[field]);
      default:
        return 0;
    }
  }

  displayServant(servant) {
    const { filter } = this.state
    if (filter == null) { return true }
    return Object.entries(filter).every((entry) =>
      (entry[1].length == 0) || entry[1].includes(servant[entry[0]])
    )
  }

  render () {
    return (
      <div>
        <ClassSelect currentFilter={this.state.filter.className} classes={this.props.classes} changeFilter={this.handleFilter}/>
        <RaritySelect currentFilter={this.state.filter.rarity} changeFilter={this.handleFilter}/>
        <ServantTable handleSort={this.handleSort} servants={
          this.props.servants.filter(this.displayServant).sort(this.sortBy)
        }/>
      </div>
    )
  }
}

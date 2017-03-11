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
        <ServantTable servants={
          this.props.servants.filter(this.displayServant).sort(this.sortBy)
        }/>
      </div>
    )
  }
}

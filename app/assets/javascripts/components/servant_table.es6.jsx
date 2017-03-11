class ServantTable extends React.Component {
  constructor(props){
    super(props)
  }

  render () {
    const rows = this.props.servants.map(
      (s) => <ServantRow key={s.id} servant={s}/>
    )
    return (
      <table className="table table-hover">
        <thead>
          <tr>
            <th onClick={(e) => this.props.handleSort('name')}>Name</th>
            <th onClick={(e) => this.props.handleSort('className')}>Class</th>
            <th onClick={(e) => this.props.handleSort('rarity')}>Rarity</th>
          </tr>
        </thead>
        <tbody>
          { rows }
        </tbody>
      </table>
    )
  }
}

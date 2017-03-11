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
            <th>Name</th>
            <th>Class</th>
            <th>Rarity</th>
          </tr>
        </thead>
        <tbody>
          { rows }
        </tbody>
      </table>
    )
  }
}

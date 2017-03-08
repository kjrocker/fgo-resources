class ServantList extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    const rows = this.props.servants.map(
      (s) => <ServantRow key={s.id} servant={s}/>
    )
    return (
      <table>
        <tr>
          <th>Name</th>
          <th>Class</th>
          <th>Rarity</th>
        </tr>
        { rows }
      </table>
    )
    return <div />;
  }
}

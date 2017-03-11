class ServantRow extends React.Component {
  constructor(props){
    super(props)
  }

  shouldUpdateComponent() {
    false
  }

  render () {
    const { servant } = this.props
    return (
      <tr>
        <td>{ servant.name }</td>
        <td>{ servant.className }</td>
        <td>{ servant.rarity }</td>
      </tr>
    );
  }
}

class ServantRow extends React.Component {
  constructor(props){
    super(props)
  }
  render () {
    const { servant } = this.props
    return (
      <tr>
        <th>{ servant.name }</th>
        <td>{ servant.servant_class_id }</td>
        <td>{ servant.rarity }</td>
      </tr>
    );
  }
}

class ServantRow extends React.Component {
  constructor(props){
    super(props)
  }

  shouldUpdateComponent() {
    false
  }

  render () {
    const { servant } = this.props
    const iconURL = servant.firstIcon ? servant.firstIcon.url : ''
    return (
      <tr>
        <td><img src={iconURL} height='50' width='50'/>{ servant.name }</td>
        <td>{ servant.className }</td>
        <td>{ servant.rarity }</td>
      </tr>
    );
  }
}

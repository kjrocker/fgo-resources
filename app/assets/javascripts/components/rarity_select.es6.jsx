class RaritySelect extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.changeFilter('rarity', Number(e.currentTarget.text))
    e.preventDefault()
  }

  render () {
    const links = [0, 1, 2, 3, 4, 5].map(
      (name, index) => {
        const isFiltered = this.props.currentFilter.indexOf(name) != -1
        return (
          <li className={isFiltered ? 'active' : 'inactive'} key={index}>
            <a onClick={this.handleClick}>{name}</a>
          </li>
        )
      }

    )
    return (
      <nav className="navbar navbar-default">
        <div className="container-fluid">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#raritySelect">
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
            </button>
            <a className="navbar-brand">Rarity</a>
          </div>
          <div className="collapse navbar-collapse" id="raritySelect">
            <ul className="nav navbar-nav">
              { links }
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}

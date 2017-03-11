class ClassSelect extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      useImages: false
    };
    this.handleClick = this.handleClick.bind(this);
    this.createNavLink = this.createNavLink.bind(this);
  }

  handleClick(e) {
    this.props.changeFilter('className', e.currentTarget.title)
    e.preventDefault()
  }

  createNavLink(c) {
    if (this.state.useImages) {
      return <img src={c.icon_url} alt={c.name} height='40' width='40'/>
    } else {
      return c.name
    }
  }

  render () {
    const { currentFilter } = this.props
    const links = this.props.classes.map(
      (c, index) => {
        const isFiltered = currentFilter.indexOf(c.name) != -1
        return (
          <li className={isFiltered ? 'active' : 'inactive'} key={index}>
            <a onClick={this.handleClick} title={c.name}>
              { this.createNavLink(c) }
            </a>
          </li>
        )
      }
    )

    return (
      <nav className="navbar navbar-default">
        <div className="container-fluid">
          <div className="navbar-header">
            <button type="button" className="navbar-toggle" data-toggle="collapse" data-target="#classSelect">
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
            </button>
            <a className="navbar-brand">Class</a>
          </div>
          <div className="collapse navbar-collapse" id="classSelect">
            <ul className="nav navbar-nav">
              { links }
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}

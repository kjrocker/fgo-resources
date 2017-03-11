class ClassSelect extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      classNames: props.classes.map((c) => c.name)
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.changeFilter('className', e.currentTarget.text)
    e.preventDefault()
  }

  render () {
    const { currentFilter } = this.props
    const links = this.state.classNames.map(
      (name, index) => {
        const isFiltered = currentFilter.indexOf(name) != -1
        return (
          <li className={isFiltered ? 'active' : 'inactive'} key={index}>
            <a
              onClick={this.handleClick}>{name}</a>
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

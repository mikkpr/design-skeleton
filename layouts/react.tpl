<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="viewport" content="width=device-width">
  <link href='https://fonts.googleapis.com/css?family=Roboto:400' rel='stylesheet' type='text/css'>

  <style type="text/css">

    * {
      margin: 0;
      padding: 0;
    }

    body {
      background-color: #EBF1F5;
      font-family: 'Roboto';
      font-weight: 400;
      font-size: 16px;
      color: #000;
      position: relative;
    }

    ul {
      list-style: none;
    }

    .header {
      height: 3.750em;
      width: 100%;
      background-color: #0091EA;
    }

    .header .icon-options {
      width: 1.563em;
      height: 1.563em;
      left: auto;
    }

    .header-inner {
      float: right;
      position: relative;
      top: 1em;
      right: 1em;
    }

    .dropdown-menu {
      color: #4D4D4D;
      position: absolute;
      top: 0.13em;
      left: auto;
      right: 0.03em;
      background-color: white;
      box-shadow: -2px 2px 15px 2px rgba(0,0,0,0.15);
      -webkit-transform-origin: 100% 0%;
      transform-origin: 100% 0%;
      transition: all 150ms;
      display: none;
    }

    .dropdown-header {
      padding: 0.9em 1em;
      overflow: auto;
    }

    .dropdown-header .icon-options {
      width: 1.563em;
      height: 1.563em;
      top: -0.1em;
      left: 0.5em;
    }

    .dropdown-toggle {
      float: right;
    }

    .dropdown-icons {
      overflow: auto;
      float: left;
    }

    .dropdown-icons .icon {
      width: 1.250em;
      height: 1.250em;
      position: relative;
    }

    .dropdown-icons .icon-reload {
      width: 1.063em;
      height: 1.063em;
      top: 0.15em;
    }

    .dropdown-icons li {
      float: left;
      margin-right: 2.9em;
    }

    .icon {
      cursor: pointer;
    }

    .icon svg {
      max-width: 100%;
      max-height: 100%;
    }

    .dropdown-items .dropdown-item {
      min-width: 14em;
      padding: 0.9em 1em;
      cursor: pointer;
      opacity: 0;
      -webkit-user-select: none;
      user-select: none;
    }

    .dropdown-items .dropdown-item:hover {
      background-color: #f2f2f2;
    }

    .btn {
      text-transform: uppercase;
      color: white;
      display: inline-block;
      border-radius: 2px;
      font-size: 14px;
      font-weight: 500;
      cursor: pointer;
      padding: 0.5em 2em;
      background: #0091EA;
      margin: 1em;
      user-select: none;
      -webkit-user-select: none;
      box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.40);
      transition: all 100ms;
    }

    .btn:hover {
      box-shadow: 0 3px 6px 2px rgba(0, 0, 0, 0.20);
    }

    .timer {
      position: absolute;
      top: 0;
      left: 20px;
      line-height: 3.5em;
    }

    .todo {
      text-align: center;
    }

    .todo h3 {
      margin-top: 50px;
      margin-bottom: 10px;
    }

    .todo ul {
      margin-bottom: 10px;
    }

    .todo input {
      height: 20px;
      padding: 5px;
      line-height: 1em;
      font-size: 14px;
    }

    .todo button {
      padding: 10px;
      border-radius: 3px;
      margin-left: 10px;
    }

  </style>

</head>


<body>

<script src="javascripts/jquery.min.js"></script>
<script src="javascripts/jquery.velocity.min.js"></script>
<script src="javascripts/velocity.ui.min.js"></script>
<script src="javascripts/react.js"></script>
<script src="javascripts/JSXTransformer.js"></script>

<script type="text/jsx">
  /** @jsx React.DOM */

  $.Velocity.RegisterUI("slideFadeIn", {
      defaultDuration: 100,
      calls: [[{
        opacity: [1, 0],
        scaleY: [1, 0.3],
        scaleX: [1, 0.3],
      }]]
  });

  $.Velocity.RegisterUI("slideInTop", {
      defaultDuration: 100,
      calls: [[{
        opacity: [1, 0],
        translateY: [0, -30],
      }]]
  });

  $.Velocity.RegisterUI("slideInLeft", {
      defaultDuration: 100,
      calls: [[{
        opacity: [1, 0],
        translateX: [0, 30],
      }]]
  });

  var DropdownItem = React.createClass({

    render: function() {
      return (
        <li className="dropdown-item">{this.props.name}</li>
      );
    }
  });

  var DropdownItems = React.createClass({

    getDefaultProps: function() {
      return {
        items: ['New tab', 'New incognito tab', 'Bookmarks', 'Recent tabs', 'History', 'Print', 'Settings', 'Help & feedback']
      }
    },

    render: function() {
      var items = this.props.items.map(function(item, i) {
        return (<DropdownItem name={item} key={i} />);
      }.bind(this))
      return (
        <ul className="dropdown-items">
          {items}
        </ul>
      );
    }
  });

  var DropdownMenu = React.createClass({

    componentWillUpdate: function(nextProps, nextState) {
      if (nextProps.visibility) {
        $('.dropdown-menu').velocity("slideFadeIn", {easing: 'ease-in', duration: 75});
        $('.dropdown-menu .dropdown-icons li').velocity("slideInLeft", {
          stagger: 40,
          duration: 350,
          easing: [0.610, 0.870, 0.710, 1.000],
        });
        $('.dropdown-menu .dropdown-item').velocity("slideInTop", {
          stagger: 30,
          duration: 250,
          easing: [0.610, 0.870, 0.710, 1.000],
        });
      } else {
        $('.dropdown-menu').velocity("reverse", {display: 'none'});
        $('.dropdown-menu .dropdown-item').velocity("reverse");
      }
    },

    render: function() {
      return (
        <div className="dropdown-menu">
          <div className="dropdown-header">
            <DropdownIcons />
            <div className="dropdown-toggle">
              <Icon type="options" handleClick={this.props.handleOptionsClick} fill="#0091EA"/>
            </div>
          </div>
          <DropdownItems />
        </div>
      );
    }
  });

  var Icon = React.createClass({

    getDefaultProps: function() {
      return {
        fill: '#434343'
      }
    },

    render: function() {
      if (this.props.type === "star") {
        return (
          <div className="icon icon-star">
            <svg viewBox="0 0 32 32">
              <path d="M32 12.408l-11.056-1.607-4.944-10.018-4.944 10.018-11.056 1.607 8 7.798-1.889 11.011 9.889-5.199 9.889 5.199-1.889-11.011 8-7.798zM16 23.547l-6.983 3.671 1.334-7.776-5.65-5.507 7.808-1.134 3.492-7.075 3.492 7.075 7.807 1.134-5.65 5.507 1.334 7.776-6.983-3.671z" fill={this.props.fill}></path>
            </svg>
          </div>
        );
      } else if (this.props.type === "reload") {
        return (
          <div className="icon icon-reload">
            <svg viewBox="0 0 32 32">
              <path d="M32 12h-12l4.485-4.485c-2.267-2.266-5.28-3.515-8.485-3.515s-6.219 1.248-8.485 3.515c-2.266 2.267-3.515 5.28-3.515 8.485s1.248 6.219 3.515 8.485c2.267 2.266 5.28 3.515 8.485 3.515s6.219-1.248 8.485-3.515c0.189-0.189 0.371-0.384 0.546-0.583l3.010 2.634c-2.933 3.349-7.239 5.464-12.041 5.464-8.837 0-16-7.163-16-16s7.163-16 16-16c4.418 0 8.418 1.791 11.313 4.687l4.687-4.687v12z" fill={this.props.fill}></path>
            </svg>
          </div>  
        );
      } else if (this.props.type === "options") {
        return (
          <div className="icon icon-options" onClick={this.props.handleClick}>
            <svg viewBox="0 0 24 24" height="100%" width="100%">
              <g>
                <path d="M12,8c1.1,0,2-0.9,2-2s-0.9-2-2-2c-1.1,0-2,0.9-2,2S10.9,8,12,8z M12,10c-1.1,0-2,0.9-2,2s0.9,2,2,2c1.1,0,2-0.9,2-2S13.1,10,12,10z M12,16c-1.1,0-2,0.9-2,2s0.9,2,2,2c1.1,0,2-0.9,2-2S13.1,16,12,16z" fill={this.props.fill}></path>
              </g>
            </svg>
          </div>
        );
      } else if (this.props.type === "arrow") {
        return (
          <div className="icon icon-arrow">
            <svg viewBox="0 0 32 32">
              <path d="M19.414 27.414l10-10c0.781-0.781 0.781-2.047 0-2.828l-10-10c-0.781-0.781-2.047-0.781-2.828 0s-0.781 2.047 0 2.828l6.586 6.586h-19.172c-1.105 0-2 0.895-2 2s0.895 2 2 2h19.172l-6.586 6.586c-0.39 0.39-0.586 0.902-0.586 1.414s0.195 1.024 0.586 1.414c0.781 0.781 2.047 0.781 2.828 0z" fill={this.props.fill}></path>
            </svg>
          </div>
        );
      }
    }
  });

  var DropdownIcons = React.createClass({

    getDefaultProps: function() {
      return {
        items: ['arrow', 'reload', 'star']
      }
    },

    render: function() {
      var items = this.props.items.map(function(item, i) {
        return (<li><Icon type={item} key={i} /></li>);
      }.bind(this))
      return (
        <ul className="dropdown-icons">
          {items}
        </ul>
      );
    }
  });

  var App = React.createClass({

    getInitialState: function() {
      return {
        dropdownVisible: false
      }
    },

    dropdownToggle: function() {
      this.setState({
        dropdownVisible: !this.state.dropdownVisible
      })
    },

    render: function() {
      return (
        <div className="main-wrapper">
          <div className="header">
            <div className="header-inner">
              <Icon type="options" fill="#ffffff" handleClick={this.dropdownToggle}/>
            </div>
          </div>
          <DropdownMenu visibility={this.state.dropdownVisible} handleOptionsClick={this.dropdownToggle} />
        </div>
      );
    }
  });

  React.renderComponent(<App />,  document.querySelector('.menu'));

  /** @jsx React.DOM */
  var TodoList = React.createClass({
    render: function() {
      var createItem = function(itemText) {
        return <li>{itemText}</li>;
      };
      return <ul>{this.props.items.map(createItem)}</ul>;
    }
  });
  var TodoApp = React.createClass({
    getInitialState: function() {
      return {items: [], text: ''};
    },
    onChange: function(e) {
      this.setState({text: e.target.value});
    },
    handleSubmit: function(e) {
      e.preventDefault();
      var nextItems = this.state.items.concat([this.state.text]);
      var nextText = '';
      this.setState({items: nextItems, text: nextText});
    },
    render: function() {
      return (
        <div>
          <h3>TODO</h3>
          <TodoList items={this.state.items} />
          <form onSubmit={this.handleSubmit}>
            <input onChange={this.onChange} value={this.state.text} />
            <button>{'Add #' + (this.state.items.length + 1)}</button>
          </form>
        </div>
      );
    }
  });
  React.renderComponent(<TodoApp />, document.querySelector('.todo'));

  /** @jsx React.DOM */
  var Timer = React.createClass({
    getInitialState: function() {
      return {secondsElapsed: 0};
    },
    tick: function() {
      this.setState({secondsElapsed: this.state.secondsElapsed + 1});
    },
    componentDidMount: function() {
      this.interval = setInterval(this.tick, 1000);
    },
    componentWillUnmount: function() {
      clearInterval(this.interval);
    },
    render: function() {
      return (
        <div>Seconds Elapsed: {this.state.secondsElapsed}</div>
      );
    }
  });

  React.renderComponent(<Timer />, document.querySelector('.timer'));
</script>
  <header>
    <div class="timer"></div>
    <div class="menu"></div>
  </header>
  <section class="todo"></section>
</body>
</html>

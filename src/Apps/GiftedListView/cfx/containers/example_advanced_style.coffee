{ Styl } = require '../../../../common/cfx'

customStyles = Styl
  separator:
    height: 1
    backgroundColor: '#CCC'
  refreshableView:
    height: 50
    backgroundColor: '#fff'
    justifyContent: 'center'
    alignItems: 'center'
  actionsLabel:
    fontSize: 20
    color: '#007aff'
  paginationView:
    height: 44
    justifyContent: 'center'
    alignItems: 'center'
    backgroundColor: '#FFF'
  defaultView:
    justifyContent: 'center'
    alignItems: 'center'
    padding: 20
  defaultViewTitle:
    fontSize: 16
    fontWeight: 'bold'
    marginBottom: 15
  row:
    padding: 10
    height: 44
  header:
    backgroundColor: '#50a4ff'
    padding: 10
  headerTitle:
    color: '#fff'

screenStyles = Styl
  container:
    flex: 1
    backgroundColor: '#FFF'
  navBar:
    height: 64
    backgroundColor: '#007aff'
    justifyContent: 'center'
    alignItems: 'center'
  navBarTitle:
    color: '#fff'
    fontSize: 16
    marginTop: 12

module.exports = {
  customStyles
  screenStyles
}

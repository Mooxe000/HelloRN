var Comps, Styl, Text, TouchableHighlight, TouchableOpacity, View, echo, getActionButtonStyles, getActionStyles, getOperatorStyles, ref, styles;

echo = function() {
  return console.log(arguments);
};

ref = require('./common/cfx'), Comps = ref.Comps, Styl = ref.Styl;

Text = Comps.Text, View = Comps.View, TouchableHighlight = Comps.TouchableHighlight, TouchableOpacity = Comps.TouchableOpacity;

styles = Styl({
  keyNumber: {
    flex: 1,
    borderColor: '#f8f8f8',
    borderWidth: 1
  },
  keyOperator: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center'
  },
  keyAction: {
    flex: 1,
    padding: 10
  },
  keyActionButton: {
    flex: 1
  },
  button: {
    flex: 1,
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center'
  },
  textButton: {
    color: '#919191',
    fontSize: 20,
    fontWeight: '400'
  },
  textButtonOperator: {
    color: 'white',
    fontSize: 20,
    fontWeight: '600'
  }
});

getOperatorStyles = function(classOperation) {
  var buttonOperator;
  buttonOperator = {
    basic: {
      height: 50,
      width: 50,
      borderRadius: 25,
      alignItems: 'center',
      justifyContent: 'center'
    },
    add: {
      backgroundColor: '#fb96cf',
      paddingBottom: 3
    },
    substract: {
      backgroundColor: '#fcb064',
      paddingBottom: 3
    },
    multiply: {
      backgroundColor: '#68cef1',
      paddingBottom: 3
    },
    divide: {
      backgroundColor: '#cb7dc9',
      paddingBottom: 3
    }
  };
  return Object.assign(buttonOperator.basic, buttonOperator[classOperation]);
};

getActionStyles = function(classOperation) {
  var buttonAction;
  buttonAction = {
    basic: {
      flex: 1,
      borderRadius: 10,
      alignItems: 'center',
      justifyContent: 'center'
    },
    back: {
      paddingBottom: 1,
      borderColor: '#d68086',
      borderWidth: 1
    },
    equal: {
      paddingBottom: 1,
      borderColor: '#9ed8a6',
      borderWidth: 1
    }
  };
  return Object.assign(buttonAction.basic, buttonAction[classOperation]);
};

getActionButtonStyles = function(classOperation) {
  var buttonText;
  buttonText = {
    basic: {
      fontSize: 25,
      fontWeight: '200'
    },
    back: {
      paddingBottom: 3,
      color: '#d68086'
    },
    equal: {
      paddingBottom: 3,
      color: '#9ed8a6'
    }
  };
  return Object.assign(buttonText.basic, buttonText[classOperation]);
};

module.exports = function() {
  switch (this.props.keyType) {
    case 'number':
      return View({
        style: styles.keyNumber
      }, TouchableHighlight({
        style: styles.button,
        underlayColor: '#cdcdcd'
      }, Text({
        style: styles.textButton
      }, this.props.KeySymbol)));
    case 'operator':
      return View({
        style: styles.keyOperator
      }, TouchableHighlight({
        style: getOperatorStyles(this.props.keyValue),
        underlayColor: '#cdcdcd'
      }, Text({
        style: styles.textButtonOperator
      }, this.props.KeySymbol)));
    case 'action':
      return View({
        style: styles.keyAction
      }, TouchableOpacity({
        style: styles.keyActionButton
      }, View({
        style: getActionStyles(this.props.keyValue)
      }, Text({
        style: getActionButtonStyles(this.props.keyValue)
      }, this.props.KeySymbol))));
  }
};

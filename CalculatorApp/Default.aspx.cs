using System;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CalculatorApp
{

    public partial class Default : System.Web.UI.Page
    {
        //private string _expression = "";
        //private string _leftSideExpression;
        //private string _rightSideExpression;
        //private double _rightSide;
        //private double _leftSide;
        //private double _total;
        //private string _calc;

        public void buttonClicked(object sender, CommandEventArgs args)         {
            Calculator.HandleInput(args);
            switch (Calculator._state)
            {
                case CALCSTATE.ADD:
                    Calculator.Add();
                    break;
                case CALCSTATE.SUBTRACT:
                    Calculator.Subtract();
                    break;
                case CALCSTATE.MULTIPLY:
                    Calculator.Multiply();
                    break;
                case CALCSTATE.DIVIDE:
                    Calculator.Divide();
                    break;
            }
            calcInput.Text = Calculator.expression;
            calcTotal.Text = Calculator.runningTotal.ToString();
        }

        public void calculateExpression(object sender, CommandEventArgs args)
        {
            if (calcInput.Text.Length < 1) { return; }
            var calcOperator = args.CommandArgument;
            Calculator.ApplyOperator(calcOperator);
            calcInput.Text = Calculator.expression;
        }

        public void clearCalc(object sender, CommandEventArgs args)
        {
            Calculator.clearCalc();
            calcInput.Text = Calculator.expression;
            calcTotal.Text = Calculator.runningTotal.ToString();
        }

    }
}

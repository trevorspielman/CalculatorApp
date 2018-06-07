using System;
using System.Web.UI.WebControls;

namespace CalculatorApp
{
    public enum CALCSTATE
    {
        INPUT,
        ADD,
        SUBTRACT,
        MULTIPLY,
        DIVIDE
    }

    public static class Calculator
    {
        public static CALCSTATE _state { get; private set; } = CALCSTATE.INPUT;
        public static decimal currentN { get; private set; } = 0;
        public static decimal prevN { get; private set; } = 1;
        public static string currentS { get; private set; } = "";
        public static decimal runningTotal { get; private set; } = 0;
        public static string expression { get; private set; } = "";

        internal static void clearCalc()
        {
            _state = CALCSTATE.INPUT;
            currentN = 0;
            currentS = "";
            prevN = 1;
            runningTotal = 0;
            expression = "";
        }

        internal static void ApplyOperator(object calcOperator)
        {
            decimal n;
            if(_state == CALCSTATE.INPUT){
                currentS = "";
            }
            decimal.TryParse(currentS, out n);
            if (!"()+-*/".Contains(expression[expression.Length-1].ToString()))
            {
                expression += calcOperator;
                currentS = "";
                //prevS = currentS;

                switch (calcOperator)
                {
                    case "+":
                        _state = CALCSTATE.ADD;
                        break;
                    case "-":
                        _state = CALCSTATE.SUBTRACT;
                        break;
                    case "*":
                        _state = CALCSTATE.MULTIPLY;
                        break;
                    case "/":
                        _state = CALCSTATE.DIVIDE;
                        break;
                }
            }
            else{
                System.Console.WriteLine("Invalid Expression");
                return;
            }
        }



        internal static void HandleInput(CommandEventArgs args)
        {
            decimal n;
            var s = Calculator.currentS + args.CommandArgument;
            if (decimal.TryParse(s, out n))
            {
                expression += args.CommandArgument;
                currentS = s;
            }
            //Sets the initial value of currentN to first number entered
            if (_state == CALCSTATE.INPUT)
            {
                decimal x;
                decimal.TryParse(s, out x);
                currentN = n;
            }
        }



        public static void Add()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN + n);
            currentN += n;
            prevN = n;
        }

        public static void Subtract()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN - n);
            currentN -= n;
            prevN = -n;
        }

        public static void Multiply()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN + (prevN * n));
            currentN *= n;
            prevN = runningTotal;
        }


        public static void Divide()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN + (prevN / n));
            currentN /= n;
            prevN = runningTotal;
        }

    }
}

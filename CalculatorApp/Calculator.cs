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
        public static string currentS { get; private set; } = "";
        public static string prevS { get; private set; } = "";
        public static decimal runningTotal { get; private set; } = 0;
        public static string expression { get; private set; } = "";

        internal static void clearCalc()
        {
            _state = CALCSTATE.INPUT;
            currentN = 0;
            currentS = "";
            prevS = "";
            runningTotal = 0;
            expression = "";
        }

        internal static void ApplyOperator(object calcOperator)
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            currentN += n;
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



        internal static void HandleInput(CommandEventArgs args)
        {
            decimal n;
            var s = Calculator.currentS + args.CommandArgument;
            if (decimal.TryParse(s, out n))
            {
                expression += args.CommandArgument;
                currentS = s;
            }
        }



        public static void Add()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN + n);
        }

        public static void Subtract()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN - n);
        }

        public static void Multiply()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN * n);
        }


        public static void Divide()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN / n);
        }

    }
}

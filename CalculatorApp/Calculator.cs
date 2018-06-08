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
        DIVIDE,
        PARENSOPEN,
        PARENSCLOSE
    }

    public static class Calculator
    {
        public static CALCSTATE _state { get; private set; } = CALCSTATE.INPUT;
        public static decimal currentN { get; private set; } = 0;
        public static decimal prevN { get; set; } = 1;
        public static string currentS { get; private set; } = "";
        public static decimal runningTotal { get; private set; } = 0;
        public static string expression { get; private set; } = "";
        public static bool inside { get; set; } = false;
        public static decimal insideN { get; set; } = 0;

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
            if (_state == CALCSTATE.INPUT)
            {
                currentS = "";
                runningTotal = currentN;
            }
            decimal.TryParse(currentS, out n);
            if (!"+-*/".Contains(expression[expression.Length - 1].ToString()))
            {
                expression += calcOperator;
                currentS = "";
                currentN += n;

                switch (calcOperator)
                {
                    case "+":
                        _state = CALCSTATE.ADD;
                        currentN = runningTotal;
                        break;
                    case "-":
                        _state = CALCSTATE.SUBTRACT;
                        currentN = runningTotal;
                        break;
                    case "*":
                        _state = CALCSTATE.MULTIPLY;
                        currentN = runningTotal;
                        break;
                    case "/":
                        _state = CALCSTATE.DIVIDE;
                        currentN = runningTotal;
                        break;
                }

            }
            else
            {
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

        internal static void HandleParens(object commandArgument)
        {
            expression += commandArgument;
            switch (commandArgument)
            {
                case "(":
                    inside = true;
                    break;
                case ")":
                    inside = false;
                    currentN = insideN;
                    //prevN = insideN;
                    break;
            }
        }



        public static void Add()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN + n);
            if(inside){
                insideN = runningTotal;
            }
            prevN = n;
        }

        public static void Subtract()
        {
            decimal n;
            decimal.TryParse(currentS, out n);
            runningTotal = (currentN - n);
            if (inside)
            {
                insideN = runningTotal;
            }
            prevN = -n;
        }

        public static void Multiply()
        {
            decimal n;
            decimal.TryParse(currentS, out n);

            if (!expression.Contains("+") && !expression.Contains("-"))
            {
                //works for multiplication w/o sub/add
                runningTotal = (currentN * (prevN * n));
            }
            if(expression.Contains(")") || expression.Contains("("))
            {
                runningTotal = (currentN * n);
            }
            else
            {
                //works for Order of operations
                runningTotal = ((currentN - prevN) + (prevN * n));
            }
            if (inside)
            {
                insideN = runningTotal;
            }

        }


        public static void Divide()
        {
            decimal n;
            decimal.TryParse(currentS, out n);

            if (n == 0)
            {
                //allows 0 to be entered into the expression so I can divide by decimals
                return;
            }
            if (!expression.Contains("+") && !expression.Contains("-"))
            {
                //works for division w/o sub/add functions or prevN = 1
                runningTotal = (currentN / (n / prevN));
            }
            if (expression.Contains(")") || expression.Contains("("))
            {
                runningTotal = (currentN / n);
            }
            else
            {
                //works for Order of operations
                runningTotal = ((currentN - prevN) + (prevN / n));
            }
            if (inside)
            {
                insideN = runningTotal;
            }

        }

    }
}

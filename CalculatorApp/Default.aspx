<%@ Page Language="C#" Inherits="CalculatorApp.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
    <style>
        .numbers{
            display: grid;
            grid-template-areas: 
            "s e n add" 
            "f fi si sub"
            "o t th mul"
            "d z emp div"
            "c equ po pc";
            height: 50vh;
            width: 60vw;
        }
        .operator{
            background: grey;
            color: white;
        }
        .equals{
            background: green;
            color: white;
        }
        .clearInput{
            background: red;
            color: white;
        }
        .equated{
            background: green;
            color: white;
            float: right;
            height: 40px;
            padding: 10px;
            width: 30vw;
            border: 1px solid black;
            cursor: none;
            pointer-events: none;
            font-size: 30px;
            margin-bottom: 1rem;
        }

        input[type="submit"]{
            text-align: center;
            width: 100%;
            height 100%;
            transition: all .4s linear;
            font-size: 20px;
        }    
        input[type="submit"].numberBtn{
            background: GhostWhite;
            color: black;
        }
        input[type="submit"]:hover{
            background: black;
            color: white;
            cursor: pointer;
        }
        input[type="text"].equation{
            border: 1px solid black;
            float: left;
            height: 40px;
            padding: 10px;
            width: 58.5vw;
            cursor: none;
            pointer-events: none;
            font-size: 30px;
            margin-bottom: 1rem;
        }
        input[type="text"].solution{
            float: right;
            height: 40px;
            padding: 10px;
            width: 30vw;
            border: 1px solid black;
            cursor: none;
            pointer-events: none;
            font-size: 30px;
            margin-bottom: 1rem;
        }
        #button0{
            grid-area: z;
        }
        #button1{
            grid-area: o;
        }
        #button2{
            grid-area: t;
        }
        #button3{
            grid-area: th;
        }    
        #button4{
            grid-area: f;
        }
        #button5{
            grid-area: fi;
        }
        #button6{
            grid-area: si;
        }
        #button7{
            grid-area: s;
        }
        #button8{
            grid-area: e;
        }
        #button9{
            grid-area: n;
        }
        #decimal{
            grid-area: d;
        }
        #clear{
            grid-area: c;
        }
        #add{
            grid-area: add;
        }
        #subtract{
            grid-area: sub;
        }
        #multiply{
            grid-area: mul;
        }
        #divide{
            grid-area: div;
        }
        #equal{
            grid-area: equ;
        }
        #parensOpen{
            grid-area: po;
        }
        #parensClose{
            grid-area: pc;
        }
        #empty{
            grid-area: emp;
        }
    </style>
</head>
<body>
	<form id="form1" runat="server">
    
            <asp:TextBox CssClass="equation" id="calcInput" runat="server"/>
            <asp:TextBox CssClass="solution" id="calcTotal" runat="server"/>                
            <div class="numbers">
                <asp:Button CssClass="numberBtn" id="button1" runat="server" Text="1" OnCommand="buttonClicked" CommandArgument="1" />
                <asp:Button CssClass="numberBtn" id="button2" runat="server" Text="2" OnCommand="buttonClicked" CommandArgument="2" />
                <asp:Button CssClass="numberBtn" id="button3" runat="server" Text="3" OnCommand="buttonClicked" CommandArgument="3" />
                <asp:Button CssClass="numberBtn" id="button4" runat="server" Text="4" OnCommand="buttonClicked" CommandArgument="4" />
                <asp:Button CssClass="numberBtn" id="button5" runat="server" Text="5" OnCommand="buttonClicked" CommandArgument="5" />
                <asp:Button CssClass="numberBtn" id="button6" runat="server" Text="6" OnCommand="buttonClicked" CommandArgument="6" />
                <asp:Button CssClass="numberBtn" id="button7" runat="server" Text="7" OnCommand="buttonClicked" CommandArgument="7" />
                <asp:Button CssClass="numberBtn" id="button8" runat="server" Text="8" OnCommand="buttonClicked" CommandArgument="8" />
                <asp:Button CssClass="numberBtn" id="button9" runat="server" Text="9" OnCommand="buttonClicked" CommandArgument="9" />
                <asp:Button CssClass="numberBtn" id="button0" runat="server" Text="0" OnCommand="buttonClicked" CommandArgument="0" />
                <asp:Button CssClass="numberBtn" id="decimal" runat="server" Text="." OnCommand="buttonClicked" CommandArgument="." />
                <asp:Button CssClass="clearInput" id="clear" runat="server" Text="C" OnCommand="clearCalc" CommandArgument="." />
                <asp:Button CssClass="operator" id="add" runat="server" Text="+" OnCommand="calculateExpression" CommandArgument="+" />
                <asp:Button CssClass="operator" id="subtract" runat="server" Text="-" OnCommand="calculateExpression" CommandArgument="-" />
                <asp:Button CssClass="operator" id="multiply" runat="server" Text="*" OnCommand="calculateExpression" CommandArgument="*" />
                <asp:Button CssClass="operator" id="divide" runat="server" Text="/" OnCommand="calculateExpression" CommandArgument="/"/>
                <asp:Button CssClass="operator" id="parensOpen" runat="server" Text="(" OnCommand="handleParens" CommandArgument="("/>
                <asp:Button CssClass="operator" id="parensClose" runat="server" Text=")" OnCommand="handleParens" CommandArgument=")"/>
                <asp:Button CssClass="equals" id="equal" runat="server" Text="=" OnCommand="equalCalc" CommandArgument="="/>
                <asp:Button CssClass="numberBtn" id="empty" runat="server" Text=""/>
                
            </div>
            

	</form>
</body>
</html>

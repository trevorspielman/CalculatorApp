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
            "d z c div"
            ". . . equ";
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
        .equated{
            background: green;
            color: white;
        }
        input[type="submit"]{
            text-align: center;
            width: 100%;
            height 100%;
<!--            transition: all .3s linear;-->
        }    
        input[type="submit"]:hover{
            background: black;
            color: white;
            cursor: pointer;
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
            background: red;
            color: white;
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
    </style>
</head>
<body>
	<form id="form1" runat="server">
            
            <asp:TextBox id="calcInput" runat="server"/>
            <asp:TextBox id="calcTotal" runat="server"/>
            <div class="numbers">
                <asp:Button id="button1" runat="server" Text="1" OnCommand="buttonClicked" CommandArgument="1" />
                <asp:Button id="button2" runat="server" Text="2" OnCommand="buttonClicked" CommandArgument="2" />
                <asp:Button id="button3" runat="server" Text="3" OnCommand="buttonClicked" CommandArgument="3" />
                <asp:Button id="button4" runat="server" Text="4" OnCommand="buttonClicked" CommandArgument="4" />
                <asp:Button id="button5" runat="server" Text="5" OnCommand="buttonClicked" CommandArgument="5" />
                <asp:Button id="button6" runat="server" Text="6" OnCommand="buttonClicked" CommandArgument="6" />
                <asp:Button id="button7" runat="server" Text="7" OnCommand="buttonClicked" CommandArgument="7" />
                <asp:Button id="button8" runat="server" Text="8" OnCommand="buttonClicked" CommandArgument="8" />
                <asp:Button id="button9" runat="server" Text="9" OnCommand="buttonClicked" CommandArgument="9" />
                <asp:Button id="button0" runat="server" Text="0" OnCommand="buttonClicked" CommandArgument="0" />
                <asp:Button id="decimal" runat="server" Text="." OnCommand="buttonClicked" CommandArgument="." />
                <asp:Button id="clear" runat="server" Text="C" OnCommand="clearCalc" CommandArgument="." />
                <asp:Button CssClass="operator" id="add" runat="server" Text="+" OnCommand="calculateExpression" CommandArgument="+" />
                <asp:Button CssClass="operator" id="subtract" runat="server" Text="-" OnCommand="calculateExpression" CommandArgument="-" />
                <asp:Button CssClass="operator" id="multiply" runat="server" Text="*" OnCommand="calculateExpression" CommandArgument="*" />
                <asp:Button CssClass="operator" id="divide" runat="server" Text="/" OnCommand="calculateExpression" CommandArgument="/"/>
                <asp:Button CssClass="equals" id="equal" runat="server" Text="=" OnCommand="equalCalc" CommandArgument="="/>
            </div>
            
            
	</form>
</body>
</html>

<%@ Page Language="C#" Inherits="CalculatorApp.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Default</title>
    <style>
        .numbers{
            display: grid;
            grid-template-areas: 
            "s e n" 
            "f fi si"
            "o t th"
            "d z c"
        }
        input[type="submit"]{
            text-align: center;
            width: 4rem;
            height 10rem;
            padding: 1rem;
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
                
            </div>
            <asp:Button id="add" runat="server" Text="+" OnCommand="calculateExpression" CommandArgument="+" />
            <asp:Button id="subtract" runat="server" Text="-" OnCommand="calculateExpression" CommandArgument="-" />
            <asp:Button id="multiply" runat="server" Text="*" OnCommand="calculateExpression" CommandArgument="*" />
            <asp:Button id="divide" runat="server" Text="/" OnCommand="calculateExpression" CommandArgument="/"/>
            
            
	</form>
</body>
</html>

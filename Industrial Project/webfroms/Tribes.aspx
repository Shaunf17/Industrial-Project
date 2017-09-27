<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tribes.aspx.cs" Inherits="Industrial_Project.webfroms.Tribes" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css' />
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />

    <link href="../css/MainDashboardCSS.css" rel="stylesheet" />
    <link href="../css/Navbar.css" rel="stylesheet" />
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js'></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

    <!--Chart.js && Utils && Analytics-->
    <script src="../js/analytics.js"></script>
    <script src="../js/utils.js"></script>
    <script src="../js/Chart.bundle.js"></script>

    <title>Tribes</title>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="nav flex-column" style="z-index: 1;">
            <div class="nav-item">
                <img id="YoyoLogo" src="../Pictures/logo.png" />
            </div>
            <a class="nav-link" id="active" href="MainDashboard.aspx" style="display: inline-flex; padding: 10px 65px 5px 25px;"><i class="fa fa-th-large" aria-hidden="true"></i>
                <div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Home</div>
            </a>
            <br />
            <div class="dropdown">
                <a class="nav-link" href="#" style="display: inline-flex; padding: 10px 20px 5px 25px;"><i class="fa fa-bar-chart" aria-hidden="true"></i>
                    <div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Reports  <i class="fa fa-chevron-down linkText" aria-hidden="true" style="float: right; margin-top: 5px; margin-left: 5px;"></i></div>

                </a>
                <div class="dropdown-content">
                    <a href="Heatmap.aspx">Total Sales</a>
                    <a href="PopularityCharts.aspx">Popularity</a>
                    <a href="ActivityCharts.aspx">Activity</a>
                    <a href="PaymentsChart.aspx">Payments</a>
                    <a href="Heatmap.aspx">Heat Map</a>
                    <a href="Comparison.aspx">Comparison</a>
                </div>
            </div>
            <br />
            <a class="nav-link" href="Tribes.aspx" style="display: inline-flex; padding: 10px 65px 5px 25px;"><i class="fa fa-group" aria-hidden="true"></i>
                <div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Tribes</div>
            </a>
            <asp:LinkButton ID="UploadButton" OnClick="Upload_Click" runat="server" CssClass="nav-link" Style="display: inline-flex; padding: 10px 55px 5px 25px;"> <i class="fa fa-upload" aria-hidden="true"></i><div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;"> Upload</div></asp:LinkButton><br />
            <asp:LinkButton ID="AccountButton" OnClick="AccClick" runat="server" CssClass="nav-link" Style="display: inline-flex; padding: 10px 55px 5px 25px;"><i class="fa fa-user" aria-hidden="true"></i><div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;"> Account</div></asp:LinkButton><br />
            <asp:LinkButton ID="LogOut" OnClick="LogOut_click" runat="server" CssClass="nav-link" Style="display: inline-flex; padding: 10px 55px 5px 25px;">
               <i class="fa fa-sign-out" aria-hidden="true"></i><div class="linkText" style="padding: 0px 0px 10px 5px; margin-top: -5px;">Log out</div></asp:LinkButton>
        </nav>

        <div class="container-fluid chartContainer" style="z-index: -1;margin-left:10%;">
            <div class="row">
                <h1 class="col-md-4 col-md-offset-5">Tribes</h1>
             </div>
            <br/>
            <br/>
            <div class="row">
                <h1 class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-4" style="padding-left:3.6%;"><u>Medical Student</u></h1>
            </div>
            <br/>
            <div class="row">
                <div class="col-md-8 col-md-offset-1 col-xs-8 col-xs-offset-1" style="padding-left:10.8%;" >
                <table class="table table-bordered" style="border-radius:100px;">
                    <tr style="text-align:center; background-color:#b4b4b4" >
                        <td class="col-md-4 col-xs-4"> <h3>Analysis</h3>
                            </td>
                         <td class="col-md-4 col-xs-4"> <h3>Personality</h3>
                            </td>
                        </tr>
                    <tr style="background-color:white">
                        <td class="col-md-4 col-xs-4" style="text-align:left;"" >
                            <br/>
                            <ul>
                            <li>
                                Based on Ninewells Shop
                                </li>
                            <li>
                               Number of times app used: 29
                                </li>
                            <li>
                               Around 45% of users are returning
                                </li>
                            <li>
                                Mostly used during the morning, never after 3pm
                                </li>
                            <li>
                                No reports earlier than 2017
                                </li>
                            <li>
                               Spending habits: Normally £5 or less
                                </li>
                            </ul>
                             <br/>
                             <br/>
                            </td>
                         <td class="col-md-4 col-xs-4" style="text-align:justify;">
                             <br/>
                             Medical students use the app fairly regularly, usually spending small amounts on snacks or drinks.
                             At the time of writing the user base is still quite small at onl 13 unique users, however, almost half have used the app more than once.
                            
                          <br/>
                              <br/>
                         </td>
                        </tr>
                    </table>
                    </div>
            </div>

            <br/>
            <div class="row">
                <h1 class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-4" style="padding-left:5%;"><u>Dental Student</u></h1>
            </div>
            <br/>
            <div class="row">
                <div class="col-md-8 col-md-offset-1 col-xs-8 col-xs-offset-1" style="padding-left:10.8%;" >
                <table class="table table-bordered" style="border-radius:100px;">
                    <tr style="text-align:center; background-color:#b4b4b4" >
                        <td class="col-md-4 col-xs-4"> <h3>Analysis</h3>
                            </td>
                         <td class="col-md-4 col-xs-4"> <h3>Personality</h3>
                            </td>
                        </tr>
                    <tr style="background-color:white">
                        <td class="col-md-4 col-xs-4" style="text-align:left;"" >
                            <br/>
                            <ul>
                            <li>
                                Based on Dental Cafe
                                </li>
                            <li>
                              Times used: 2767
                                </li>
                            <li>
                               146 returning users - 82%
                                </li>
                            <li>
                               2767 transactions
                                </li>
                                 <li>
                              Usually the amount spent is less than £6
                                </li>
                            <li>
                               Mostly morning uses from around 9am-12pm
                                </li>
                            <li>
                               Mostly payment types with a date range consisting of only discounts
                                </li>
                            </ul>
                             <br/>
                             <br/>
                            </td>
                         <td class="col-md-4 col-xs-4" style="text-align:justify;">
                             <br/>
                            Dental students frequently use the app. Mostly in the morning for snacks and drinks. Out of 178 users a staggering 146 are returning which indicates dentists prefer the convenience of Yoyo. Most transactions are under £5, with none being over £6.
                            
                          <br/>
                              <br/>
                         </td>
                        </tr>
                    </table>
                    </div>
            </div>

            <br/>
            <div class="row">
                <h1 class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-4" style="padding-left:4%;"><u>DJCAD Student</u></h1>
            </div>
            <br/>
            <div class="row">
                <div class="col-md-8 col-md-offset-1 col-xs-8 col-xs-offset-1" style="padding-left:10.8%;" >
                <table class="table table-bordered" style="border-radius:100px;">
                    <tr style="text-align:center; background-color:#b4b4b4" >
                        <td class="col-md-4 col-xs-4"> <h3>Analysis</h3>
                            </td>
                         <td class="col-md-4 col-xs-4"> <h3>Personality</h3>
                            </td>
                        </tr>
                    <tr style="background-color:white">
                        <td class="col-md-4 col-xs-4" style="text-align:left;"" >
                            <br/>
                            <ul>
                            <li>
                                Based on DJCAD Cantina
                                </li>
                            <li>
                               Total users: 7877
                                </li>
                            <li>
                               Returning users: 6946
                                </li>
                            <li>
                                Times used: 16618
                                </li>
                            <li>
                               88% of users are returning customers
                                </li>
                            <li>
                               Mostly spending in the morning. There are rarely any transactions after 3pm.
                                </li>
                                <li>
                               Wide range of money spent in transactions. Most frequent amount is between £4.75 and £12.00.
                                </li>
                            </ul>
                             <br/>
                             <br/>
                            </td>
                         <td class="col-md-4 col-xs-4" style="text-align:justify;">
                             <br/>
                            DJCAD has a very large, returning user base. The customers frequently spend in the morning, presumably on breakfast and/or coffee and the average spend is around £4,75. Out of the 3 users profiles they  spend the most.
                            
                          <br/>
                              <br/>
                         </td>
                        </tr>
                    </table>
                    </div>
            </div>

        </div>

          <script src="../js/LoadCharts.js"></script>
    </form>

</body>
</html>

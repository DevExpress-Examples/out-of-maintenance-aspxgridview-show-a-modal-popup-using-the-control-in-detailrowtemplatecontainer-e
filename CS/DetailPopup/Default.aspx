<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DetailPopup._Default" %>

<%@ register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<%@ register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ register Assembly="DevExpress.Web.v8.3" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>

<%@ register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script type ="text/javascript">
      function ShowPopup (element)
        {
         
          popup.ShowAtElementByID(element.name);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwgv:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" ClientInstanceName="grid" >
            <templates>
                <detailrow>
                    <dxwgv:aspxgridview ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"
                        DataSourceID="AccessDataSource2" KeyFieldName="ProductID" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" OnHtmlRowCreated="ASPxGridView2_HtmlRowCreated">
                        <columns>
                            <dxwgv:gridviewdatatextcolumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
                                <editformsettings Visible="False" />
                            </dxwgv:gridviewdatatextcolumn>
                            <dxwgv:gridviewdatatextcolumn FieldName="ProductName" VisibleIndex="1">
                            </dxwgv:gridviewdatatextcolumn>
                            <dxwgv:gridviewdatatextcolumn FieldName="CategoryID" VisibleIndex="2">
                            </dxwgv:gridviewdatatextcolumn>
                            <dxwgv:gridviewdatatextcolumn FieldName="UnitPrice" VisibleIndex="3">
                            </dxwgv:gridviewdatatextcolumn>
                            <dxwgv:gridviewdatatextcolumn Name="Template" VisibleIndex="4">
                                <dataitemtemplate>
                                    <dxe:aspxbutton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Ships">
                                    </dxe:aspxbutton>
                                </dataitemtemplate>
                            </dxwgv:gridviewdatatextcolumn>
                        </columns>
                        <settingsbehavior ColumnResizeMode="Control" />
                       
                    </dxwgv:aspxgridview>
                    <dxe:aspxbutton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="ShowPopup">
                    </dxe:aspxbutton>
                </detailrow>
            </templates>
            <columns>
                <dxwgv:gridviewdatatextcolumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <editformsettings Visible="False" />
                </dxwgv:gridviewdatatextcolumn>
                <dxwgv:gridviewdatatextcolumn FieldName="CategoryName" VisibleIndex="1">
                </dxwgv:gridviewdatatextcolumn>
                <dxwgv:gridviewdatatextcolumn FieldName="Description" VisibleIndex="2">
                </dxwgv:gridviewdatatextcolumn>
            </columns>
            <settingsdetail ShowDetailRow="True" />
        </dxwgv:aspxgridview>
        <asp:accessdatasource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Categories]"></asp:accessdatasource>
    </div>
        <asp:accessdatasource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products] WHERE ([CategoryID] = ?)">
            <selectparameters>
                <asp:sessionparameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
            </selectparameters>
        </asp:accessdatasource>
       
        <dxcp:aspxcallbackpanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="panel" OnCallback="ASPxCallbackPanel1_Callback" LoadingPanelText="" ShowLoadingPanelImage="False">
            <panelcollection>
                <dxp:panelcontent runat="server">
                   <dxpc:aspxpopupcontrol ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" HeaderText="Customers" Modal="True">
            <contentcollection>
                <dxpc:popupcontrolcontentcontrol runat="server">
                    <dxe:aspxcombobox ID="ASPxComboBox1" runat="server" DataSourceID="AccessDataSource3"
                        ValueType="System.String" ClientInstanceName="combobox" TextField="ShipName" ValueField="ShipName">
                    </dxe:aspxcombobox>
                    <asp:accessdatasource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/nwind.mdb"
                        SelectCommand="SELECT [ProductID], [ShipName], [ShipAddress], [ShipCity] FROM [Invoices] WHERE ([ProductID] = ?)">
                        <selectparameters>
                            <asp:sessionparameter Name="ProductID" SessionField="ProductID" Type="Int32" />
                        </selectparameters>
                    </asp:accessdatasource>
                </dxpc:popupcontrolcontentcontrol>
            </contentcollection>
        </dxpc:aspxpopupcontrol>
                </dxp:panelcontent>
            </panelcollection>
            <clientsideevents EndCallback="function(s, e) {
	popup.Show();
}" />
        </dxcp:aspxcallbackpanel>
      
    </form>
</body>
</html>
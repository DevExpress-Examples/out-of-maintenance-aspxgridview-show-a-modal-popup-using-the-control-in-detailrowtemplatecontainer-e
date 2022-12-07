Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web

Namespace DetailPopup
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub
		Protected Sub ASPxGridView2_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
			Session("CategoryID") = (CType(sender, ASPxGridView)).GetMasterRowKeyValue()
		End Sub

		Protected Sub ASPxGridView2_HtmlRowCreated(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
			If e.RowType = GridViewRowType.Data Then
				Dim val As String = e.GetValue("ProductID").ToString()
				Dim col As GridViewDataColumn = TryCast((CType(sender, ASPxGridView)).Columns("Template"), GridViewDataColumn)
				Dim bt As ASPxButton = TryCast((CType(sender, ASPxGridView)).FindRowCellTemplateControl(e.VisibleIndex, col, "ASPxButton2"), ASPxButton)
				bt.ClientInstanceName = "button" & e.VisibleIndex.ToString()
				Session("ProductID") = val
				bt.ClientSideEvents.Click = "function(s,e){panel.PerformCallback(" & val & "+';'+s.name); }"

			End If
		End Sub

		Protected Sub ASPxCallbackPanel1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)

			Dim pars() As String = e.Parameter.Split(";"c)
			Session("ProductID") = pars(0)
			ASPxComboBox1.DataBind()
			ASPxComboBox1.SelectedIndex = 0
			ASPxPopupControl1.PopupElementID = pars(1)

		End Sub

	End Class
End Namespace

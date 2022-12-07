using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

namespace DetailPopup
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["CategoryID"] = ((ASPxGridView)sender).GetMasterRowKeyValue();
        }
       
        protected void ASPxGridView2_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == GridViewRowType.Data)
            {
                string val = e.GetValue("ProductID").ToString();
                GridViewDataColumn col = ((ASPxGridView)sender).Columns["Template"] as GridViewDataColumn;
                ASPxButton bt = ((ASPxGridView)sender).FindRowCellTemplateControl(e.VisibleIndex, col, "ASPxButton2") as ASPxButton;
                bt.ClientInstanceName = "button" + e.VisibleIndex.ToString();
                Session["ProductID"] = val;
                bt.ClientSideEvents.Click = "function(s,e){panel.PerformCallback(" + val + "+';'+s.name); }";

            }
        }

        protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.CallbackEventArgsBase e)
        {

            string[] pars = e.Parameter.Split(';');
            Session["ProductID"] = pars[0];
            ASPxComboBox1.DataBind();
            ASPxComboBox1.SelectedIndex = 0;
            ASPxPopupControl1.PopupElementID = pars[1];

        }

    }
}

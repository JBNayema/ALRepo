pageextension 50026 SalesOrdSbFrmExt extends "Sales Order Subform"
{
    layout
    {
        modify("Unit Price")
        {
            visible = false;
        }
    }
}

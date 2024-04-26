pageextension 50027 ItemTrckSmrExt extends "Item Tracking Summary"
{
    layout
    {
        addafter("Lot No.")
        {
            field("Source Document Date"; Rec."Source Document Date")
            {
                Visible = true;
                ApplicationArea = All;
            }
        }
    }
}

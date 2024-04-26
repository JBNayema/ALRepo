pageextension 50032 "Location Card Ext" extends "Location Card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field("Tea Storage"; Rec."Tea Storage")
            {
                ApplicationArea = all;
                Editable = true;
            }
        }
    }
}

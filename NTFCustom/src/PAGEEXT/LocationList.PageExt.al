pageextension 50030 "Location Ext" extends "Location List"
{
    layout
    {
        addafter(Name)
        {
            field("Tea Storage"; Rec."Tea Storage")
            {
                ApplicationArea = all;
                Editable = true;
            }
        }
    }
}

pageextension 50014 PageExtension50014 extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter(Paid)
        {
            field("Applies-to Doc. No.19306";Rec."Applies-to Doc. No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Cancelled)
        {
            field("Applies-to Doc. No.82899";Rec."Applies-to Doc. No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

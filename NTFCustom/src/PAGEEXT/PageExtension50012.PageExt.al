pageextension 50012 PageExtension50012 extends "Posted Assembly Orders"
{
    layout
    {
        addafter("Item No.")
        {
            field(Reversed74748;Rec.Reversed)
            {
                ApplicationArea = All;
            }
            field(SystemCreatedBy31636;Rec.SystemCreatedBy)
            {
                ApplicationArea = All;
            }
        }
    }
}

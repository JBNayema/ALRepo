pageextension 50013 PageExtension50013 extends "Transfer Orders"
{

    layout
    {
        addafter("In-Transit Code")
        {

            field("Last Receipt No.60033"; Rec."Last Receipt No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Direct Transfer")
        {
            field("Has Shipped Lines92932"; Rec."Has Shipped Lines")
            {
                ApplicationArea = All;
            }
            field("Completely Shipped51937"; Rec."Completely Shipped")
            {
                ApplicationArea = All;
            }
            field(Comment60357; Rec.Comment)
            {
                ApplicationArea = All;
            }
            field("External Document No.68011"; Rec."External Document No.")
            {
                ApplicationArea = All;
            }

        }
    }

}

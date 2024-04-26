report 50001 "Undo Assembly Orders"
{
    ApplicationArea = All;
    Caption = 'Undo Assembly Orders';
    UsageCategory = Tasks;
    UseRequestPage = true;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ILE; "Item Ledger Entry")
        {
            RequestFilterFields = "Posting Date","Document No.";
            //  PrintOnlyIfDetail = true;

            trigger OnPreDataItem()
            begin
                ILE.SetRange("Entry Type", "Entry Type"::"Assembly Output");
                ILE.SetRange("Document Type", "Document Type"::"Posted Assembly");
                ILE.SetRange(Open, true);

            end;

            trigger OnAfterGetRecord()
            var
                PAH: Record "Posted Assembly Header";
                AssemblyPost: Codeunit "Assembly-Post";
            begin

                IF ILE."Remaining Quantity" = ILE.Quantity then begin
                    PAH.SetRange("No.", "Document No.");
                    pah.SetRange(Reversed, false);

                    IF Pah.FindFirst then
                        AssemblyPost.Undo(PAH, true);
                end;

            end;

        }

    }
}




page 50030 ResetAuction
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    // SourceTable = TableName;


    actions
    {
        area(Processing)
        {
            action(Auction)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Transfer: Codeunit TransferLocation;
                begin
                    Transfer.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}


codeunit 50003 TransferLocation
{
    trigger OnRun()
    var
        TransferHeader: record "Transfer Header";
    begin
        TransferHeader.RelocateInventory();
    end;






}
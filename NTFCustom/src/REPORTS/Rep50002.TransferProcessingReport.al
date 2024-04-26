report 50002 TransferProcessingReport
{
    ApplicationArea = All;
    Caption = 'TransferProcessingReport';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    UseRequestPage = true;
    dataset
    {
        dataitem(TransferHeader; "Transfer Header")
        {
            column(No; "No.")
            {
            }
            column(TransferfromCode; "Transfer-from Code")
            {
            }
            column(TransfertoCode; "Transfer-to Code")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(DirectTransfer; "Direct Transfer")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}

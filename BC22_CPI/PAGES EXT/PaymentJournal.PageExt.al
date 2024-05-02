pageextension 50101 PaymentJournalExt extends "Payment Journal"
{
    actions
    {
        modify(SuggestVendorPayments)
        {
            Visible = false;
        }
        addfirst("&Payments")
        {
            action(CPISuggestVendorPayments)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'CPI Suggest Vendor Payments';
                Ellipsis = true;
                Image = SuggestVendorPayments;
                ToolTip = 'Create payment suggestions as lines in the payment journal.';

                trigger OnAction()
                var
                    SuggestVendorPayments: Report "CPI Suggest Vendor Payments";
                begin
                    Clear(SuggestVendorPayments);
                    SuggestVendorPayments.SetGenJnlLine(Rec);
                    SuggestVendorPayments.RunModal();
                end;
            }
        }
    }

}

pageextension 50017 PaymentJournalExt extends "Payment Journal"
{
    actions
    {

        modify(SuggestVendorPayments)
        {
            Visible = TRUE;
        }
        addfirst("&Payments")
        {
            action(ExportElectronicPaymentACH)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Export Electronic Payment ACH';
                Ellipsis = true;
                Image = ExportFile;
                ToolTip = 'Export a file with the payment information on the journal lines.';
                trigger OnAction()
                var
                    RecFilters: Text;
                begin
                    rec.SetCurrentKey("Journal Template Name", "Recipient Bank Account");
                    Rec.SetRecFilter();
                    RecFilters := rec.GetFilters;
                    Report.run(11380, true, false, Rec);
                end;
            }

            action(CPISuggestVendorPayments)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'CPI Suggest Vendor Payments';
                Ellipsis = true;
                Image = SuggestVendorPayments;
                ToolTip = 'Create payment suggestions as lines in the payment journal.';

                trigger OnAction()
                var
                //SuggestVendorPayments: Report "CPI Suggest Vendor Payments";
                begin
                    // Clear(SuggestVendorPayments);
                    // SuggestVendorPayments.SetGenJnlLine(Rec);
                    // SuggestVendorPayments.RunModal();
                end;
            }
        }
    }
    var

}

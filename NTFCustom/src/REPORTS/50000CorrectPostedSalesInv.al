report 50000 CorrPostSalesInv
{
    ApplicationArea = All;
    Caption = 'Correct Posted Sales Invoice';
    ProcessingOnly = true;
    UseRequestPage = true;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.", "Posting Date";

            trigger OnAfterGetRecord()
            var
                CorrectiveCod: Codeunit "Correct Posted Sales Invoice";
                SalesHeader: Record "Sales Header";

            begin

                SalesInvoiceHeader.CalcFields("Amount Including VAT");
                SalesInvoiceHeader.CalcFields("Remaining Amount");
                IF ("Amount Including VAT" = "Remaining Amount") AND ("Amount Including VAT" <> 0) THEN //Unpaid
                begin
                    CorrectiveCod.CancelPostedInvoiceCreateNewInvoice(SalesInvoiceHeader, SalesHeader);

                    //     OnBeforeSalesHeaderInsert(SalesHeader, SalesInvoiceHeader, CancellingOnly); Event
                end;

            end;



        }

    }




}
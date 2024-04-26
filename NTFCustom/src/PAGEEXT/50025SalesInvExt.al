pageextension 50025 SalesInvExt extends "Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("CurrencyCode"; Rec."Currency Code")
            {
                Caption = 'Currency Code';
                ApplicationArea = all;
                Visible = true;

                trigger OnAssistEdit()
                begin
                    Clear(ChangeExchangeRate);
                    if Rec."Posting Date" <> 0D then
                        ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                    else
                        ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                    if ChangeExchangeRate.RunModal = ACTION::OK then begin
                        Rec."Currency Factor" := ChangeExchangeRate.GetParameter;
                        SaveInvoiceDiscountAmount;
                    end;
                    Clear(ChangeExchangeRate);

                end;


                trigger OnValidate()
                begin

                    CurrPage.Update();
                end;


            }
        }
        modify("Currency Code")

        {
            Visible = false;

        }
    }





    var
        ChangeExchangeRate: Page "Change Exchange Rate";



    local procedure SaveInvoiceDiscountAmount()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord;
        DocumentTotals.SalesRedistributeInvoiceDiscountAmountsOnDocument(Rec);
        CurrPage.Update(false);
    end;


}

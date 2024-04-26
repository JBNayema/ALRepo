reportextension 50005 RemittanceExt extends "Remittance Advice - Journal"
{
    dataset
    {

        add(VendLoop)
        {

            column(RemittanceAdviceNoCaption; RemittanceAdviceNoCaption)
            {

            }
            column(AmountPaidCap; AmountPaidCap)
            {

            }
            column(PaymentDateCap; PaymentDateCap)
            {

            }
            column(DocTypeCap; DocTypeCap)
            {

            }
            column(DocNoCap; DocNoCap)
            {

            }
            column(DocDateCap; DocDateCap)
            {

            }
            column(AmountDueCap; AmountDueCap)
            {

            }
            column(DiscTakenCap; DiscTakenCap)
            {

            }
            column(DepositAmountCap; DepositAmountCap)
            {

            }
            column(Posting_Date; format("Gen. Journal Line"."Posting Date"))
            {

            }
            Column(New_Doc_Type; "Gen. Journal Line"."Document Type")
            {

            }
            column(New_Doc_Date; format("Gen. Journal Line"."Document Date"))
            {

            }
            column(AmountDue; AmountDuee)
            {

            }
            column(Discount; vendledg."Pmt. Disc. Rcd.(LCY)")
            {

            }
            column(AmountPaidCpt; amountpaidcpt)
            {

            }
            column(Email; CompEmail)
            {

            }
            column(phoneno; compinfo."Phone No.")
            {

            }
            column(website; compHomepage)
            {

            }


        }


    }


    rendering
    {

        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './layout/RemittanceAdvice.rdl';
        }
    }
    trigger OnPreReport()
    begin
        compInfo.get;
        CompEmail := compInfo."E-Mail";
        CompHomePage := compInfo."Home Page";
    end;


    var
        RemittanceAdviceNoCaption: Label 'Remittance Advice Number:';
        AmountPaidCap: Label 'Amount Paid:';
        PaymentDateCap: Label 'Settlement Date';
        DocTypeCap: Label 'Document Type';
        DocNoCap: Label 'Document No.';
        DocDateCap: Label 'Document Date';
        AmountDueCap: Label 'Amount Due';
        DiscTakenCap: Label 'Discount Taken';
        DepositAmountCap: Label 'Deposit Amount';
        VendLedg: Record "Vendor Ledger Entry";
        AmountPaidCpt: decimal;
        AmountDuee: Decimal;
        compInfo: Record "Company Information";
        CompEmail: Text[80];
        CompHomePage: Text[80];
        SalesDocTest: Report "Sales Document - Test";
}
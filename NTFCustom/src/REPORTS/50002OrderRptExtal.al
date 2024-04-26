reportextension 50002 "50002OrderRptExt.al" extends "Order"
{
    dataset
    {


        add(CopyLoop)
        {


            column(Picture; CompInfo.Picture)
            {

            }


        }

        add("Purchase Header")
        {

            column(PurchaseOrderCpt; PurchaseOrderCpt)
            {

            }
            column(PurchOrder; PurchOrder)
            {

            }
            column(Posting_Date; Format("Purchase Header"."Posting Date"))
            {

            }
            column(Assigned_User_ID; "Assigned User ID")
            {

            }
            column(CertifiedBy; CertifiedBy)
            {

            }
            column(CertifiedbyDate; CertifiedByDate)
            {

            }
            column(CertifiedSignature; CertifiedSignature)
            {

            }
            column(ReceivedBy; ReceivedBy)
            {

            }
            column(ReceivedBySign; ReceivedBySign)
            {

            }
            column(RecievedByDate; RecievedByDate)
            {

            }
            column(AuthorisedBy; AuthorisedBy)
            {

            }
            column(AuthorisedByDate; AuthorisedByDate)
            {

            }
            column(AuthorisedSign; AuthorisedSign)
            {

            }
            column(PreparedBy; PreparedBy)
            {

            }
            column(PreparedByDate; PreparedByDate)
            {

            }
            column(PreparedByDets; ApprovalEntry."Sender ID")
            {


            }
            column(ApprovedByDets; ApprovalEntry."Approver ID")
            {

            }

        }

    }
    rendering
    {

        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './layout/Order.rdl';
        }
    }
    trigger OnPreReport()
    begin


        CompInfo.Get;
        CompInfo.CalcFields(Picture);

    end;




    var
        CompInfo: Record "Company Information";
        Test: Report "Standard Sales - Invoice";
        PurchaseOrderCpt: Label 'Purchase Order';
        PurchOrder: Label 'Purchase Order No.';
        CertifiedbyDate: Label 'Date:';
        RecievedByDate: Label 'Date:';
        AuthorisedByDate: Label 'Date:';
        CertifiedBy: Label 'Certified By:';
        AuthorisedBy: Label 'Authorised By:';
        ReceivedBy: Label 'Received By:';
        CertifiedSignature: Label 'Signature:';
        AuthorisedSign: Label 'Signature:';
        ReceivedBySign: Label 'Signature:';
        PreparedBy: Label 'Prepared By:';
        PreparedByDate: Label 'Date:';
        ApprovalEntry: Record "Approval Entry";



}

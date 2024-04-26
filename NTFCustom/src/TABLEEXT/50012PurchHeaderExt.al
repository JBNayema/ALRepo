tableextension 50012 PurchHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50001; NextApprover; Code[50])
        {
            Caption = 'Next Approver';
            CalcFormula = lookup("Approval Entry"."Approver ID" where("Document No." = field("No."), Status = const(Open)));

            Fieldclass = FlowField;
            TableRelation = "Approval Entry"."Approver ID" where("Document No." = field("No."), Status = const(Open));


        }



    }

    // consider inserting this trigger on he status field


}

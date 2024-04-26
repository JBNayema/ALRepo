tableextension 50001 AssemblyLineTableExt extends "Assembly Line"
{
    fields
    {
        field(50000; "Lot No."; Code[20])
        {
            Caption = 'Lot No';
            FieldClass = FlowField;
            CalcFormula = lookup("Reservation Entry"."Lot No." where("Source Ref. No." = field("Line No."),
                                "Source ID" = field("Document No.")));

            Editable = false;


        }
    }
}

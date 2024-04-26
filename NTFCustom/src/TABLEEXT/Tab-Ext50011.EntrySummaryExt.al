tableextension 50011 EntrySummaryExt extends "Entry Summary"
{
    fields
    {
        field(50001; "Source Document Date"; Date)
        {
            Caption = 'Source Document Date';
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Lot No." = field("Lot No."), "Entry Type" = const("Assembly Output")));
            FieldClass = FlowField;
        }
    }



}

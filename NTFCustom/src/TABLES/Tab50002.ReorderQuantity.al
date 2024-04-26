table 50002 "Reorder Quantity"
{
    Caption = 'Reorder Quantity';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No"; Code[20])
        {
            Caption = 'Item No';
            DataClassification = tobeclassified;
            Editable = false;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; LocationTo; code[10])
        {
            Caption = 'Location To';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(4; QuantityAtLocation; Decimal)
        {
            Caption = 'Quantity at Location';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No"), "Location Code" = FIELD(LocationTo)));
        }
        field(5; ReorderLevel; Decimal)
        {
            Caption = 'Reorder Level';
            Editable = true;
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Item No", LocationTo)
        {
            Clustered = true;
        }
    }
    var
        Location: Record "Item";



}

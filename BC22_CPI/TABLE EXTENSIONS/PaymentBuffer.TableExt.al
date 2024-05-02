tableextension 50102 "CPI Payment Buffer" extends "Payment Buffer"
{
    fields
    {
        field(50100; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50101; ExtDocNo; code[35])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;
        }
    }
}

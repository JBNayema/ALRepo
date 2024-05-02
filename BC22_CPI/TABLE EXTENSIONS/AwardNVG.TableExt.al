tableextension 50100 "AwardNVG" extends "Award NVG"
{
    fields
    {
        field(50000; "Funder Type Code"; Code[10])
        {
            Caption = 'Funder Type Code';
            DataClassification = ToBeClassified;
        }
        field(50001; "Pass Through"; Boolean)
        {
            Caption = 'Pass Through';
            DataClassification = ToBeClassified;
        }
        field(50002; "VAT Reporting Required"; Boolean)
        {
            Caption = 'VAT Reporting Required';
            DataClassification = ToBeClassified;
        }
        field(50003; "Field Office"; Code[20])
        {
            Caption = 'Field Office';
            DataClassification = ToBeClassified;
        }
        field(50004; "Field Finance"; Text[100])
        {
            Caption = 'Field Finance';
            DataClassification = ToBeClassified;
        }
        field(50005; "Finance Officer"; Text[100])
        {
            Caption = 'Finance Officer';
            DataClassification = ToBeClassified;
        }
        field(50006; "Chief of Party"; Text[100])
        {
            Caption = 'Chief of Party';
            DataClassification = ToBeClassified;
        }
        field(50007; "Program Director"; Text[100])
        {
            Caption = 'Program Director';
            DataClassification = ToBeClassified;
        }
        field(50008; "HQ Backstopper 1"; Text[100])
        {
            Caption = 'HQ Backstopper 1';
            DataClassification = ToBeClassified;
        }
        field(50009; "HQ Backstopper 2"; Text[100])
        {
            Caption = 'HQ Backstopper 2';
            DataClassification = ToBeClassified;
        }
        field(50010; "GC&C Manager"; Text[100])
        {
            Caption = 'GC&C Manager';
            DataClassification = ToBeClassified;
        }
        field(50011; "Agreement Officer Name"; Text[100])
        {
            Caption = 'Agreement Officer Name';
            DataClassification = ToBeClassified;
        }
        field(50012; "Agreement Officer Email"; Text[100])
        {
            Caption = 'Agreement Officer Email';
            DataClassification = ToBeClassified;
        }
        field(50013; "Agreement Officer Rep Name"; Text[100])
        {
            Caption = 'Agreement Officer Rep Name';
            DataClassification = ToBeClassified;
        }
        field(50014; "Agreement Officer Rep Email"; Text[100])
        {
            Caption = 'Agreement Officer Rep Email';
            DataClassification = ToBeClassified;
        }
        field(50015; "Indirect Cost Recovery Code 2"; Code[10])
        {
            Caption = 'Indirect Cost Recovery Code 2';
            DataClassification = ToBeClassified;
        }
        field(50016; "IDC Provisional Code"; Code[10])
        {
            Caption = 'IDC Provisional Code';
            DataClassification = ToBeClassified;
        }
        field(50017; "IDC Provisional Code 2"; Code[10])
        {
            Caption = 'IDC Provisional Code 2';
            DataClassification = ToBeClassified;
        }
        field(50018; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
        }
        field(50019; "Cost Share"; Decimal)
        {
            Caption = 'Cost Share';
            DataClassification = ToBeClassified;
        }
    }
}

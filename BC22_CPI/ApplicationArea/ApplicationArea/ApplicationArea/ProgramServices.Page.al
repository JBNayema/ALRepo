page 50100 "Program Services"
{
    ApplicationArea = All;
    Caption = 'Program Services';
    PageType = List;
    SourceTable = "Program Services";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}

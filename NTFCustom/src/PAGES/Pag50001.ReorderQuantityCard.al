page 50001 "Reorder Quantity Card"
{
    Caption = 'Reorder Quantity Card';
    PageType = Card;
    SourceTable = "Reorder Quantity";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(LocationTo; Rec.LocationTo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location To field.';
                }
                field(QuantityAtLocation; Rec.QuantityAtLocation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity at Location field.';
                }
                field(ReorderLevel; Rec.ReorderLevel)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reorder Level field.';
                }
            }
        }
    }
}

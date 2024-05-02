page 50103 AccScheduleLineWS
{
    ApplicationArea = All;
    Caption = 'AccScheduleLine WS';
    PageType = List;
    SourceTable = "Acc. Schedule Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Schedule Name"; Rec."Schedule Name")
                {
                    ApplicationArea = all;
                }

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                    // Visible = false;
                }
                field("Row No."; Rec."Row No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Totaling; Rec.Totaling)
                {
                    ApplicationArea = all;
                }
                field("Totaling Type"; Rec."Totaling Type")
                {
                    ApplicationArea = all;
                }
                field("New Page"; Rec."New Page")
                {
                    ApplicationArea = all;
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = all;
                }
                field(Show; Rec.Show)
                {
                    ApplicationArea = all;
                }
                field("Dimension 1 Totaling"; Rec."Dimension 1 Totaling")
                {
                    ApplicationArea = all;
                }
                field("Dimension 2 Totaling"; Rec."Dimension 2 Totaling")
                {
                    ApplicationArea = all;
                }
                field("Dimension 3 Totaling"; Rec."Dimension 3 Totaling")
                {
                    ApplicationArea = all;
                }
                field("Dimension 4 Totaling"; Rec."Dimension 4 Totaling")
                {
                    ApplicationArea = all;
                }
                field(Bold; Rec.Bold)
                {
                    ApplicationArea = all;
                }
                field(Italic; Rec.Italic)
                {
                    ApplicationArea = all;
                }
                field(Underline; Rec.Underline)
                {
                    ApplicationArea = all;
                }
                field("Double Underline"; Rec."Double Underline")
                {
                    ApplicationArea = all;
                    // Visible = false;
                }
                field("Show Opposite Sign"; Rec."Show Opposite Sign")
                {
                    ApplicationArea = all;
                }
                field("Row Type"; Rec."Row Type")
                {
                    ApplicationArea = all;
                }
                field("Amount Type"; Rec."Amount Type")
                {
                    ApplicationArea = all;
                }
                field("Company Name"; Rec."Company Name NVG")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type RowFilter"; Rec."Transaction Type RowFilter NVG")
                {
                    ApplicationArea = all;
                }
                field("Budget Plan RowFilter"; Rec."Budget Plan RowFilter NVG")
                {
                    ApplicationArea = all;
                }
                field("Fund Type RowFilter"; Rec."Fund Type RowFilter NVG")
                {
                    ApplicationArea = all;
                }
                field("Fund Class RowFilter"; Rec."Fund Class RowFilter NVG")
                {
                    ApplicationArea = all;
                }
                field("Fund RowFilter"; Rec."Fund RowFilter NVG")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 RowFilter"; Rec."Global Dim. 1 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Global Dimension 2 RowFilter"; Rec."Global Dim. 2 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Global Dimension 3 RowFilter"; Rec."Global Dim. 3 RowFilter NVG")
                {
                    // Visible = true;
                }
                field("Global Dimension 4 RowFilter"; Rec."Global Dim. 4 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Global Dimension 5 RowFilter"; Rec."Global Dim. 5 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Global Dimension 6 RowFilter"; Rec."Global Dim. 6 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Global Dimension 7 RowFilter"; Rec."Global Dim. 7 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Global Dimension 8 RowFilter"; Rec."Global Dim. 8 RowFilter NVG")
                {
                    ApplicationArea = all;
                    // Visible = true;
                }
                field("Dimension Speedkey Code"; Rec."Dimension Speedkey Code NVG")
                {
                    ApplicationArea = all;
                }
                field("Closing Entry filter"; Rec."Closing Entry filter")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

}

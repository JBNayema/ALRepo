page 50022 "Tea Production Activites"
{
    Caption = 'Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;
    SourceTable = "Activities Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Tea Production")
            {
                field("Green Leaf Received Today"; Rec."Green Leaf Received Today")
                {
                    ApplicationArea = All;
                }
                field("Green Leaf Received-month"; Rec."Green Leaf Received-month")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;

                }
                field("Green Leaf Received-YTD"; Rec."Green Leaf Received-YTD")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;

                }

                field("Produced Tea Month"; Rec."Produced Tea - Month")
                {
                    ApplicationArea = All;
                }
                field("Produced Tea - YTD"; Rec."Produced Tea - YTD")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                }

                field("Packed Tea Today"; Rec."Packed Tea Today")
                {
                    ApplicationArea = All;
                }
                field("Packed Tea-month"; Rec."Packed Tea-month")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;
                }
                field("Dispatch To Packers"; Rec."Dispatch To Packers - Today")
                {
                    ApplicationArea = All;
                }
                field("Dispatch To Packers-month"; Rec."Dispatch To Packers-month")
                {
                    ApplicationArea = All;
                    // Caption = ''
                    Visible = true;
                    Enabled = true;
                }
                field("Dispatch To Packers-YTD"; Rec."Dispatch To Packers-YTD")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Dispatch To Auction"; Rec."Dispatch To Auction")
                {
                    ApplicationArea = All;
                }
                field("Dispatch To Auction-month"; Rec."Dispatch To Auction-month")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Enabled = true;

                }
                field("Made Tea Percentage"; Rec."Made Tea Percentage")
                {
                    Caption = 'Made Tea % - Month';
                    AutoFormatType = 10;
                    // AutoFormatExpression = '<precision, 2:4><standard format,0>%';
                    ApplicationArea = all;
                }
                field("Made Tea YTD"; Rec."Made Tea YTD")
                {
                    Caption = 'Made Tea % - YTD';
                    AutoFormatType = 10;
                    ApplicationArea = all;

                }
                field("Produced Tea - Today"; Rec."Produced Tea - Today")
                {
                    Caption = 'Produced Tea - Today';
                    AutoFormatType = 10;
                    ApplicationArea = all;

                }
            }
        }

    }
    actions
    {

    }

    var
        myInt: Integer;

    trigger OnOpenPage();
    begin

        // RESET;
        // IF NOT GET THEN BEGIN
        //     INIT;
        //     INSERT;
        // END;
        // Rec.SETRANGE("Prod. Date Filter", WORKDATE - 1);
        // // SETFILTER("Date Filter2", '>=%1', WORKDATE);

        // // Rec."Due Date Filter" := WorkDate();

        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;

        Rec.SETRANGE("Prod. Date Filter", WORKDATE - 1);
        StartDate := CalcDate('<-CM>', WorkDate);
        // EndDate := CalcDate('<CM>', Givendate);
        // SETFILTER("Date Filter2", '>=%1', WORKDATE);
        Rec.SetFilter("Month Date Filter", '%1..%2', StartDate, WorkDate);



    end;

    trigger OnAfterGetRecord()
    begin
        //  Rec."Green Leaf Received-month" := NTFCustom.CalculateGreenLeaf;
        //  Rec."Packed Tea-month" := NTFCustom.CalculatePackedTea;
        //  Rec."Dispatch To Packers-month" := NTFCustom.CalculateDispatchToPacker;
        //  Rec."Dispatch To Auction-month" := NTFCustom.CalculateDispatchToAuction;

        Rec."Green Leaf Received-month" := NTFCustom.CalculateGreenLeaf;
        Rec."Packed Tea-month" := NTFCustom.CalculatePackedTea;
        //  Rec."Dispatch To Packers-month" := NTFCustom.CalculateDispatchToPacker;
        //  Rec."Dispatch To Auction-month" := NTFCustom.CalculateDispatchToAuction;
        Rec."Green Leaf Received-YTD" := NTFCustom.CalculateGreenLeafYTD;
        Rec."Produced Tea - YTD" := NTFCustom.CalculatePackedTeaYTD;
        // Rec."Dispatch To Packers-YTD":= NTFCustom.CalculateDispatchToPackerYTD;
    end;

    trigger OnInit()
    var
        Checklist: Codeunit Checklist;
    begin
        if Checklist.IsChecklistVisible() then begin
            Checklist.SetChecklistVisibility(false);
        end;
    end;


    var
        NTFCustom: Codeunit NTFCustom;
        StartDate: date;
        FiscalStart: Date;

}
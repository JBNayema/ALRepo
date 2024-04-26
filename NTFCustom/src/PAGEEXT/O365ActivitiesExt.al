pageextension 50020 ProductionDashboard extends "O365 Activities"
{

    layout
    {
        // Add changes to page layout here

        addbefore("Sales This Month")
        {
            field("Green Leaf Received Today"; Rec."Green Leaf Received Today")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
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

            field("Produced Tea - Today"; Rec."Produced Tea - Today")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
            }
            field("Produced Tea Month"; Rec."Produced Tea - Month")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
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
                Visible = true;
                Enabled = true;
            }
            field("Packed Tea-month"; Rec."Packed Tea-month")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
            }
            field("Packed Tea YTD"; Rec."Packed Tea YTD")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
            }
            field("Dispatch To Packers - Today"; Rec."Dispatch To Packers - Today")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
                DrillDown = true;
                DrillDownPageId = "Posted Transfer shipment Lines";
            }
            field("Dispatch To Packers-month"; Rec."Dispatch To Packers-month")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
                DrillDown = true;
                DrillDownPageId = "Posted Transfer shipment Lines";

            }
            field("Dispatch To Packers-YTD"; Rec."Dispatch To Packers-YTD")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
                DrillDown = true;
                DrillDownPageId = "Posted Transfer shipment Lines";
            }
            field("Dispatch To Auction"; Rec."Dispatch To Auction")
            {
                Caption = 'Dispatch To Auction - Today';
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
                DrillDown = true;
                DrillDownPageId = "Posted Transfer shipment Lines";
            }
            field("Dispatch To Auction-month"; Rec."Dispatch To Auction-month")
            {
                ApplicationArea = All;
                Visible = true;
                Enabled = true;
                DrillDown = true;
                DrillDownPageId = "Posted Transfer shipment Lines";

            }
            field("Dispatch To Auction- YTD"; Rec."Dispatch To Auction- YTD")
            {
                ApplicationArea = all;
                Visible = true;
                Enabled = true;
                DrillDown = true;
                DrillDownPageId = "Posted Transfer Shipment Lines";
            }
            field("Made Tea Percentage"; Rec."Made Tea Percentage")
            {
                Caption = 'Made Tea % - Month';
                AutoFormatType = 10;
                // AutoFormatExpression = '<precision, 2:4><standard format,0>%';
                ApplicationArea = all;
                Enabled = true;
            }
            field("Made Tea YTD"; Rec."Made Tea YTD")
            {
                Caption = 'Made Tea % - YTD';
                AutoFormatType = 10;
                ApplicationArea = all;
                Enabled = true;

            }
            field(DueNextWeeK; Rec."Sales Invoices Due Next Week")
            {
                Caption = 'Sales Invoices Due Next Week';
                Visible = Visibility;
                Enabled = true;
            }
            field("Outturn Ratio"; Rec."Outturn Ratio")
            {
                Caption = 'Outturn Ratio % - Month';
                Visible = true;
                Enabled = true;
            }


        }
        modify("Sales This Month")
        {
            Visible = Visibility;
        }
        modify("Overdue Sales Invoice Amount")
        {
            Visible = Visibility;
        }
        modify("Overdue Purch. Invoice Amount")
        {
            visible = Visibility;
        }
        MODIFY("Ongoing Sales")
        {
            Visible = Visibility;
        }
        modify("Ongoing Purchases")
        {
            Visible = Visibility;
        }
        modify(Payments)
        {
            Visible = Visibility;
        }
        modify("Incoming Documents")
        {
            Visible = Visibility;
        }
        modify(Camera)
        {
            Visible = Visibility;
        }




    }

    actions
    {
        // Add changes to page actions here
    }



    trigger OnOpenPage();
    var

        NTFSession: SessionSettings;
        ProfileID: Text;



    begin
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;

        StartDate := CalcDate('<-CM>', WorkDate);
        FiscalStart := NTFCustom.GetAccPeriodStart;

        Rec.SETRANGE("Prod. Date Filter", WORKDATE - 1);
        Rec.SetFilter("Month Date Filter", '%1..%2', StartDate, WorkDate);
        Rec.SetFilter("YTD Date Filter", '%1..%2', FiscalStart, WorkDate());



        ProfileID := 'NTFMFGROLE';
        NTFSession.Init();
        if (NTFSession.ProfileId = ProfileID) then begin
            Visibility := false;

        end
        ELSE
            if (NTFSession.ProfileId <> ProfileID) then begin
                Visibility := true;
            end;







    end;


    trigger OnAfterGetRecord()

    begin
        Rec.Reset();

        StartDate := CalcDate('<-CM>', WorkDate);
        FiscalStart := NTFCustom.GetAccPeriodStart;

        Rec.SETRANGE("Prod. Date Filter", WORKDATE - 1);
        Rec.SetFilter("Month Date Filter", '%1..%2', StartDate, WorkDate);
        Rec.SetFilter("YTD Date Filter", '%1..%2', FiscalStart, WorkDate());
        REC.Get();

        Rec."Made Tea Percentage" := Rec.CalculateMadeTea;
        Rec."Made Tea YTD" := Rec.CalculateMadeTeaYTD;
        Rec."Outturn Ratio" := rec.OutTurnCalculation();

        currpage.Update(true);


    end;






    var
        NTFCustom: Codeunit NTFCustom;
        StartDate: date;
        YearDate: Date;// Fiscal Year Start
        Visibility: Boolean;
        FiscalStart: Date;
        Activities: Page "O365 Activities";
        producedToday: DECIMAL;









}
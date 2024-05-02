page 50102 AwardListWS
{
    // ApplicationArea = All;
    Caption = 'AwardListWS';
    PageType = List;
    SourceTable = "Award NVG";
    Editable = false;

    // 'Data Warehouse Web service List';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = all;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = all;
                }
                field("Award Dimension No."; Rec."Award Dimension No.")
                {
                    ApplicationArea = all;
                }
                field("Award Dimension Code"; Rec."Award Dimension Code")
                {
                    ApplicationArea = all;
                }
                field("Award Dimension Value"; Rec."Award Dimension Value")
                {
                    ApplicationArea = all;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = all;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = all;
                }
                field(Phase; Rec.Phase)
                {
                    ApplicationArea = all;
                }
                field("Indirect Cost Rate"; Rec."Indirect Cost Rate")
                {
                    ApplicationArea = all;
                }
                field("AV Posting Group NVG"; Rec."AV Posting Group NVG")
                {
                    ApplicationArea = all;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = all;
                }
                field("Fiscal Year Start Date"; Rec."Fiscal Year Start Date")
                {
                    ApplicationArea = all;
                }
                field("Allow Posting From"; Rec."Allow Posting From")
                {
                    ApplicationArea = all;
                }
                field("Allow Posting To"; Rec."Allow Posting To")
                {
                    ApplicationArea = all;
                }
                field("Next Revision No."; Rec."Next Revision No.")
                {
                    ApplicationArea = all;
                }
                field("Award Probability"; Rec."Award Probability")
                {
                    ApplicationArea = all;
                }
                field("Restriction Checking"; Rec."Restriction Checking")
                {
                    ApplicationArea = all;
                }
                field("Sponsoring Funder No."; Rec."Sponsoring Funder No.")
                {
                    ApplicationArea = all;
                }
                field("Funder's Reference No."; Rec."Funder's Reference No.")
                {
                    ApplicationArea = all;
                }
                field("Publication Code"; Rec."Publication Code")
                {
                    ApplicationArea = all;
                }
                field("Publication Page No."; Rec."Publication Page No.")
                {
                    ApplicationArea = all;
                }
                field("Process Clearance"; Rec."Process Clearance")
                {
                    ApplicationArea = all;
                }
                field("Matching Required"; Rec."Matching Required")
                {
                    ApplicationArea = all;
                }
                field("Allow Matching Excess"; Rec."Allow Matching Excess")
                {
                    ApplicationArea = all;
                }
                field("Matching Award Rate Code"; Rec."Matching Award Rate Code")
                {
                    ApplicationArea = all;
                }
                field("Estimate Date"; Rec."Estimate Date")
                {
                    ApplicationArea = all;
                }
                field("Awarded Date"; Rec."Awarded Date")
                {
                    ApplicationArea = all;
                }
                field("Not Awarded Date"; Rec."Not Awarded Date")
                {
                    ApplicationArea = all;
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = all;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = all;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = all;
                }
                field("Inter-Company Name"; Rec."Inter-Company Name")
                {
                    ApplicationArea = all;
                }
                field("Source Company Name"; Rec."Source Company Name")
                {
                    ApplicationArea = all;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field("Fund Class Code"; Rec."Fund Class Code")
                {
                    ApplicationArea = all;
                }
                field("Parent No."; Rec."Parent No.")
                {
                    ApplicationArea = all;
                }
                field("Proposal No."; Rec."Proposal No.")
                {
                    ApplicationArea = all;
                }
                field("Originating Funder No."; Rec."Originating Funder No.")
                {
                    ApplicationArea = all;
                }
                field("Line Item Flexibility %"; Rec."Line Item Flexibility %")
                {
                    ApplicationArea = all;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("Monitoring Requirement"; Rec."Monitoring Requirement")
                {
                    ApplicationArea = all;
                }
                field("Subaward Clearance Threshold"; Rec."Subaward Clearance Threshold")
                {
                    ApplicationArea = all;
                }
                field("Allocation No."; Rec."Allocation No.")
                {
                    ApplicationArea = all;
                }
                field("Fund No."; Rec."Fund No.")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 4 Code"; Rec."Global Dimension 4 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 5 Code"; Rec."Global Dimension 5 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 6 Code"; Rec."Global Dimension 6 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 7 Code"; Rec."Global Dimension 7 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 8 Code"; Rec."Global Dimension 8 Code")
                {
                    ApplicationArea = all;
                }
                field("Dimension Speedkey Code"; Rec."Dimension Speedkey Code")
                {
                    ApplicationArea = all;
                }
                field("Internal Control No."; Rec."Internal Control No.")
                {
                    ApplicationArea = all;
                }
                field("CFDA Number"; Rec."CFDA Number")
                {
                    ApplicationArea = all;
                }
                field("Appropriation Number"; Rec."Appropriation Number")
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = all;
                }
                field("Indirect Cost Recovery Code"; Rec."Indirect Cost Recovery Code")
                {
                    ApplicationArea = all;
                }
                field("Revenue Recognition Code"; Rec."Revenue Recognition Code")
                {
                    ApplicationArea = all;
                }
                field("Invoice Rule Code"; Rec."Invoice Rule Code")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

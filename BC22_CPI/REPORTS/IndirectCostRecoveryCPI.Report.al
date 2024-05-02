report 50102 "Indirect Cost Recovery CPI"
{
    // Serenic Navigator - (c)Copyright Serenic Software, Inc. 1999-2013.
    // By opening this object you acknowledge that this object includes confidential information
    // and intellectual property of Serenic Software, Inc., and that this work is protected by US
    // and international copyright laws and agreements.
    // ------------------------------------------------------------------------------------------
    // 
    // ------------Addition of IDC 2 option
    // 
    // SelectRuleCode
    DefaultLayout = RDLC;
    RDLCLayout = './Layout/IDCRecoveryPTE.rdl';


    Caption = 'IDC Recovery Generation - CPI';
    ProcessingOnly = false;
    UsageCategory = Tasks;
    ApplicationArea = All;


    dataset
    {
        dataitem(Award; "Award NVG")
        {
            DataItemTableView = WHERE(Blocked = FILTER(<> All),
                                      "Document Type" = CONST(Award));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Indirect Cost Recovery Code", "Indirect Cost Recovery Code 2", Type, Class;
            column(Indirect_Cost_Allocation_; 'Indirect Cost Allocation')
            {
            }
            column(STRSUBSTNO__For_Month_Ending___1__2__3__DATE2DMY_PostingDate_2__DATE2DMY_PostingDate_1__DATE2DMY_PostingDate_3__; STRSUBSTNO('For Month Ending: %1/%2/%3', DATE2DMY(PostingDate, 2), DATE2DMY(PostingDate, 1), DATE2DMY(PostingDate, 3)))
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(TIME; TIME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(NavigatorManagement_GetUserID; USERID)
            {
            }
            column(Award__No__; "No.")
            {
            }
            column(Award_Name; Name)
            {
            }
            column(Award__Indirect_Cost_Recovery_Code_; SelectRuleCode)
            {
            }
            column(BaseAmountTotal; BaseAmountTotal)
            {
            }
            column(RuleAmountTotal; RuleAmountTotal)
            {
            }
            column(LimitAmountTotal; LimitAmountTotal)
            {
            }
            column(RulePriorPostingsTotal; RulePriorPostingsTotal)
            {
            }
            column(AmountToPostTotal; AmountToPostTotal)
            {
            }
            column(Report_Total_; 'Report Total')
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Amount_To_PostCaption; Amount_To_PostCaptionLbl)
            {
            }
            column(Limit_AmountCaption; Limit_AmountCaptionLbl)
            {
            }
            column(Amount_CalculatedCaption; Amount_CalculatedCaptionLbl)
            {
            }
            column(RateCaption; RateCaptionLbl)
            {
            }
            column(Rate_CodeCaption; Rate_CodeCaptionLbl)
            {
            }
            column(Source_AmountCaption; Source_AmountCaptionLbl)
            {
            }
            column(Rule_CodeCaption; Rule_CodeCaptionLbl)
            {
            }
            column(Award_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Award__No__Caption; FIELDCAPTION("No."))
            {
            }
            column(Prior_Amt__PostedCaption; Prior_Amt__PostedCaptionLbl)
            {
            }
            column(IDC_Code; IDCCode)
            {
            }
            dataitem("Award Rule Line NVG"; "Award Rule Line NVG")
            {

                DataItemTableView = SORTING("Award Rule No.", "Line Type", "Line No.")
                                    WHERE("Line Type" = CONST(Rates));
                PrintOnlyIfDetail = true;
                column(AmountToPost; AmountToPost)
                {
                }
                column(RulePriorPostings; RulePriorPostings)
                {
                }
                column(RuleAmount; RuleAmount)
                {
                }
                column(BaseAmount; BaseAmount)
                {
                }
                column(Award_Total_; 'Award Total')
                {
                }
                column(DisplayTotal; (COUNT = AwardRuleLineCounter) AND (LineDistributionBufferRates.COUNT = AwardRuleLineDetailCounter))
                {
                }
                column(AmountToPostGroupTotal; AmountToPostGroupTotal)
                {
                }
                column(RulePriorPostingsGroupTotal; RulePriorPostingsGroupTotal)
                {
                }
                column(RuleAmountGroupTotal; RuleAmountGroupTotal)
                {
                }
                column(BaseAmountGroupTotal; BaseAmountGroupTotal)
                {
                }
                column(Award_Rule_Line_Award_Rule_No_; "Award Rule Line NVG"."Award Rule No.")
                {
                }
                column(Award_Rule_Line_Line_Type; "Line Type")
                {
                }
                column(Award_Rule_Line_Line_No_; "Line No.")
                {
                }
                dataitem(Integer; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    column(Award_Rule_Line___Document_No__; "Award Rule Line NVG"."Document No.")
                    {
                    }
                    column(BaseAmount_Control1102602037; BaseAmount)
                    {
                    }
                    column(RuleRate; RuleRate)
                    {
                    }
                    column(RuleAmount_Control1102602039; RuleAmount)
                    {
                    }
                    column(LimitAmount; LimitAmount)
                    {
                    }
                    column(RulePriorPostings_Control1102602041; RulePriorPostings)
                    {
                    }
                    column(AmountToPost_Control1102602042; AmountToPost)
                    {
                    }
                    column(BlankLimit; BlankLimit)
                    {
                    }
                    column(DimText; DimText)
                    {
                    }
                    column(Integer_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF Number = 1 THEN
                            LineDistributionBufferRates.FINDSET(FALSE, FALSE)
                        ELSE
                            LineDistributionBufferRates.NEXT;

                        IF RuleRate = 0 THEN
                            BaseAmount := 0
                        ELSE BEGIN
                            LineDistributionBufferSource.RESET;
                            LineDistributionBufferSource.SETRANGE("Internal Control No.", LineDistributionBufferRates."Internal Control No.");
                            IF LineDistributionBufferSource.FINDFIRST THEN
                                BaseAmount := LineDistributionBufferSource.Amount;
                        END;
                        RuleAmount := LineDistributionBufferRates.Amount;
                        RulePriorPostings := LineDistributionBufferRates.Percent;
                        //TBL1.01
                        IF Number = 1 THEN
                            SaveBlankLimit := BlankLimit;
                        IF Number > 1 THEN
                            BlankLimit := SaveBlankLimit;
                        //LimitAmountText := '';
                        //============
                        IF NOT BlankLimit THEN BEGIN
                            LimitAmount := CalculateLimit("Award Rule Line NVG", LineDistributionBufferRates);
                        END;

                        IF (RuleAmount <= LimitAmount) OR BlankLimit THEN
                            AmountToPost := RuleAmount - RulePriorPostings
                        ELSE
                            AmountToPost := LimitAmount - RulePriorPostings;

                        //TBL1.01
                        IF NOT BlankLimit THEN
                            UpdateLimitUsed("Award Rule Line NVG", LineDistributionBufferRates, AmountToPost);
                        //==================
                        BaseAmountGroupTotal := BaseAmountGroupTotal + BaseAmount;
                        RuleAmountGroupTotal := RuleAmountGroupTotal + RuleAmount;
                        RulePriorPostingsGroupTotal := RulePriorPostingsGroupTotal + RulePriorPostings;
                        AmountToPostGroupTotal := AmountToPostGroupTotal + AmountToPost;

                        BaseAmountTotal := BaseAmountTotal + BaseAmount;
                        RuleAmountTotal := RuleAmountTotal + RuleAmount;
                        LimitAmountTotal := LimitAmountTotal + LimitAmount;
                        RulePriorPostingsTotal := RulePriorPostingsTotal + RulePriorPostings;
                        AmountToPostTotal := AmountToPostTotal + AmountToPost;

                        GenerateDimensionText(LineDistributionBufferRates);
                        AwardRuleLineDetailCounter := AwardRuleLineDetailCounter + 1;
                    end;

                    trigger OnPreDataItem()
                    begin
                        CurrReport.CREATETOTALS(BaseAmount, RuleAmount, RulePriorPostings, AmountToPost);

                        LineDistributionBufferRates.RESET;
                        LineDistributionBufferRates.SETRANGE("Document No.", "Award Rule Line NVG"."Document No.");
                        LineDistributionBufferRates.SETRANGE("Award Rate Code NVG", "Award Rule Line NVG"."Award Rate Code NVG");
                        IF LineDistributionBufferRates.COUNT = 0 THEN
                            CurrReport.BREAK;

                        SETRANGE(Number, 1, LineDistributionBufferRates.COUNT);
                        AwardRuleLineDetailCounter := 0;
                        //TBL1.01 - Not in v 22.5 -NM
                        LineDistributionBufferLimit.RESET;
                        LineDistributionBufferLimit.MODIFYALL(Percent, 0);
                        //NM
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    //AwardRuleHeader.GET("Award Rule No."); //Original
                    AwardRuleHeader.GET(SelectRuleCode);//Tonnic
                    IF AwardRuleHeader.Blocked THEN
                        CurrReport.SKIP;
                    AwardRuleHeader.CalcFields("Customer Target Lines Exist");

                    RuleRate := 100;
                    IF Amount <> 0 THEN BEGIN
                        RuleRate := Amount;
                    END ELSE BEGIN
                        AwardRate.SETRANGE("Award No.", Award."No.");
                        AwardRate.SETRANGE("Award Rate Code NVG", "Award Rate Code NVG");
                        AwardRate.SETRANGE("Effective Date", 0D, PostingDate);
                        AwardRate.FINDLAST;
                        RuleRate := AwardRate.Amount;

                    END;

                    GenerateTargets;
                    AwardRuleLineCounter := AwardRuleLineCounter + 1;
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.CREATETOTALS(BaseAmount, RuleAmount, RulePriorPostings, AmountToPost);
                    AwardRuleLineCounter := 0;
                    BaseAmountGroupTotal := 0;
                    RuleAmountGroupTotal := 0;
                    RulePriorPostingsGroupTotal := 0;
                    AmountToPostGroupTotal := 0;

                    SETRANGE("Award Rule Line NVG"."Award Rule No.", SelectRuleCode);
                end;
            }
            dataitem(AuditHeader; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                dataitem(SourceAudit; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    column(LineDistributionBufferSource__Document_No__; LineDistributionBufferSource."Document No.")
                    {
                    }
                    column(LineDistributionBufferSource_Description; LineDistributionBufferSource.Description)
                    {
                    }
                    column(LineDistributionBufferSource__Inter_Company_Name_; LineDistributionBufferSource."Inter-Company Name")
                    {
                    }
                    column(LineDistributionBufferSource_Amount; LineDistributionBufferSource.Amount)
                    {
                    }
                    column(DimText_Control1102633001; DimText)
                    {
                    }
                    column(Audit_Trail___Source_TabCaption; Audit_Trail___Source_TabCaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(CompanyCaption; CompanyCaptionLbl)
                    {
                    }
                    column(Document_No_Caption; Document_No_CaptionLbl)
                    {
                    }
                    column(SourceAudit_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF Number = 1 THEN
                            LineDistributionBufferSource.FINDSET(FALSE, FALSE)
                        ELSE
                            LineDistributionBufferSource.NEXT;

                        GenerateDimensionText(LineDistributionBufferSource);
                    end;

                    trigger OnPreDataItem()
                    begin
                        LineDistributionBufferSource.RESET;
                        SETRANGE(Number, 1, LineDistributionBufferSource.COUNT);
                    end;
                }
                dataitem(RateAudit; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    column(LineDistributionBufferRates__Document_No__; LineDistributionBufferRates."Document No.")
                    {
                    }
                    column(LineDistributionBufferRates__Award_Rate_Code_; LineDistributionBufferRates."Award Rate Code NVG")
                    { }
                    column(LineDistributionBufferRates_Description; LineDistributionBufferRates.Description)
                    {
                    }
                    column(LineDistributionBufferRates_Amount; LineDistributionBufferRates.Amount)
                    {
                    }
                    column(LineDistributionBufferRates__Currency_Factor_; LineDistributionBufferRates."Currency Factor")
                    {
                    }
                    column(LineDistributionBufferRates_Percent; LineDistributionBufferRates.Percent)
                    {
                    }
                    column(LineDistributionBufferRates__Inter_Company_Name_; LineDistributionBufferRates."Inter-Company Name")
                    {
                    }
                    column(LineDistributionBufferRates__Source_Currency_Amount_; LineDistributionBufferRates."Source Currency Amount")
                    {
                    }
                    column(DimText_Control1102633032; DimText)
                    {
                    }
                    column(Audit_Trail___Rate_TabCaption; Audit_Trail___Rate_TabCaptionLbl)
                    {
                    }
                    column(Document_No_Caption_Control1102633012; Document_No_Caption_Control1102633012Lbl)
                    {
                    }
                    column(AmountCaption_Control1102633025; AmountCaption_Control1102633025Lbl)
                    {
                    }
                    column(CompanyCaption_Control1102633027; CompanyCaption_Control1102633027Lbl)
                    {
                    }
                    column(DescriptionCaption_Control1102633028; DescriptionCaption_Control1102633028Lbl)
                    {
                    }
                    column(Award_Rate_CodeCaption; Award_Rate_CodeCaptionLbl)
                    {
                    }
                    column(RateCaption_Control1102633009; RateCaption_Control1102633009Lbl)
                    {
                    }
                    column(Source_AmountCaption_Control1102633031; Source_AmountCaption_Control1102633031Lbl)
                    {
                    }
                    column(Prior_Amt__PostedCaption_Control1102633008; Prior_Amt__PostedCaption_Control1102633008Lbl)
                    {
                    }
                    column(RateAudit_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF Number = 1 THEN
                            LineDistributionBufferRates.FINDSET(FALSE, FALSE)
                        ELSE
                            LineDistributionBufferRates.NEXT;

                        GenerateDimensionText(LineDistributionBufferRates);
                    end;

                    trigger OnPreDataItem()
                    begin
                        LineDistributionBufferRates.RESET;
                        SETRANGE(Number, 1, LineDistributionBufferRates.COUNT);
                    end;
                }
                dataitem(LimitAudit; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    column(LineDistributionBufferLimit__Document_No__; LineDistributionBufferLimit."Document No.")
                    {
                    }
                    column(LineDistributionBufferLimit_Description; LineDistributionBufferLimit.Description)
                    {
                    }
                    column(LineDistributionBufferLimit_Amount; LineDistributionBufferLimit.Amount)
                    {
                    }
                    column(DimText_Control1102633036; DimText)
                    {
                    }
                    column(Audit_Trail___Limits_TabCaption; Audit_Trail___Limits_TabCaptionLbl)
                    {
                    }
                    column(Document_No_Caption_Control1102633033; Document_No_Caption_Control1102633033Lbl)
                    {
                    }
                    column(DescriptionCaption_Control1102633034; DescriptionCaption_Control1102633034Lbl)
                    {
                    }
                    column(AmountCaption_Control1102633035; AmountCaption_Control1102633035Lbl)
                    {
                    }
                    column(LimitAudit_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        IF Number = 1 THEN
                            LineDistributionBufferLimit.FINDSET(FALSE, FALSE)
                        ELSE
                            LineDistributionBufferLimit.NEXT;

                        GenerateDimensionText(LineDistributionBufferLimit);
                    end;

                    trigger OnPreDataItem()
                    begin
                        LineDistributionBufferLimit.RESET;
                        SETRANGE(Number, 1, LineDistributionBufferLimit.COUNT);
                    end;
                }

                trigger OnPreDataItem()
                begin
                    IF NOT AuditTrail THEN
                        CurrReport.BREAK;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                LineDistributionBufferSource.RESET;
                LineDistributionBufferSource.DELETEALL;
                LineDistributionBufferSource."Award No." := "No.";
                LineDistributionBufferRates.RESET;
                LineDistributionBufferRates.DELETEALL;
                LineDistributionBufferRates."Award No." := LineDistributionBufferSource."Award No.";
                LineDistributionBufferLimit.RESET;
                LineDistributionBufferLimit.DELETEALL;
                LineDistributionBufferLimit."Award No." := LineDistributionBufferSource."Award No.";
                Counter := 10000;
                AVManagement.BuildICList("No.", TempCompany, TRUE);

                //TBL add Option 2 codes
                IF IDCOption = IDCOption::"1" THEN BEGIN
                    SelectRuleCode := Award."Indirect Cost Recovery Code";
                    AwardRuleLine.RESET;
                    AwardRuleLine.SETRANGE("Award Rule No.", SelectRuleCode);
                    TotalSourceAmount := 0;

                    CheckLines;
                    GenerateSource;
                    GenerateSourceIC;
                    IF LineDistributionBufferSource.COUNT = 0 THEN
                        CurrReport.SKIP;
                    ComputeRates;
                    GenerateLimits;

                    IF NOT FirstAward AND AuditTrail AND AuditTrailNewPage THEN
                        CurrReport.NEWPAGE;
                    FirstAward := FALSE;
                END ELSE BEGIN

                    SelectRuleCode := Award."Indirect Cost Recovery Code 2";
                    AwardRuleLine.RESET;
                    AwardRuleLine.SETRANGE("Award Rule No.", SelectRuleCode);
                    TotalSourceAmount := 0;
                    CheckLines;
                    GenerateSource;
                    GenerateSourceIC;
                    IF LineDistributionBufferSource.COUNT = 0 THEN
                        CurrReport.SKIP;
                    ComputeRates;
                    GenerateLimits;

                    IF NOT FirstAward AND AuditTrail AND AuditTrailNewPage THEN
                        CurrReport.NEWPAGE;
                    FirstAward := FALSE;

                END;
                /*
                AwardRuleLine.RESET;
                AwardRuleLine.SETRANGE("Award Rule No.",SelectRuleCode);
                */

            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.GET;
                AVSetup.GET;
                GLSetup.GET;
                FirstAward := TRUE;

                SETRANGE("Source Company Name", COMPANYNAME);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(IDCSelection; IDCSelection)
                    {

                    }
                    field(PostingDate; PostingDate)
                    {
                        Caption = 'Posting Date';
                        ApplicationArea = aLL;
                        trigger OnValidate()
                        begin
                            IF (DATE2DMY(PostingDate, 2) < 12) AND (DATE2DMY(PostingDate + 1, 2) <> DATE2DMY(PostingDate, 2) + 1) THEN
                                ERROR(SNText005);
                            IF (DATE2DMY(PostingDate, 2) = 12) AND (DATE2DMY(PostingDate + 1, 2) <> 1) THEN
                                ERROR(SNText005);
                        end;
                    }
                    field(PosttoGL; PosttoGL)
                    {
                        ApplicationArea = aLL;
                        Caption = 'Write to Gen. Journal';
                    }
                    field(AuditTrail; AuditTrail)
                    {
                        Caption = 'Audit Trail';
                        ApplicationArea = aLL;
                        trigger OnValidate()
                        begin
                            AuditTrailNewPage := AuditTrail;
                            NewPageEnable := AuditTrail;
                        end;
                    }
                    field(AuditTrailNewPage; AuditTrailNewPage)
                    {
                        ApplicationArea = aLL;
                        Caption = 'New Page per Award';
                        Enabled = NewPageEnable;
                    }
                    field("IDC Option"; IDCOption)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        IF PostingDate = 0D THEN
            ERROR(SNText002);

        EndDate := PostingDate;
        StartDate := CALCDATE('<-1M>', PostingDate + 1)
    end;

    var
        AVSetup: Record "AV Setup NVG";
        GLSetup: Record "General Ledger Setup";
        AwardRuleHeader: Record "Award Rule Header NVG";
        AwardRuleLine: Record "Award Rule Line NVG";
        AwardRuleLineDetail: Record "Award Rule Line Detail NVG";
        AwardRate: Record "Award Rate NVG";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlTemplate: Record "Gen. Journal Template";
        CompanyInformation: Record "Company Information";
        LineDistributionBufferSource: Record "Line Distribution Buffer NVG" temporary;
        LineDistributionBufferRates: Record "Line Distribution Buffer NVG" temporary;
        LineDistributionBufferLimit: Record "Line Distribution Buffer NVG" temporary;
        TempCompany: Record Company temporary;
        CurrExchRate: Record "Currency Exchange Rate";
        Funder: Record "Funder NVG";
        AVManagement: Codeunit AVManagementNVG;
        FundManagement: Codeunit FundManagementNVG;
        GLTranManagement: Codeunit GLTranManagementNVG;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        DimText: Text[1024];
        TotalSourceAmount: Decimal;
        RuleAmount: Decimal;
        RuleRate: Decimal;
        LimitAmount: Decimal;
        RulePriorPostings: Decimal;
        BaseAmount: Decimal;
        AmountToPost: Decimal;
        BaseAmountTotal: Decimal;
        RuleAmountTotal: Decimal;
        LimitAmountTotal: Decimal;
        RulePriorPostingsTotal: Decimal;
        AmountToPostTotal: Decimal;
        BaseAmountGroupTotal: Decimal;
        RuleAmountGroupTotal: Decimal;
        RulePriorPostingsGroupTotal: Decimal;
        AmountToPostGroupTotal: Decimal;
        Counter: Integer;
        AwardRuleLineCounter: Integer;
        AwardRuleLineDetailCounter: Integer;
        StartDate: Date;
        EndDate: Date;
        PostingDate: Date;
        PosttoGL: Boolean;
        AuditTrail: Boolean;
        AuditTrailNewPage: Boolean;
        FirstAward: Boolean;
        [InDataSet]
        NewPageEnable: Boolean;
        BlankLimit: Boolean;
        SNText002: Label 'Posting Date is required.';
        SNText003: Label 'No Target lines were found for Award Rule %1, Award Rate Code %2, Document No. %3.';
        SNText004: Label 'A Document No is required on each Award Rule Line.  Award Rule=%1, Type=%2';
        SNText005: Label 'Date must be a month ending date.';
        SNText006: Label 'Fund: ';
        SNText007: Label 'No. of Detail Lines cannot be zero.  Award Rule = %1, Document No. = %2';
        SNText008: Label 'Cannot change the Fund when setup as Traditional, Non-editable.  Award = %1, Award Rule = %2';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Amount_To_PostCaptionLbl: Label 'Amount To Post';
        Limit_AmountCaptionLbl: Label 'Limit Amount To';
        Amount_CalculatedCaptionLbl: Label 'Amount Calculated';
        RateCaptionLbl: Label 'Rate';
        Rate_CodeCaptionLbl: Label 'Rate Code';
        Source_AmountCaptionLbl: Label 'Source Amount';
        Rule_CodeCaptionLbl: Label 'Rule Code';
        Prior_Amt__PostedCaptionLbl: Label 'Prior Amt. Posted';
        Audit_Trail___Source_TabCaptionLbl: Label 'Audit Trail - Source Tab';
        DescriptionCaptionLbl: Label 'Description';
        AmountCaptionLbl: Label 'Amount';
        CompanyCaptionLbl: Label 'Company';
        Document_No_CaptionLbl: Label 'Document No.';
        Audit_Trail___Rate_TabCaptionLbl: Label 'Audit Trail - Rate Tab';
        Document_No_Caption_Control1102633012Lbl: Label 'Document No.';
        AmountCaption_Control1102633025Lbl: Label 'Amount';
        CompanyCaption_Control1102633027Lbl: Label 'Company';
        DescriptionCaption_Control1102633028Lbl: Label 'Description';
        Award_Rate_CodeCaptionLbl: Label 'Award Rate Code';
        RateCaption_Control1102633009Lbl: Label 'Rate';
        Source_AmountCaption_Control1102633031Lbl: Label 'Source Amount';
        Prior_Amt__PostedCaption_Control1102633008Lbl: Label 'Prior Amt. Posted';
        Audit_Trail___Limits_TabCaptionLbl: Label 'Audit Trail - Limits Tab';
        Document_No_Caption_Control1102633033Lbl: Label 'Document No.';
        DescriptionCaption_Control1102633034Lbl: Label 'Description';
        AmountCaption_Control1102633035Lbl: Label 'Amount';
        "---------------TBL---------": Integer;
        IDCOption: Option "1","2";
        SelectRuleCode: Code[10];
        // ---CPI---
        SaveBlankLimit: Boolean;
        IDCCode: Code[10];
        IDCSelection: Option "Indirect Cost Recovery Code","Indirect Cost Recovery Code 2","IDC Provisional Code","IDC Provisional Code 2";


    // [Scope('Internal')]
    procedure CheckLines()
    begin
        WITH AwardRuleLine DO BEGIN
            SETRANGE("Award Rule No.", SelectRuleCode);
            IF NOT FINDSET(FALSE, FALSE) THEN
                EXIT;

            REPEAT
                IF "Document No." = '' THEN
                    ERROR(SNText004, "Award Rule No.", AwardRuleLine."Line Type");
            UNTIL NEXT = 0;
        END;
    end;

    // [Scope('Internal')]
    procedure GenerateSource()
    var
        LineDistributionBufferSource2: Record "Line Distribution Buffer NVG" temporary;
    begin
        WITH AwardRuleLine DO BEGIN
            SETRANGE("Award Rule No.", SelectRuleCode);
            SETRANGE("Line Type", "Line Type"::Source);
            IF NOT FINDSET(FALSE, FALSE) THEN
                EXIT;

            CALCFIELDS("No. of Detail Lines");
            IF "No. of Detail Lines" = 0 THEN
                ERROR(SNText007, SelectRuleCode, AwardRuleLine."Document No.");

            REPEAT
                AwardRuleLineDetail.SETRANGE("Award Rule No.", "Award Rule No.");
                AwardRuleLineDetail.SETRANGE("Line Type", "Line Type");
                AwardRuleLineDetail.SETRANGE("Award Rule Line No.", "Line No.");
                AwardRuleLineDetail.FINDSET(FALSE, FALSE);
                REPEAT
                    SetDatesDetail(AwardRuleLineDetail);
                    GenerateLineDistribtionBuffer(LineDistributionBufferSource2);
                    ComputeMatrixAddition(LineDistributionBufferSource, LineDistributionBufferSource2);
                UNTIL AwardRuleLineDetail.NEXT = 0;
            UNTIL NEXT = 0;
        END;

        CLEAR(AwardRuleLineDetail);
    end;

    // [Scope('Internal')]
    procedure ComputeRates()
    var
        AwardRate: Record "Award Rate NVG";
    begin
        WITH AwardRuleLine DO BEGIN
            SETRANGE("Award Rule No.", SelectRuleCode);
            SETRANGE("Line Type", "Line Type"::Rates);
            IF NOT FINDSET(FALSE, FALSE) THEN
                EXIT;

            REPEAT
                InitLineDistributionBuffer(LineDistributionBufferRates);
                LineDistributionBufferRates."Document No." := "Document No.";
                LineDistributionBufferRates."Award Rate Code NVG" := "Award Rate Code NVG";

                LineDistributionBufferSource.SETCURRENTKEY("Award No.");
                LineDistributionBufferSource.SETRANGE("Award No.", LineDistributionBufferSource."Award No.");
                LineDistributionBufferSource.SETRANGE("Document No.", "Document No.");
                IF LineDistributionBufferSource.FINDSET(FALSE, FALSE) THEN
                    REPEAT
                        LineDistributionBufferRates."Internal Control No." := LineDistributionBufferSource."Internal Control No.";
                        LineDistributionBufferRates."Source Currency Amount" := LineDistributionBufferSource.Amount; // Audit
                        LineDistributionBufferRates."Inter-Company Name" := LineDistributionBufferSource."Inter-Company Name";
                        IF Amount <> 0 THEN BEGIN
                            LineDistributionBufferRates.Amount := ROUND(LineDistributionBufferSource.Amount * Amount / 100);
                            LineDistributionBufferRates."Currency Factor" := Amount;    // Audit
                        END ELSE BEGIN
                            AwardRate.SETRANGE("Award No.", Award."No.");
                            AwardRate.SETRANGE("Award Rate Code NVG", "Award Rate Code NVG");
                            AwardRate.SETRANGE("Effective Date", 0D, PostingDate);
                            AwardRate.FINDLAST;
                            LineDistributionBufferRates.Amount := ROUND(LineDistributionBufferSource.Amount * AwardRate.Amount / 100);
                            LineDistributionBufferRates."Currency Factor" := AwardRate.Amount;  // Audit
                        END;

                        LineDistributionBufferRates."Fund No." := LineDistributionBufferSource."Fund No.";
                        LineDistributionBufferRates."Shortcut Dimension 1 Code" := LineDistributionBufferSource."Shortcut Dimension 1 Code";
                        LineDistributionBufferRates."Shortcut Dimension 2 Code" := LineDistributionBufferSource."Shortcut Dimension 2 Code";
                        LineDistributionBufferRates."Shortcut Dimension 3 Code" := LineDistributionBufferSource."Shortcut Dimension 3 Code";
                        LineDistributionBufferRates."Shortcut Dimension 4 Code" := LineDistributionBufferSource."Shortcut Dimension 4 Code";
                        LineDistributionBufferRates."Shortcut Dimension 5 Code" := LineDistributionBufferSource."Shortcut Dimension 5 Code";
                        LineDistributionBufferRates."Shortcut Dimension 6 Code" := LineDistributionBufferSource."Shortcut Dimension 6 Code";
                        LineDistributionBufferRates."Shortcut Dimension 7 Code" := LineDistributionBufferSource."Shortcut Dimension 7 Code";
                        LineDistributionBufferRates."Shortcut Dimension 8 Code" := LineDistributionBufferSource."Shortcut Dimension 8 Code";

                        IF AwardRuleLine."Reduce by Prior Postings" THEN
                            LineDistributionBufferRates.Percent := CalculatePriorPostings(AwardRuleLine, LineDistributionBufferSource);

                        IF (LineDistributionBufferRates.Amount <> 0) OR (LineDistributionBufferRates.Percent <> 0) THEN
                            InsertLineDistributionBuffer(LineDistributionBufferRates);

                    UNTIL LineDistributionBufferSource.NEXT = 0;
            UNTIL NEXT = 0;
        END;
    end;

    // [Scope('Internal')]
    procedure GenerateLimits()
    begin
        WITH AwardRuleLine DO BEGIN
            SETRANGE("Award Rule No.", SelectRuleCode);
            SETRANGE("Line Type", "Line Type"::Limits);
            LimitAmount := 0;
            BlankLimit := FALSE;

            IF NOT FINDSET(FALSE, FALSE) THEN BEGIN
                BlankLimit := TRUE;
                EXIT;
            END;

            REPEAT
                SetDates(AwardRuleLine);
                GenerateLineDistribtionBuffer(LineDistributionBufferLimit);
            UNTIL NEXT = 0;
        END;
    end;

    // [Scope('Internal')]
    procedure GenerateTargets()
    var
        GenJnlLine: Record "Gen. Journal Line";
        DocNo: Code[20];
        PreviousTargetDocumentNo: Code[20];
        LineNo: Integer;
        RuleAmount: Decimal;
        LimitAmount: Decimal;
        PriorPostAmount: Decimal;
        AmountToPost: Decimal;
        WriteAwardDimension: Boolean;
        LineInserted: Boolean;
    begin
        WITH AwardRuleLine DO BEGIN
            SETRANGE("Award Rule No.", SelectRuleCode);
            SETRANGE("Line Type", "Line Type"::Target);
            SETRANGE("Award Rate Code NVG", "Award Rule Line NVG"."Award Rate Code NVG");
            SETRANGE("Document No.", "Award Rule Line NVG"."Document No.");
            IF NOT FINDSET(FALSE, FALSE) THEN BEGIN
                //Overwrite targets  loop and move to the next no. if not found Exit else execute ....Tonnic
                EXIT;
            END;
            PreviousTargetDocumentNo := '';
            LineInserted := FALSE;
            REPEAT
                IF PreviousTargetDocumentNo <> "Document No." THEN BEGIN
                    IF LineInserted THEN BEGIN
                        DocNo := NoSeriesManagement.GetNextNo(GenJnlBatch."No. Series", PostingDate, TRUE);
                        LineInserted := FALSE;
                    END;
                    GenJnlBatch.GET("Journal Template Name", "Journal Batch Name");
                    GenJnlBatch.TESTFIELD("No. Series");
                    DocNo := NoSeriesManagement.GetNextNo(GenJnlBatch."No. Series", PostingDate, FALSE);
                END;
                PreviousTargetDocumentNo := "Document No.";

                GenJnlLine.LOCKTABLE;
                GenJnlLine.SETRANGE("Journal Template Name", "Journal Template Name");
                GenJnlLine.SETRANGE("Journal Batch Name", "Journal Batch Name");
                LineNo := 10000;
                IF GenJnlLine.FINDLAST THEN;
                LineNo += GenJnlLine."Line No.";

                GenJnlLine.INIT;
                GenJnlLine.VALIDATE("Journal Template Name", "Journal Template Name");
                GenJnlLine.VALIDATE("Journal Batch Name", "Journal Batch Name");
                GenJnlLine."Line No." := LineNo;

                GenJnlTemplate.GET("Journal Template Name");
                GenJnlLine."Source Code" := GenJnlTemplate."Source Code";
                GenJnlBatch.GET("Journal Template Name", "Journal Batch Name");

                GenJnlLine."Status NVG" := GenJnlLine."Status NVG"::New;
                GenJnlLine.VALIDATE("Posting Date", PostingDate);
                GenJnlLine."Transaction Type NVG" := GenJnlTemplate."Transaction Type NVG";
                GenJnlLine."Document No." := DocNo;
                GenJnlLine."Posting No. Series" := GenJnlBatch."Posting No. Series";
                IF GenJnlLine."Posting No. Series" = '' THEN BEGIN
                    GenJnlLine."Posting No. Series" := GenJnlTemplate."Posting No. Series";
                END;

                IF AwardRuleHeader."Customer Target Lines Exist" THEN
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;

                GenJnlLine."Account Type" := "Account Type";
                IF ("Account Type" = "Account Type"::Customer) AND ("Account No. Filter" = '') THEN BEGIN
                    Award.TESTFIELD("Sponsoring Funder No.");
                    Funder.GET(Award."Sponsoring Funder No.");
                    Funder.CALCFIELDS("Customer No.");
                    Funder.TESTFIELD("Customer No.");
                    GenJnlLine.VALIDATE("Account No.", Funder."Customer No.");
                END ELSE
                    GenJnlLine.VALIDATE("Account No.", "Account No. Filter");

                LineDistributionBufferRates.RESET;
                LineDistributionBufferRates.SETCURRENTKEY("Award No.");
                LineDistributionBufferRates.SETRANGE("Award No.", LineDistributionBufferRates."Award No.");
                LineDistributionBufferRates.SETRANGE("Document No.", "Document No.");
                LineDistributionBufferRates.SETRANGE("Award Rate Code NVG", "Award Rule Line NVG"."Award Rate Code NVG");
                IF LineDistributionBufferRates.FINDSET(FALSE, FALSE) THEN
                    REPEAT
                        GenJnlLine."Line No." := LineNo;
                        LineNo += 10000;

                        RuleAmount := LineDistributionBufferRates.Amount;
                        PriorPostAmount := LineDistributionBufferRates.Percent;

                        IF NOT BlankLimit THEN BEGIN
                            LimitAmount := CalculateLimit("Award Rule Line NVG", LineDistributionBufferRates);
                        END;

                        IF (RuleAmount <= LimitAmount) OR BlankLimit THEN
                            AmountToPost := RuleAmount - PriorPostAmount
                        ELSE
                            AmountToPost := LimitAmount - PriorPostAmount;

                        IF Operation = Operation::"+" THEN BEGIN
                            GenJnlLine.VALIDATE(Amount, AmountToPost);
                            GenJnlLine."Post to AV NVG" := TRUE;
                        END ELSE BEGIN
                            GenJnlLine.VALIDATE(Amount, -AmountToPost);
                            GenJnlLine."Post to AV NVG" := FALSE;
                        END;

                        IF GenJnlLine."Document Type" = GenJnlLine."Document Type"::Invoice THEN BEGIN
                            IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account") AND (GenJnlLine.Amount > 0) THEN
                                GenJnlLine."Document Type" := GenJnlLine."Document Type"::"Credit Memo";
                            IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) AND (GenJnlLine.Amount < 0) THEN
                                GenJnlLine."Document Type" := GenJnlLine."Document Type"::"Credit Memo";
                        END;

                        GenJnlLine.Description := Description;
                        GenJnlLine."External Document No." := "Document No.";
                        GenJnlLine."System-Created Entry" := TRUE;
                        IF GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer THEN
                            GenJnlLine."Applies-to ID" := Award."No.";

                        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) AND
                           (NOT FundManagement.CheckARDistributed) AND (NOT FundManagement.CheckAREditable) THEN BEGIN
                            IF "Fund Filter" <> '' THEN BEGIN
                                ERROR(SNText008, Award."No.", "Award Rule No.")
                            END;
                        END;

                        IF "Fund Filter" <> '' THEN
                            GenJnlLine.VALIDATE("Fund No. NVG", "Fund Filter")
                        ELSE
                            IF FundManagement.CheckARDistributed OR (GenJnlLine."Account Type" <> GenJnlLine."Account Type"::Customer) THEN BEGIN
                                IF LineDistributionBufferRates."Fund No." <> '' THEN
                                    GenJnlLine.VALIDATE("Fund No. NVG", LineDistributionBufferRates."Fund No.")
                                ELSE
                                    GenJnlLine.VALIDATE("Fund No. NVG", Award."Fund No.");
                            END;
                        IF "Fund Class Filter" <> '' THEN
                            GenJnlLine.VALIDATE("Fund Class Code NVG", "Fund Class Filter");
                        IF "Shortcut Dimension 1 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 1 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 1 Code" := LineDistributionBufferRates."Shortcut Dimension 1 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 1 Code" := Award."Global Dimension 1 Code";
                        IF "Shortcut Dimension 2 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 2 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 2 Code" := LineDistributionBufferRates."Shortcut Dimension 2 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 2 Code" := Award."Global Dimension 2 Code";
                        IF "Shortcut Dimension 3 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 3 Code NVG" := "Shortcut Dimension 3 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 3 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 3 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 3 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 3 Code NVG" := Award."Global Dimension 3 Code";
                        IF "Shortcut Dimension 4 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 4 Code NVG" := "Shortcut Dimension 4 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 4 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 4 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 4 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 4 Code NVG" := Award."Global Dimension 4 Code";
                        IF "Shortcut Dimension 5 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 5 Code NVG" := "Shortcut Dimension 5 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 5 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 5 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 5 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 5 Code NVG" := Award."Global Dimension 5 Code";
                        IF "Shortcut Dimension 6 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 6 Code NVG" := "Shortcut Dimension 6 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 6 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 6 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 6 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 6 Code NVG" := Award."Global Dimension 6 Code";
                        IF "Shortcut Dimension 7 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 7 Code NVG" := "Shortcut Dimension 7 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 7 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 7 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 7 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 7 Code NVG" := Award."Global Dimension 7 Code";
                        IF "Shortcut Dimension 8 Filter" <> '' THEN
                            GenJnlLine."Shortcut Dimension 8 Code NVG" := "Shortcut Dimension 8 Filter"
                        ELSE
                            IF LineDistributionBufferRates."Shortcut Dimension 8 Code" <> '' THEN
                                GenJnlLine."Shortcut Dimension 8 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 8 Code"
                            ELSE
                                GenJnlLine."Shortcut Dimension 8 Code NVG" := Award."Global Dimension 8 Code";

                        WriteAwardDimension := TRUE;
                        IF (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) AND (NOT FundManagement.CheckARDistributed) THEN BEGIN
                            IF NOT FundManagement.CheckAREditable THEN
                                WriteAwardDimension := FALSE
                            ELSE
                                IF GenJnlLine."Fund No. NVG" <> '' THEN
                                    WriteAwardDimension := FALSE
                        END;

                        IF WriteAwardDimension THEN BEGIN
                            CASE Award."Award Dimension No." - 1 OF
                                0:
                                    IF LineDistributionBufferRates."Fund No." = '' THEN
                                        GenJnlLine.VALIDATE("Fund No. NVG", Award."Award Dimension Value");
                                1:
                                    IF LineDistributionBufferRates."Shortcut Dimension 1 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", Award."Award Dimension Value");
                                2:
                                    IF LineDistributionBufferRates."Shortcut Dimension 2 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 2 Code", Award."Award Dimension Value");
                                3:
                                    IF LineDistributionBufferRates."Shortcut Dimension 3 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 3 Code NVG", Award."Award Dimension Value");
                                4:
                                    IF LineDistributionBufferRates."Shortcut Dimension 4 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 4 Code NVG", Award."Award Dimension Value");
                                5:
                                    IF LineDistributionBufferRates."Shortcut Dimension 5 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 5 Code NVG", Award."Award Dimension Value");
                                6:
                                    IF LineDistributionBufferRates."Shortcut Dimension 6 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 6 Code NVG", Award."Award Dimension Value");
                                7:
                                    IF LineDistributionBufferRates."Shortcut Dimension 7 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 7 Code NVG", Award."Award Dimension Value");
                                8:
                                    IF LineDistributionBufferRates."Shortcut Dimension 8 Code" = '' THEN
                                        GenJnlLine.VALIDATE("Shortcut Dimension 8 Code NVG", Award."Award Dimension Value");
                            END;
                        END;
                        GenJnlLine."Ctl. Fund No. NVG" := GenJnlBatch."Ctl. Fund No. NVG";
                        GenJnlLine."Award No. NVG" := Award."No.";
                        GenJnlLine."Award Rule Type NVG" := GenJnlLine."Award Rule Type NVG"::"Indirect Cost Recovery NVG";
                        GenJnlLine."Inter-Company Name NVG" := '';
                        IF LineDistributionBufferRates."Inter-Company Name" <> COMPANYNAME THEN
                            GenJnlLine."Inter-Company Name NVG" := LineDistributionBufferRates."Inter-Company Name";
                        GenJnlLine."Internal Control No. NVG" := GLTranManagement.GenerateICN;
                        UpdateDimensions(GenJnlLine);

                        IF (GenJnlLine.Amount <> 0) AND PosttoGL THEN BEGIN
                            GenJnlLine.INSERT(TRUE);
                            LineInserted := TRUE;
                        END;
                    UNTIL LineDistributionBufferRates.NEXT = 0;
            UNTIL NEXT = 0;

            IF LineInserted THEN BEGIN
                DocNo := NoSeriesManagement.GetNextNo(GenJnlBatch."No. Series", PostingDate, TRUE);
                LineInserted := FALSE;
            END;
        END;
    end;

    // [Scope('Internal')]
    procedure UpdateDimensions(var GenJnlLine: Record "Gen. Journal Line")
    var
        Award: Record "Award NVG";
        AwardNo: Code[10];
    begin
        WITH GenJnlLine DO BEGIN
            CASE AVSetup."Award Dimension No." - 1 OF
                0:
                    AwardNo := "Fund No. NVG";
                1:
                    AwardNo := "Shortcut Dimension 1 Code";
                2:
                    AwardNo := "Shortcut Dimension 2 Code";
                3:
                    AwardNo := "Shortcut Dimension 3 Code NVG";
                4:
                    AwardNo := "Shortcut Dimension 4 Code NVG";
                5:
                    AwardNo := "Shortcut Dimension 5 Code NVG";
                6:
                    AwardNo := "Shortcut Dimension 6 Code NVG";
                7:
                    AwardNo := "Shortcut Dimension 7 Code NVG";
                8:
                    AwardNo := "Shortcut Dimension 8 Code NVG";
            END;
            IF NOT Award.GET(AwardNo) THEN BEGIN
                CASE AVSetup."Subaward Dimension No." - 1 OF
                    1:
                        "Shortcut Dimension 1 Code" := '';
                    2:
                        "Shortcut Dimension 2 Code" := '';
                    3:
                        "Shortcut Dimension 3 Code NVG" := '';
                    4:
                        "Shortcut Dimension 4 Code NVG" := '';
                    5:
                        "Shortcut Dimension 5 Code NVG" := '';
                    6:
                        "Shortcut Dimension 6 Code NVG" := '';
                    7:
                        "Shortcut Dimension 7 Code NVG" := '';
                    8:
                        "Shortcut Dimension 8 Code NVG" := '';
                END;
                CASE AVSetup."Restriction Dimension No." - 1 OF
                    1:
                        "Shortcut Dimension 1 Code" := '';
                    2:
                        "Shortcut Dimension 2 Code" := '';
                    3:
                        "Shortcut Dimension 3 Code NVG" := '';
                    4:
                        "Shortcut Dimension 4 Code NVG" := '';
                    5:
                        "Shortcut Dimension 5 Code NVG" := '';
                    6:
                        "Shortcut Dimension 6 Code NVG" := '';
                    7:
                        "Shortcut Dimension 7 Code NVG" := '';
                    8:
                        "Shortcut Dimension 8 Code NVG" := '';
                END;
            END;
        END;
    end;

    // [Scope('Internal')]
    procedure CalculatePriorPostings(AwardRuleLine: Record "Award Rule Line NVG"; LineDistributionBufferSource: Record "Line Distribution Buffer NVG") PriorAmount: Decimal
    var
        GLEntry: Record "G/L Entry";
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
    begin
        SetDates(AwardRuleLine);

        AwardRuleLineGroupBy.RESET;
        AwardRuleLineGroupBy.SETRANGE("Award Rule No.", AwardRuleLine."Award Rule No.");
        AwardRuleLineGroupBy.SETRANGE("Line Type", AwardRuleLineGroupBy."Line Type"::Source);
        AwardRuleLineGroupBy.SETRANGE("Document No.", AwardRuleLine."Document No.");
        AwardRuleLineGroupBy.FINDFIRST;

        GLEntry.RESET;
        GLEntry.SETCURRENTKEY("Transaction Type NVG", "Ctl. Fund No. NVG", "Global Dimension 1 Code", "Global Dimension 2 Code");
        SetInitialFilters(GLEntry);
        IF LineDistributionBufferSource."Inter-Company Name" = COMPANYNAME THEN BEGIN
            GLEntry.SETFILTER("Inter-Company Name NVG", '%1', '');
        END ELSE BEGIN
            GLEntry.SETFILTER("Inter-Company Name NVG", '%1', LineDistributionBufferSource."Inter-Company Name");
        END;

        IF AwardRuleLineGroupBy."Group By Fund" THEN
            GLEntry.SETRANGE("Fund No. NVG", LineDistributionBufferSource."Fund No.");
        IF AwardRuleLineGroupBy."Group By Dimension 1" THEN
            GLEntry.SETRANGE("Global Dimension 1 Code", LineDistributionBufferSource."Shortcut Dimension 1 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 2" THEN
            GLEntry.SETRANGE("Global Dimension 2 Code", LineDistributionBufferSource."Shortcut Dimension 2 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 3" THEN
            GLEntry.SETRANGE("Global Dimension 3 Code NVG", LineDistributionBufferSource."Shortcut Dimension 3 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 4" THEN
            GLEntry.SETRANGE("Global Dimension 4 Code NVG", LineDistributionBufferSource."Shortcut Dimension 4 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 5" THEN
            GLEntry.SETRANGE("Global Dimension 5 Code NVG", LineDistributionBufferSource."Shortcut Dimension 5 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 6" THEN
            GLEntry.SETRANGE("Global Dimension 6 Code NVG", LineDistributionBufferSource."Shortcut Dimension 6 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 7" THEN
            GLEntry.SETRANGE("Global Dimension 7 Code NVG", LineDistributionBufferSource."Shortcut Dimension 7 Code");
        IF AwardRuleLineGroupBy."Group By Dimension 8" THEN
            GLEntry.SETRANGE("Global Dimension 8 Code NVG", LineDistributionBufferSource."Shortcut Dimension 8 Code");

        PriorAmount := 0;
        IF GLEntry.FINDSET(FALSE, FALSE) THEN BEGIN
            REPEAT
                PriorAmount := PriorAmount + GLEntry.Amount;
            UNTIL GLEntry.NEXT = 0;
        END;
        EXIT(PriorAmount);
    end;

    //[Scope('Internal')]
    procedure CalculateLimit(AwardRuleLine: Record "Award Rule Line NVG"; LineDistributionBufferRates: Record "Line Distribution Buffer NVG" temporary) LimitAmount: Decimal
    var
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
    begin
        LimitAmount := 0;

        WITH LineDistributionBufferLimit DO BEGIN
            SETCURRENTKEY("Document No.");
            SETRANGE("Document No.", LineDistributionBufferRates."Document No.");
            SETRANGE("Award Rate Code NVG", LineDistributionBufferRates."Award Rate Code NVG");

            AwardRuleLineGroupBy.RESET;
            AwardRuleLineGroupBy.SETRANGE("Award Rule No.", AwardRuleLine."Award Rule No.");
            AwardRuleLineGroupBy.SETRANGE("Line Type", AwardRuleLine."Line Type"::Source);
            AwardRuleLineGroupBy.SETRANGE("Document No.", AwardRuleLine."Document No.");
            AwardRuleLineGroupBy.FINDFIRST;

            IF AwardRuleLineGroupBy."Group By Fund" THEN
                SETRANGE("Fund No.", LineDistributionBufferRates."Fund No.");
            IF AwardRuleLineGroupBy."Group By Dimension 1" THEN
                SETRANGE("Shortcut Dimension 1 Code", LineDistributionBufferRates."Shortcut Dimension 1 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 2" THEN
                SETRANGE("Shortcut Dimension 2 Code", LineDistributionBufferRates."Shortcut Dimension 2 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 3" THEN
                SETRANGE("Shortcut Dimension 3 Code", LineDistributionBufferRates."Shortcut Dimension 3 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 4" THEN
                SETRANGE("Shortcut Dimension 4 Code", LineDistributionBufferRates."Shortcut Dimension 4 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 5" THEN
                SETRANGE("Shortcut Dimension 5 Code", LineDistributionBufferRates."Shortcut Dimension 5 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 6" THEN
                SETRANGE("Shortcut Dimension 6 Code", LineDistributionBufferRates."Shortcut Dimension 6 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 7" THEN
                SETRANGE("Shortcut Dimension 7 Code", LineDistributionBufferRates."Shortcut Dimension 7 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 8" THEN
                SETRANGE("Shortcut Dimension 8 Code", LineDistributionBufferRates."Shortcut Dimension 8 Code");

            IF FINDSET(FALSE, FALSE) THEN BEGIN
                REPEAT
                    LimitAmount += Amount;
                UNTIL NEXT = 0;
                LimitAmount := ABS(LimitAmount);
            END;
        END;
    end;

    // [Scope('Internal')]
    procedure SetInitialFilters(var GLEntry: Record "G/L Entry")
    begin
        WITH GLEntry DO BEGIN
            SETRANGE("Posting Date", StartDate, EndDate);
            SETRANGE("Closing Entry NVG", FALSE);

            IF AwardRuleLineDetail."Award Rule No." = '' THEN BEGIN
                SETRANGE("Transaction Type NVG", AwardRuleLine."Transaction Type");
                SETFILTER("G/L Account No.", AwardRuleLine."Account No. Filter");
                SETFILTER("Fund No. NVG", AwardRuleLine."Fund Filter");
                SETFILTER("Global Dimension 1 Code", AwardRuleLine."Shortcut Dimension 1 Filter");
                SETFILTER("Global Dimension 2 Code", AwardRuleLine."Shortcut Dimension 2 Filter");
                SETFILTER("Global Dimension 3 Code NVG", AwardRuleLine."Shortcut Dimension 3 Filter");
                SETFILTER("Global Dimension 4 Code NVG", AwardRuleLine."Shortcut Dimension 4 Filter");
                SETFILTER("Global Dimension 5 Code NVG", AwardRuleLine."Shortcut Dimension 5 Filter");
                SETFILTER("Global Dimension 6 Code NVG", AwardRuleLine."Shortcut Dimension 6 Filter");
                SETFILTER("Global Dimension 7 Code NVG", AwardRuleLine."Shortcut Dimension 7 Filter");
                SETFILTER("Global Dimension 8 Code NVG", AwardRuleLine."Shortcut Dimension 8 Filter");
                SETFILTER("Fund Class Code NVG", AwardRuleLine."Fund Class Filter");
                SETFILTER("Budget Plan No. NVG", AwardRuleLine."Budget Plan Filter");
            END ELSE BEGIN
                SETRANGE("Transaction Type NVG", AwardRuleLineDetail."Transaction Type");
                SETFILTER("G/L Account No.", AwardRuleLineDetail."Account No. Filter");
                SETFILTER("Fund No. NVG", AwardRuleLineDetail."Fund Filter");
                SETFILTER("Global Dimension 1 Code", AwardRuleLineDetail."Shortcut Dimension 1 Filter");
                SETFILTER("Global Dimension 2 Code", AwardRuleLineDetail."Shortcut Dimension 2 Filter");
                SETFILTER("Global Dimension 3 Code NVG", AwardRuleLineDetail."Shortcut Dimension 3 Filter");
                SETFILTER("Global Dimension 4 Code NVG", AwardRuleLineDetail."Shortcut Dimension 4 Filter");
                SETFILTER("Global Dimension 5 Code NVG", AwardRuleLineDetail."Shortcut Dimension 5 Filter");
                SETFILTER("Global Dimension 6 Code NVG", AwardRuleLineDetail."Shortcut Dimension 6 Filter");
                SETFILTER("Global Dimension 7 Code NVG", AwardRuleLineDetail."Shortcut Dimension 7 Filter");
                SETFILTER("Global Dimension 8 Code NVG", AwardRuleLineDetail."Shortcut Dimension 8 Filter");
                SETFILTER("Fund Class Code NVG", AwardRuleLineDetail."Fund Class Filter");
            END;

            CASE Award."Award Dimension No." - 1 OF
                0:
                    SETRANGE("Fund No. NVG", Award."Award Dimension Value");
                1:
                    SETRANGE("Global Dimension 1 Code", Award."Award Dimension Value");
                2:
                    SETRANGE("Global Dimension 2 Code", Award."Award Dimension Value");
                3:
                    SETRANGE("Global Dimension 3 Code NVG", Award."Award Dimension Value");
                4:
                    SETRANGE("Global Dimension 4 Code NVG", Award."Award Dimension Value");
                5:
                    SETRANGE("Global Dimension 5 Code NVG", Award."Award Dimension Value");
                6:
                    SETRANGE("Global Dimension 6 Code NVG", Award."Award Dimension Value");
                7:
                    SETRANGE("Global Dimension 7 Code NVG", Award."Award Dimension Value");
                8:
                    SETRANGE("Global Dimension 8 Code NVG", Award."Award Dimension Value");
            END;
        END;
    end;

    // [Scope('Internal')]
    procedure GenerateLineDistribtionBuffer(var LDB: Record "Line Distribution Buffer NVG")
    var
        GLEntry: Record "G/L Entry";
        TempGLEntry: Record "G/L Entry" temporary;
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
        AppliedAmount: Decimal;
    begin
        WITH GLEntry DO BEGIN
            SETCURRENTKEY("Transaction Type NVG", "Fund No. NVG", "Global Dimension 1 Code", "Global Dimension 2 Code");
            SetInitialFilters(GLEntry);

            IF NOT FINDSET(FALSE, FALSE) THEN
                EXIT;

            REPEAT
                TempGLEntry := GLEntry;
                TempGLEntry.INSERT;
            UNTIL NEXT = 0;
        END;

        WITH TempGLEntry DO BEGIN
            REPEAT
                SetInitialFilters(TempGLEntry);
                InitLineDistributionBuffer(LDB);
                LDB."Inter-Company Name" := COMPANYNAME;

                IF AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source THEN BEGIN
                    AwardRuleLineGroupBy := AwardRuleLine
                END ELSE BEGIN
                    AwardRuleLineGroupBy.RESET;
                    AwardRuleLineGroupBy.SETRANGE("Award Rule No.", AwardRuleLine."Award Rule No.");
                    AwardRuleLineGroupBy.SETRANGE("Line Type", AwardRuleLine."Line Type"::Source);
                    AwardRuleLineGroupBy.SETRANGE("Document No.", AwardRuleLine."Document No.");
                    AwardRuleLineGroupBy.FINDFIRST;
                END;

                IF AwardRuleLineGroupBy."Group By Fund" THEN BEGIN
                    SETRANGE("Fund No. NVG", "Fund No. NVG");
                    LDB."Fund No." := "Fund No. NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 1" THEN BEGIN
                    SETRANGE("Global Dimension 1 Code", "Global Dimension 1 Code");
                    LDB."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 2" THEN BEGIN
                    SETRANGE("Global Dimension 2 Code", "Global Dimension 2 Code");
                    LDB."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 3" THEN BEGIN
                    SETRANGE("Global Dimension 3 Code NVG", "Global Dimension 3 Code NVG");
                    LDB."Shortcut Dimension 3 Code" := "Global Dimension 3 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 4" THEN BEGIN
                    SETRANGE("Global Dimension 4 Code NVG", "Global Dimension 4 Code NVG");
                    LDB."Shortcut Dimension 4 Code" := "Global Dimension 4 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 5" THEN BEGIN
                    SETRANGE("Global Dimension 5 Code NVG", "Global Dimension 5 Code NVG");
                    LDB."Shortcut Dimension 5 Code" := "Global Dimension 5 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 6" THEN BEGIN
                    SETRANGE("Global Dimension 6 Code NVG", "Global Dimension 6 Code NVG");
                    LDB."Shortcut Dimension 6 Code" := "Global Dimension 6 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 7" THEN BEGIN
                    SETRANGE("Global Dimension 7 Code NVG", "Global Dimension 7 Code NVG");
                    LDB."Shortcut Dimension 7 Code" := "Global Dimension 7 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 8" THEN BEGIN
                    SETRANGE("Global Dimension 8 Code NVG", "Global Dimension 8 Code NVG");
                    LDB."Shortcut Dimension 8 Code" := "Global Dimension 8 Code NVG";
                END;

                CALCSUMS(Amount);
                AppliedAmount := Amount;

                IF (AppliedAmount > AwardRuleLineDetail."Maximum Amount") AND (AwardRuleLineDetail."Maximum Amount" <> 0) THEN
                    AppliedAmount := AwardRuleLineDetail."Maximum Amount";
                IF AwardRuleLineDetail.Operation = AwardRuleLineDetail.Operation::"-" THEN
                    AppliedAmount := -AppliedAmount;

                LDB.Amount := AppliedAmount;
                LDB."Transaction Type" := "Transaction Type NVG";
                InsertLineDistributionBuffer(LDB);

                IF AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source THEN
                    TotalSourceAmount += LDB.Amount;
                IF AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Limits THEN
                    LimitAmount += LDB.Amount;

                DELETEALL;
                SetInitialFilters(TempGLEntry);
            UNTIL NOT FINDFIRST;
        END;
    end;

    // [Scope('Internal')]
    procedure InitLineDistributionBuffer(var LDB: Record "Line Distribution Buffer NVG")
    begin
        LDB.INIT;
        LDB."Internal Control No." := GLTranManagement.GenerateICN;
        LDB."Award No." := Award."No.";
        LDB."Table ID" := DATABASE::"Award Rule Header NVG";
        LDB."Process Date" := TODAY;
        LDB."Posting Date" := PostingDate;
        LDB."Document No." := AwardRuleLine."Document No.";
        LDB."Allocation No." := AwardRuleLine."Award Rule No.";
        LDB.Description := AwardRuleLine.Description;
        LDB."Award Rate Line Type" := AwardRuleLine."Line Type";
        LDB."Award Rate Code NVG" := AwardRuleLine."Award Rate Code NVG";

        IF AwardRuleLineDetail.Description <> '' THEN
            LDB.Description := AwardRuleLineDetail.Description;

        CASE Award."Award Dimension No." - 1 OF
            0:
                LDB."Fund No." := Award."Award Dimension Value";
            1:
                LDB."Shortcut Dimension 1 Code" := Award."Award Dimension Value";
            2:
                LDB."Shortcut Dimension 2 Code" := Award."Award Dimension Value";
            3:
                LDB."Shortcut Dimension 3 Code" := Award."Award Dimension Value";
            4:
                LDB."Shortcut Dimension 4 Code" := Award."Award Dimension Value";
            5:
                LDB."Shortcut Dimension 5 Code" := Award."Award Dimension Value";
            6:
                LDB."Shortcut Dimension 6 Code" := Award."Award Dimension Value";
            7:
                LDB."Shortcut Dimension 7 Code" := Award."Award Dimension Value";
            8:
                LDB."Shortcut Dimension 8 Code" := Award."Award Dimension Value";
        END;
    end;

    // [Scope('Internal')]
    procedure InsertLineDistributionBuffer(var LDB: Record "Line Distribution Buffer NVG")
    var
        AppliedAmount: Decimal;
    begin
        LDB."Line No." := Counter;
        LDB.INSERT;
        Counter := Counter + 10000;
    end;

    // [Scope('Internal')]
    procedure SetDates(AwardRuleLine: Record "Award Rule Line NVG")
    begin
        WITH AwardRuleLine DO BEGIN
            IF "Period Type" = "Period Type"::Specific THEN BEGIN
                TESTFIELD("From Date");
                TESTFIELD("To Date");
                StartDate := "From Date";
                EndDate := "To Date";
            END ELSE
                AVManagement.GetDateRange("Period Type", PostingDate, StartDate, EndDate);
        END;
    end;

    // [Scope('Internal')]
    procedure SetDatesDetail(AwardRuleLineDetail: Record "Award Rule Line Detail NVG")
    begin
        WITH AwardRuleLineDetail DO BEGIN
            IF "Period Type" = "Period Type"::Specific THEN BEGIN
                TESTFIELD("From Date");
                TESTFIELD("To Date");
                StartDate := "From Date";
                EndDate := "To Date";
            END ELSE
                AVManagement.GetDateRange("Period Type", PostingDate, StartDate, EndDate);
        END;
    end;

    // [Scope('Internal')]
    procedure SetOptions(pPostingDate: Date; pPosttoGL: Boolean)
    begin
        PostingDate := pPostingDate;
        PosttoGL := pPosttoGL;
    end;

    // [Scope('Internal')]
    procedure GenerateSourceIC()
    var
        LineDistributionBufferSource2: Record "Line Distribution Buffer NVG" temporary;
    begin
        IF NOT TempCompany.FINDSET(FALSE, FALSE) THEN
            EXIT;

        WITH AwardRuleLine DO BEGIN
            SETRANGE("Award Rule No.", SelectRuleCode);
            SETRANGE("Line Type", "Line Type"::Source);
            IF NOT FINDSET(FALSE, FALSE) THEN
                EXIT;
            CALCFIELDS("No. of Detail Lines");
            IF "No. of Detail Lines" = 0 THEN
                ERROR(SNText007, SelectRuleCode, AwardRuleLine."Document No.");

            REPEAT
                AwardRuleLineDetail.SETRANGE("Award Rule No.", "Award Rule No.");
                AwardRuleLineDetail.SETRANGE("Line Type", "Line Type");
                AwardRuleLineDetail.SETRANGE("Award Rule Line No.", "Line No.");
                AwardRuleLineDetail.FINDSET(FALSE, FALSE);
                REPEAT
                    SetDatesDetail(AwardRuleLineDetail);
                    TempCompany.FINDSET(FALSE, FALSE);
                    REPEAT
                        GenerateLineDistribtionBuffIC(LineDistributionBufferSource2, TempCompany.Name);
                        ComputeMatrixAddition(LineDistributionBufferSource, LineDistributionBufferSource2);
                    UNTIL TempCompany.NEXT = 0;
                UNTIL AwardRuleLineDetail.NEXT = 0;
            UNTIL NEXT = 0;
        END;

        CLEAR(AwardRuleLineDetail);
    end;

    // [Scope('Internal')]
    procedure GenerateLineDistribtionBuffIC(var LDB: Record "Line Distribution Buffer NVG"; var TempCompanyName: Text[80])
    var
        GLSetupIC: Record "General Ledger Setup";
        GLEntry: Record "G/L Entry";
        TempGLEntry: Record "G/L Entry" temporary;
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
        AppliedAmount: Decimal;
    begin
        GLSetupIC.CHANGECOMPANY(TempCompanyName);
        GLSetupIC.GET;
        GLSetupIC.TESTFIELD("LCY Code");

        WITH GLEntry DO BEGIN

            CHANGECOMPANY(TempCompanyName);

            SETCURRENTKEY("Transaction Type NVG", "Fund No. NVG", "Global Dimension 1 Code", "Global Dimension 2 Code");
            SetInitialFilters(GLEntry);

            IF NOT FINDSET(FALSE, FALSE) THEN
                EXIT;

            REPEAT
                TempGLEntry := GLEntry;
                TempGLEntry.INSERT;
            UNTIL NEXT = 0;
        END;

        WITH TempGLEntry DO BEGIN
            REPEAT
                SetInitialFilters(TempGLEntry);
                InitLineDistributionBuffer(LDB);
                LDB."Inter-Company Name" := TempCompanyName;

                IF AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source THEN BEGIN
                    AwardRuleLineGroupBy := AwardRuleLine
                END ELSE BEGIN
                    AwardRuleLineGroupBy.RESET;
                    AwardRuleLineGroupBy.SETRANGE("Award Rule No.", AwardRuleLine."Award Rule No.");
                    AwardRuleLineGroupBy.SETRANGE("Line Type", AwardRuleLine."Line Type"::Source);
                    AwardRuleLineGroupBy.SETRANGE("Document No.", AwardRuleLine."Document No.");
                    AwardRuleLineGroupBy.FINDFIRST;
                END;

                IF AwardRuleLineGroupBy."Group By Fund" THEN BEGIN
                    SETRANGE("Fund No. NVG", "Fund No. NVG");
                    LDB."Fund No." := "Fund No. NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 1" THEN BEGIN
                    SETRANGE("Global Dimension 1 Code", "Global Dimension 1 Code");
                    LDB."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 2" THEN BEGIN
                    SETRANGE("Global Dimension 2 Code", "Global Dimension 2 Code");
                    LDB."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 3" THEN BEGIN
                    SETRANGE("Global Dimension 3 Code NVG", "Global Dimension 3 Code NVG");
                    LDB."Shortcut Dimension 3 Code" := "Global Dimension 3 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 4" THEN BEGIN
                    SETRANGE("Global Dimension 4 Code NVG", "Global Dimension 4 Code NVG");
                    LDB."Shortcut Dimension 4 Code" := "Global Dimension 4 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 5" THEN BEGIN
                    SETRANGE("Global Dimension 5 Code NVG", "Global Dimension 5 Code NVG");
                    LDB."Shortcut Dimension 5 Code" := "Global Dimension 5 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 6" THEN BEGIN
                    SETRANGE("Global Dimension 6 Code NVG", "Global Dimension 6 Code NVG");
                    LDB."Shortcut Dimension 6 Code" := "Global Dimension 6 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 7" THEN BEGIN
                    SETRANGE("Global Dimension 7 Code NVG", "Global Dimension 7 Code NVG");
                    LDB."Shortcut Dimension 7 Code" := "Global Dimension 7 Code NVG";
                END;
                IF AwardRuleLineGroupBy."Group By Dimension 8" THEN BEGIN
                    SETRANGE("Global Dimension 8 Code NVG", "Global Dimension 8 Code NVG");
                    LDB."Shortcut Dimension 8 Code" := "Global Dimension 8 Code NVG";
                END;

                IF GLSetup."LCY Code" = GLSetupIC."LCY Code" THEN BEGIN
                    CALCSUMS(Amount);
                    AppliedAmount := Amount;
                END ELSE
                    IF GLSetup."LCY Code" = GLSetupIC."Additional Reporting Currency" THEN BEGIN
                        CALCSUMS("Additional-Currency Amount");
                        AppliedAmount := "Additional-Currency Amount";
                    END ELSE BEGIN
                        CALCSUMS(Amount);
                        AppliedAmount := CurrExchRate.ExchangeAmtFCYToLCY(PostingDate, GLSetupIC."LCY Code", Amount,
                                                      CurrExchRate.ExchangeRate(PostingDate, GLSetupIC."LCY Code"));
                    END;

                IF (AppliedAmount > AwardRuleLineDetail."Maximum Amount") AND (AwardRuleLineDetail."Maximum Amount" <> 0) THEN
                    AppliedAmount := AwardRuleLineDetail."Maximum Amount";
                IF AwardRuleLineDetail.Operation = AwardRuleLineDetail.Operation::"-" THEN
                    AppliedAmount := -AppliedAmount;

                LDB.Amount := AppliedAmount;
                LDB."Transaction Type" := "Transaction Type NVG";
                InsertLineDistributionBuffer(LDB);

                IF AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source THEN
                    TotalSourceAmount += LDB.Amount;
                IF AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Limits THEN
                    LimitAmount += LDB.Amount;

                DELETEALL;
                SetInitialFilters(TempGLEntry);
            UNTIL NOT FINDFIRST;

            CHANGECOMPANY(COMPANYNAME);
        END;
    end;

    // [Scope('Internal')]
    procedure GenerateDimensionText(LDB: Record "Line Distribution Buffer NVG")
    var
        Dimension: Record Dimension;
    begin
        DimText := '';

        WITH LDB DO BEGIN
            IF ("Fund No." <> '') AND (AVSetup."Award Dimension No." - 1 <> 0) AND (Award."Award Dimension No." - 1 <> 0) THEN
                DimText := DimText + SNText006 + "Fund No." + ' ';
            IF ("Shortcut Dimension 1 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 1) AND
               (Award."Award Dimension No." - 1 <> 1) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 1 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 1 Code" + ' ';
            END;
            IF ("Shortcut Dimension 2 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 2) AND
               (Award."Award Dimension No." - 1 <> 2) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 2 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 2 Code" + ' ';
            END;
            IF ("Shortcut Dimension 3 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 3) AND
               (Award."Award Dimension No." - 1 <> 3) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 3 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 3 Code" + ' ';
            END;
            IF ("Shortcut Dimension 4 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 4) AND
               (Award."Award Dimension No." - 1 <> 4) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 4 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 4 Code" + ' ';
            END;
            IF ("Shortcut Dimension 5 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 5) AND
               (Award."Award Dimension No." - 1 <> 5) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 5 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 5 Code" + ' ';
            END;
            IF ("Shortcut Dimension 6 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 6) AND
               (Award."Award Dimension No." - 1 <> 6) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 6 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 6 Code" + ' ';
            END;
            IF ("Shortcut Dimension 7 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 7) AND
               (Award."Award Dimension No." - 1 <> 7) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 7 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 7 Code" + ' ';
            END;
            IF ("Shortcut Dimension 8 Code" <> '') AND (AVSetup."Award Dimension No." - 1 <> 8) AND
               (Award."Award Dimension No." - 1 <> 8) THEN BEGIN
                Dimension.GET(GLSetup."Shortcut Dimension 8 Code");
                DimText := DimText + Dimension.Name + ': ' + "Shortcut Dimension 8 Code" + ' ';
            END;
        END;
    end;

    // [Scope('Internal')]
    procedure ComputeMatrixAddition(var Operand1: Record "Line Distribution Buffer NVG" temporary; var Operand2: Record "Line Distribution Buffer NVG" temporary)
    begin
        WITH Operand1 DO BEGIN
            IF Operand2.ISEMPTY THEN
                EXIT;
            Operand2.FINDSET(TRUE, FALSE);
            REPEAT
                SETRANGE("Document No.", Operand2."Document No.");
                SETRANGE("Allocation No.", Operand2."Allocation No.");
                SETRANGE("G/L Account No.", Operand2."G/L Account No.");
                SETRANGE("Fund No.", Operand2."Fund No.");
                SETRANGE("Shortcut Dimension 1 Code", Operand2."Shortcut Dimension 1 Code");
                SETRANGE("Shortcut Dimension 2 Code", Operand2."Shortcut Dimension 2 Code");
                SETRANGE("Shortcut Dimension 3 Code", Operand2."Shortcut Dimension 3 Code");
                SETRANGE("Shortcut Dimension 4 Code", Operand2."Shortcut Dimension 4 Code");
                SETRANGE("Shortcut Dimension 5 Code", Operand2."Shortcut Dimension 5 Code");
                SETRANGE("Shortcut Dimension 6 Code", Operand2."Shortcut Dimension 6 Code");
                SETRANGE("Shortcut Dimension 7 Code", Operand2."Shortcut Dimension 7 Code");
                SETRANGE("Shortcut Dimension 8 Code", Operand2."Shortcut Dimension 8 Code");
                SETRANGE("Inter-Company Name", Operand2."Inter-Company Name");

                IF FINDFIRST THEN BEGIN
                    Amount += Operand2.Amount;
                    MODIFY;
                    RESET;
                END ELSE BEGIN
                    RESET;
                    Operand1 := Operand2;
                    "Line No." := 10000 + COUNT;
                    IF NOT INSERT THEN
                        REPEAT
                            "Line No." += 1;
                        UNTIL INSERT;
                END;
            UNTIL Operand2.NEXT = 0;
            Operand2.DELETEALL
        END;
    end;

    procedure UpdateLimitUsed(AwardRuleLine: Record "Award Rule Line NVG"; LineDistributionBufferRates: Record "Line Distribution Buffer NVG"; AmountToPost: Decimal)
    var
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
    begin
        //TBL1.01
        IF AmountToPost = 0 THEN
            EXIT;

        WITH LineDistributionBufferLimit DO BEGIN
            SETCURRENTKEY("Document No.");
            SETRANGE("Document No.", LineDistributionBufferRates."Document No.");
            SETRANGE("Award Rate Code NVG", LineDistributionBufferRates."Award Rate Code NVG");

            AwardRuleLineGroupBy.RESET;
            AwardRuleLineGroupBy.SETRANGE("Award Rule No.", AwardRuleLine."Award Rule No.");
            AwardRuleLineGroupBy.SETRANGE("Line Type", AwardRuleLine."Line Type"::Source);
            AwardRuleLineGroupBy.SETRANGE("Document No.", AwardRuleLine."Document No.");
            AwardRuleLineGroupBy.FINDFIRST;

            IF AwardRuleLineGroupBy."Group By Fund" THEN
                SETRANGE("Fund No.", LineDistributionBufferRates."Fund No.");
            IF AwardRuleLineGroupBy."Group By Dimension 1" THEN
                SETRANGE("Shortcut Dimension 1 Code", LineDistributionBufferRates."Shortcut Dimension 1 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 2" THEN
                SETRANGE("Shortcut Dimension 2 Code", LineDistributionBufferRates."Shortcut Dimension 2 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 3" THEN
                SETRANGE("Shortcut Dimension 3 Code", LineDistributionBufferRates."Shortcut Dimension 3 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 4" THEN
                SETRANGE("Shortcut Dimension 4 Code", LineDistributionBufferRates."Shortcut Dimension 4 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 5" THEN
                SETRANGE("Shortcut Dimension 5 Code", LineDistributionBufferRates."Shortcut Dimension 5 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 6" THEN
                SETRANGE("Shortcut Dimension 6 Code", LineDistributionBufferRates."Shortcut Dimension 6 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 7" THEN
                SETRANGE("Shortcut Dimension 7 Code", LineDistributionBufferRates."Shortcut Dimension 7 Code");
            IF AwardRuleLineGroupBy."Group By Dimension 8" THEN
                SETRANGE("Shortcut Dimension 8 Code", LineDistributionBufferRates."Shortcut Dimension 8 Code");

            IF FINDFIRST THEN BEGIN
                Percent := Percent + AmountToPost;
                MODIFY;
            END;
        END;
    end;

}


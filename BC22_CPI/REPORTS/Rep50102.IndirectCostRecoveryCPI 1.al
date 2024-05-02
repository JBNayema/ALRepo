report 50104 "Old Indirect Cost Recovery CPI"
{
    // Serenic Navigator - (c)Copyright Serenic Software, Inc. 1999-2013.
    // By opening this object you acknowledge that this object includes confidential information
    // and intellectual property of Serenic Software, Inc., and that this work is protected by US
    // and international copyright laws and agreements.
    // ------------------------------------------------------------------------------------------
    // //   ======= For 500.00 Release =======
    // // 2007/06/13 TF,  DC01570 More GrandPrix functionality.
    // //   ======= For 500.01 Release =======
    // // 2007/09/05 TF,  DC01863 Set GenerateSource StartDate/EndDate based on Detail lines.
    // // 2007/10/09 BT,  DM02700 DC01949 Fixed multi-company loop; Updated FINDSET logic.
    // // 2007/10/10 BT,  DM02699 DC01948 Changed logic to link source and rate lines by ICN.
    // // 2007/10/30 TF,  DC02018 Do not delete $0 entries in ComputeMatrixAddition.
    // // 2007/11/02 BT,  DM02697 DC02052 Added logic to pick up awards based on "award rule processing" on AVSetup.
    // //   ======= For 500.02 Release =======
    // // 2008/03/06 TF,  DC02723 Replace NEXT with Not FINDFIRST.
    // // 2009/01/14 TF,  DC04330 Apply Traditional checks when creating customer target line.
    // // 2009/01/30 TF,  DC04512 Filter Source Company for CompanyName.
    // //   ======= For 500.02.01 Release =======
    // // 2009/05/08 TF,  DC04898 Retrieve Source line to set grouping filters.
    // //   ======= For 600.00 Release =======
    // // 2009/10/01 SM,  Report Layout (RDL) for RTC
    // // 2009/10/09 TF,  DC05577  Layout changes.  Resolved Audit Trail filter issue.
    // // 2009/10/21 DG,  DC05684  Print on two page issue
    // // 2009/10/21 SM,  Report Layout (RDL) for RTC
    // //   ======= For 600.00.01 Release =======
    // // 2009/10/21 TF,  DC05832 Set Document No on target line based on Gen Journal Batch.  Removed Doc No from options tab.
    // //   ======= For 600.01 Release =======
    // // 2010/08/03 TF,  DC06563 Blank Limit Amount if No limit.
    // // 2010/08/17 TF,  BudgetPlan OneNote - Replace Budget Name Code/Filter with Budget Plan No/Filter.
    // // 2010/08/30 TF,  DC06626 Flow "Inter-Company Name" in GenerateTargets.  Filter in CalculatePriorPostings.
    // // 2010/11/17 TF,  DC06770 Removed validates for dimension fields in GenerateTargets.
    // //   ======= For 600.01.01 Release =======
    // // 2011/07/18 DG,  DC07599 Changed calcdate string literals to have <> surrpounding to
    // //   ======= For 600.02 Release =======
    // // 2011/06/13 TF,  DC07537 LDB Key change.
    // // 2011/06/15 TF,  DC07542 Added UpdateDimensions function.
    // // 2011/06/15 DG,  DC07543 Added support for Funder as an entity
    // // 2010/11/17 TF,  DC07605 Set ICN and Posting No. Series in GenerateTargets.
    // // 2011/08/03 TF,  Added SetOptions function for AB testing.
    // // 2012/04/23 ADS, DC08230 DM11731 Renames "Sub Award" to "Subaward"
    // //   ======= For 900.02 Release =======
    // // 2017/03/27 PL,  SCR20727 Prevent No Series from being physically updated
    // //===================================================================================================
    // K1210.00.00 (SCR#28199 DG 2018/03/09) :
    //   Disabled AV code that was clearing Subaward and Restriction dims if Award dim value was not an award
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
            DataItemTableView = where("Indirect Cost Recovery Code" = filter(<> ''), Blocked = filter(<> All), "Document Type" = const(Award));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Indirect Cost Recovery Code", Type, Class;
            column(Indirect_Cost_Allocation_; 'Indirect Cost Allocation')
            {
            }
            column(STRSUBSTNO__For_Month_Ending___1__2__3__DATE2DMY_PostingDate_2__DATE2DMY_PostingDate_1__DATE2DMY_PostingDate_3__; StrSubstNo('For Month Ending: %1/%2/%3', Date2DMY(PostingDate, 2), Date2DMY(PostingDate, 1), Date2DMY(PostingDate, 3)))
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today(), 0, 4))
            {
            }
            column(TIME; Time())
            {
            }
            column(NavigatorManagement_GetUserID; UserId())
            {
            }
            column(Award__No__; "No.")
            {
            }
            column(Award_Name; Name)
            {
            }
            column(Award__Indirect_Cost_Recovery_Code_; "Indirect Cost Recovery Code")
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
            column(Award_NameCaption; FieldCaption(Name))
            {
            }
            column(Award__No__Caption; FieldCaption("No."))
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
                DataItemLink = "Award Rule No." = field("Indirect Cost Recovery Code");
                DataItemTableView = sorting("Award Rule No.", "Line Type", "Line No.") where("Line Type" = const(Rates));
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
                column(DisplayTotal; (Count() = AwardRuleLineCounter) and (LineDistributionBufferRates.Count() = AwardRuleLineDetailCounter))
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
                column(Award_Rule_Line_Award_Rule_No_; "Award Rule No.")
                {
                }
                column(Award_Rule_Line_Line_Type; "Line Type")
                {
                }
                column(Award_Rule_Line_Line_No_; "Line No.")
                {
                }
                dataitem("Integer"; "Integer")
                {
                    DataItemTableView = sorting(Number);
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
                        if Number = 1 then
                            LineDistributionBufferRates.FindSet(false, false)
                        else
                            LineDistributionBufferRates.Next();

                        if RuleRate = 0 then
                            BaseAmount := 0
                        else begin
                            LineDistributionBufferSource.Reset();
                            LineDistributionBufferSource.SetRange("Internal Control No.", LineDistributionBufferRates."Internal Control No.");
                            if LineDistributionBufferSource.FindFirst() then
                                BaseAmount := LineDistributionBufferSource.Amount;
                        end;
                        RuleAmount := LineDistributionBufferRates.Amount;
                        RulePriorPostings := LineDistributionBufferRates.Percent;


                        //TBL1.01
                        IF Number = 1 THEN
                            SaveBlankLimit := BlankLimit;
                        IF Number > 1 THEN
                            BlankLimit := SaveBlankLimit;
                        //LimitAmountText := '';
                        //============

                        if not BlankLimit then begin
                            LimitAmount := CalculateLimit("Award Rule Line NVG", LineDistributionBufferRates);
                        end;

                        if (RuleAmount <= LimitAmount) or BlankLimit then
                            AmountToPost := RuleAmount - RulePriorPostings
                        else
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
                        Clear(BaseAmount);
                        Clear(RuleAmount);
                        Clear(RulePriorPostings);
                        Clear(AmountToPost);

                        LineDistributionBufferRates.Reset();
                        LineDistributionBufferRates.SetRange("Document No.", "Award Rule Line NVG"."Document No.");
                        LineDistributionBufferRates.SetRange("Award Rate Code NVG", "Award Rule Line NVG"."Award Rate Code NVG");
                        if LineDistributionBufferRates.Count() = 0 then
                            CurrReport.Break();

                        SetRange(Number, 1, LineDistributionBufferRates.Count());
                        AwardRuleLineDetailCounter := 0;

                        //TBL1.01 - Not in v 22.5 -NM
                        LineDistributionBufferLimit.RESET;
                        LineDistributionBufferLimit.MODIFYALL(Percent, 0);
                        //NM
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    AwardRuleHeader.Get("Award Rule No.");
                    if AwardRuleHeader.Blocked then
                        CurrReport.Skip();
                    AwardRuleHeader.CalcFields("Customer Target Lines Exist");

                    RuleRate := 100;
                    if Amount <> 0 then begin
                        RuleRate := Amount
                    end else begin
                        AwardRate.SetRange("Award No.", "Award"."No.");
                        AwardRate.SetRange("Award Rate Code NVG", "Award Rate Code NVG");
                        AwardRate.SetRange("Effective Date", 0D, PostingDate);
                        AwardRate.FindLast();
                        RuleRate := AwardRate.Amount;
                    end;

                    GenerateTargets();
                    AwardRuleLineCounter := AwardRuleLineCounter + 1;
                end;

                trigger OnPreDataItem() //Award Rule Line
                begin
                    Clear(BaseAmount);
                    Clear(RuleAmount);
                    Clear(RulePriorPostings);
                    Clear(AmountToPost);
                    AwardRuleLineCounter := 0;
                    BaseAmountGroupTotal := 0;
                    RuleAmountGroupTotal := 0;
                    RulePriorPostingsGroupTotal := 0;
                    AmountToPostGroupTotal := 0;

                    //TBL1.00
                    SETRANGE("Award Rule No.", Award."Indirect Cost Recovery Code");
                    IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
                        SETRANGE("Award Rule No.", Award."Indirect Cost Recovery Code 2");
                    IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
                        SETRANGE("Award Rule No.", Award."IDC Provisional Code");
                    IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
                        SETRANGE("Award Rule No.", Award."IDC Provisional Code 2");
                end;
            }
            dataitem(AuditHeader; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                dataitem(SourceAudit; "Integer")
                {
                    DataItemTableView = sorting(Number);
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
                        if Number = 1 then
                            LineDistributionBufferSource.FindSet(false, false)
                        else
                            LineDistributionBufferSource.Next();

                        GenerateDimensionText(LineDistributionBufferSource);
                    end;

                    trigger OnPreDataItem()
                    begin
                        LineDistributionBufferSource.Reset();
                        SetRange(Number, 1, LineDistributionBufferSource.Count());
                    end;
                }
                dataitem(RateAudit; "Integer")
                {
                    DataItemTableView = sorting(Number);
                    column(LineDistributionBufferRates__Document_No__; LineDistributionBufferRates."Document No.")
                    {
                    }
                    column(LineDistributionBufferRates__Award_Rate_Code_; LineDistributionBufferRates."Award Rate Code NVG")
                    {
                    }
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
                        if Number = 1 then
                            LineDistributionBufferRates.FindSet(false, false)
                        else
                            LineDistributionBufferRates.Next();

                        GenerateDimensionText(LineDistributionBufferRates);
                    end;

                    trigger OnPreDataItem()
                    begin
                        LineDistributionBufferRates.Reset();
                        SetRange(Number, 1, LineDistributionBufferRates.Count());
                    end;
                }
                dataitem(LimitAudit; "Integer")
                {
                    DataItemTableView = sorting(Number);
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
                        if Number = 1 then
                            LineDistributionBufferLimit.FindSet(false, false)
                        else
                            LineDistributionBufferLimit.Next();

                        GenerateDimensionText(LineDistributionBufferLimit);
                    end;

                    trigger OnPreDataItem()
                    begin
                        LineDistributionBufferLimit.Reset();
                        SetRange(Number, 1, LineDistributionBufferLimit.Count());
                    end;
                }

                trigger OnPreDataItem()
                begin
                    if not AuditTrail then
                        CurrReport.Break();
                end;
            }

            trigger OnAfterGetRecord()
            begin
                LineDistributionBufferSource.Reset();
                LineDistributionBufferSource.DeleteAll();
                LineDistributionBufferSource."Award No." := "No.";
                LineDistributionBufferRates.Reset();
                LineDistributionBufferRates.DeleteAll();
                LineDistributionBufferRates."Award No." := LineDistributionBufferSource."Award No.";
                LineDistributionBufferLimit.Reset();
                LineDistributionBufferLimit.DeleteAll();
                LineDistributionBufferLimit."Award No." := LineDistributionBufferSource."Award No.";
                Counter := 10000;

                // TBLIC
                //AVManagement.BuildICList("No.",TempCompany,TRUE);
                //TBLIC End
                AwardRuleLine.RESET;
                AwardRuleLine.SETRANGE("Award Rule No.", Award."Indirect Cost Recovery Code");


                //TBL1.00
                IDCCode := "Indirect Cost Recovery Code";
                IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN BEGIN
                    AwardRuleLine.SETRANGE("Award Rule No.", Award."Indirect Cost Recovery Code 2");
                    IDCCode := "Indirect Cost Recovery Code 2";
                END;
                IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN BEGIN
                    AwardRuleLine.SETRANGE("Award Rule No.", Award."IDC Provisional Code");
                    IDCCode := "IDC Provisional Code";
                END;
                IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN BEGIN
                    AwardRuleLine.SETRANGE("Award Rule No.", Award."IDC Provisional Code 2");
                    IDCCode := "IDC Provisional Code 2";
                END;
                //TBL1.00


                TotalSourceAmount := 0;
                CheckLines;
                GenerateSource;

                //TBLIC blocked
                //GenerateSourceIC;
                //TBLIC End

                IF LineDistributionBufferSource.COUNT = 0 THEN
                    CurrReport.SKIP;
                ComputeRates;
                GenerateLimits;

                IF NOT FirstAward AND AuditTrail AND AuditTrailNewPage THEN
                    CurrReport.NewPage();
                FirstAward := FALSE;

                // "AVManagement NVG".BuildICList("No.", TempCompany, true);

                // AwardRuleLine.Reset();
                // AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");

                // TotalSourceAmount := 0;
                // CheckLines();
                // GenerateSource();
                // GenerateSourceIC();
                // if LineDistributionBufferSource.Count() = 0 then
                //     CurrReport.Skip();
                // ComputeRates();
                // GenerateLimits();

                //if not FirstAward and AuditTrail and AuditTrailNewPage then
                //CurrReport.NewPage();
                // FirstAward := false;
            end;

            trigger OnPostDataItem()
            begin
                UpdateOrigNoSeriesNo(GenJnlBatch."No. Series", PostingDate, 1);  //Navigator
            end;

            trigger OnPreDataItem() //Award
            begin
                CompanyInformation.Get();
                AVSetup.Get();
                GLSetup.Get();
                FirstAward := true;
                OrigNoSeriesNo := '';  //Navigator

                SetRange("Source Company Name", CompanyName());


                //TBL1.00
                IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
                    SETFILTER("Indirect Cost Recovery Code 2", '<>%1', '');
                IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
                    SETFILTER("IDC Provisional Code", '<>%1', '');
                IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
                    SETFILTER("IDC Provisional Code 2", '<>%1', '');
                //TBL1.00

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
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            if (Date2DMY(PostingDate, 2) < 12) and (Date2DMY(PostingDate + 1, 2) <> Date2DMY(PostingDate, 2) + 1) then
                                Error(SNText005);
                            if (Date2DMY(PostingDate, 2) = 12) and (Date2DMY(PostingDate + 1, 2) <> 1) then
                                Error(SNText005);
                        end;
                    }
                    field(PosttoGL; PosttoGL)
                    {
                        Caption = 'Write to Gen. Journal';
                        ApplicationArea = All;
                    }
                    field(AuditTrail; AuditTrail)
                    {
                        Caption = 'Audit Trail';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            AuditTrailNewPage := AuditTrail;
                            NewPageEnable := AuditTrail;
                        end;
                    }
                    field(AuditTrailNewPage; AuditTrailNewPage)
                    {
                        Caption = 'New Page per Award';
                        Enabled = NewPageEnable;
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        if PostingDate = 0D then
            Error(SNText002);

        EndDate := PostingDate;
        StartDate := CalcDate('<-1M>', PostingDate + 1)
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
        "AVManagement NVG": Codeunit AVManagementNVG;
        "FundManagement NVG": Codeunit FundManagementNVG;
        "GLTranManagement NVG": Codeunit GLTranManagementNVG;
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
        OrigNoSeriesNo: Code[10];


        // ---CPI---
        SaveBlankLimit: Boolean;
        IDCCode: Code[10];

        IDCSelection: Option "Indirect Cost Recovery Code","Indirect Cost Recovery Code 2","IDC Provisional Code","IDC Provisional Code 2";


    procedure CheckLines()
    begin
        AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");


        //TBL1.00
        IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."Indirect Cost Recovery Code 2");
        IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code");
        IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code 2");
        //TBL1.00

        if not AwardRuleLine.FindSet(false, false) then
            exit;

        repeat
            if AwardRuleLine."Document No." = '' then
                Error(SNText004, AwardRuleLine."Award Rule No.", AwardRuleLine."Line Type");
        until AwardRuleLine.Next() = 0;
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

    procedure IsExpenseAccount(AwardRuleLine: Record "Award Rule Line NVG"): Boolean
    var
        GLAccount: Record "G/L Account";
    begin
        IF AwardRuleLine."Account Type" <> AwardRuleLine."Account Type"::"G/L Account" THEN
            EXIT(FALSE);
        IF AwardRuleLine."Account No. Filter" = '' THEN
            EXIT(FALSE);

        WITH GLAccount DO BEGIN
            SETFILTER("No.", AVSetup."Expense Account Filter");
            "No." := AwardRuleLine."Account No. Filter";
            EXIT(FIND('='));
        END;

    end;

    procedure GenerateSource()
    var
        LineDistributionBufferSource2: Record "Line Distribution Buffer NVG" temporary;
    begin
        //AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");

        //TBL1.00
        IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."Indirect Cost Recovery Code 2");
        IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code");
        IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code 2");
        //TBL1.00

        AwardRuleLine.SetRange("Line Type", AwardRuleLine."Line Type"::Source);
        if not AwardRuleLine.FindSet(false, false) then
            exit;

        AwardRuleLine.CalcFields("No. of Detail Lines");
        if AwardRuleLine."No. of Detail Lines" = 0 then
         //TBL1.00
         // Error(SNText007, Award."Indirect Cost Recovery Code", AwardRuleLine."Document No.");
         BEGIN
            IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code" THEN
                ERROR(SNText007, Award."Indirect Cost Recovery Code", AwardRuleLine."Document No.");
            IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
                ERROR(SNText007, Award."Indirect Cost Recovery Code 2", AwardRuleLine."Document No.");
            IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
                ERROR(SNText007, Award."IDC Provisional Code", AwardRuleLine."Document No.");
            IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
                ERROR(SNText007, Award."IDC Provisional Code 2", AwardRuleLine."Document No.");
        END;
        //TBL1.00

        repeat
            AwardRuleLineDetail.SetRange("Award Rule No.", AwardRuleLine."Award Rule No.");
            AwardRuleLineDetail.SetRange("Line Type", AwardRuleLine."Line Type");
            AwardRuleLineDetail.SetRange("Award Rule Line No.", AwardRuleLine."Line No.");
            AwardRuleLineDetail.FindSet(false, false);
            repeat
                SetDatesDetail(AwardRuleLineDetail);
                GenerateLineDistribtionBuffer(LineDistributionBufferSource2);
                ComputeMatrixAddition(LineDistributionBufferSource, LineDistributionBufferSource2);
            until AwardRuleLineDetail.Next() = 0;
        until AwardRuleLine.Next() = 0;

        Clear(AwardRuleLineDetail);
    end;

    procedure ComputeRates()
    var
        AwardRate: Record "Award Rate NVG";
    begin
        // AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");

        //TBL1.00
        IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."Indirect Cost Recovery Code 2");
        IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code");
        IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code 2");
        //TBL1.00

        AwardRuleLine.SetRange("Line Type", AwardRuleLine."Line Type"::Rates);
        if not AwardRuleLine.FindSet(false, false) then
            exit;

        repeat
            InitLineDistributionBuffer(LineDistributionBufferRates);
            LineDistributionBufferRates."Document No." := AwardRuleLine."Document No.";
            LineDistributionBufferRates."Award Rate Code NVG" := AwardRuleLine."Award Rate Code NVG";

            LineDistributionBufferSource.SetCurrentKey("Award No.");
            LineDistributionBufferSource.SetRange("Award No.", LineDistributionBufferSource."Award No.");
            LineDistributionBufferSource.SetRange("Document No.", AwardRuleLine."Document No.");
            if LineDistributionBufferSource.FindSet(false, false) then
                repeat
                    LineDistributionBufferRates."Internal Control No." := LineDistributionBufferSource."Internal Control No.";
                    LineDistributionBufferRates."Source Currency Amount" := LineDistributionBufferSource.Amount; // Audit
                    LineDistributionBufferRates."Inter-Company Name" := LineDistributionBufferSource."Inter-Company Name";
                    if AwardRuleLine.Amount <> 0 then begin
                        LineDistributionBufferRates.Amount := Round(LineDistributionBufferSource.Amount * AwardRuleLine.Amount / 100);
                        LineDistributionBufferRates."Currency Factor" := AwardRuleLine.Amount;    // Audit
                    end else begin
                        AwardRate.SetRange("Award No.", "Award"."No.");
                        AwardRate.SetRange("Award Rate Code NVG", AwardRuleLine."Award Rate Code NVG");
                        AwardRate.SetRange("Effective Date", 0D, PostingDate);
                        AwardRate.FindLast();
                        LineDistributionBufferRates.Amount := Round(LineDistributionBufferSource.Amount * AwardRate.Amount / 100);
                        LineDistributionBufferRates."Currency Factor" := AwardRate.Amount;  // Audit
                    end;

                    LineDistributionBufferRates."Fund No." := LineDistributionBufferSource."Fund No.";
                    LineDistributionBufferRates."Shortcut Dimension 1 Code" := LineDistributionBufferSource."Shortcut Dimension 1 Code";
                    LineDistributionBufferRates."Shortcut Dimension 2 Code" := LineDistributionBufferSource."Shortcut Dimension 2 Code";
                    LineDistributionBufferRates."Shortcut Dimension 3 Code" := LineDistributionBufferSource."Shortcut Dimension 3 Code";
                    LineDistributionBufferRates."Shortcut Dimension 4 Code" := LineDistributionBufferSource."Shortcut Dimension 4 Code";
                    LineDistributionBufferRates."Shortcut Dimension 5 Code" := LineDistributionBufferSource."Shortcut Dimension 5 Code";
                    LineDistributionBufferRates."Shortcut Dimension 6 Code" := LineDistributionBufferSource."Shortcut Dimension 6 Code";
                    LineDistributionBufferRates."Shortcut Dimension 7 Code" := LineDistributionBufferSource."Shortcut Dimension 7 Code";
                    LineDistributionBufferRates."Shortcut Dimension 8 Code" := LineDistributionBufferSource."Shortcut Dimension 8 Code";

                    if AwardRuleLine."Reduce by Prior Postings" then
                        LineDistributionBufferRates.Percent := CalculatePriorPostings(AwardRuleLine, LineDistributionBufferSource);

                    if (LineDistributionBufferRates.Amount <> 0) or (LineDistributionBufferRates.Percent <> 0) then
                        InsertLineDistributionBuffer(LineDistributionBufferRates);

                until LineDistributionBufferSource.Next() = 0;
        until AwardRuleLine.Next() = 0;
    end;

    procedure GenerateLimits()
    begin
        // AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");

        //TBL1.00
        IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."Indirect Cost Recovery Code 2");
        IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code");
        IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code 2");
        //TBL1.00

        AwardRuleLine.SetRange("Line Type", AwardRuleLine."Line Type"::Limits);
        LimitAmount := 0;
        BlankLimit := false;

        if not AwardRuleLine.FindSet(false, false) then begin
            BlankLimit := true;
            exit;
        end;

        repeat
            SetDates(AwardRuleLine);
            GenerateLineDistribtionBuffer(LineDistributionBufferLimit);
        until AwardRuleLine.Next() = 0;
    end;

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
        // AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");

        //TBL1.00
        IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."Indirect Cost Recovery Code 2");
        IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code");
        IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code 2");
        //TBL1.00

        AwardRuleLine.SetRange("Line Type", AwardRuleLine."Line Type"::Target);
        AwardRuleLine.SetRange("Award Rate Code NVG", "Award Rule Line NVG"."Award Rate Code NVG");
        AwardRuleLine.SetRange("Document No.", "Award Rule Line NVG"."Document No.");
        if not AwardRuleLine.FindSet(false, false) then begin
            Message(SNText003, Award."Invoice Rule Code", "Award Rule Line NVG"."Award Rate Code NVG", "Award Rule Line NVG"."Document No.");
            exit;
        end;
        PreviousTargetDocumentNo := '';
        LineInserted := false;

        repeat
            if PreviousTargetDocumentNo <> AwardRuleLine."Document No." then begin
                //*Navigator begin
                //if LineInserted then begin
                //  DocNo := NoSeriesManagement.GetNextNo(GenJnlBatch."No. Series",PostingDate,true);
                //  LineInserted := false;
                //end;
                //*Navigator end
                GenJnlBatch.Get(AwardRuleLine."Journal Template Name", AwardRuleLine."Journal Batch Name");
                GenJnlBatch.TestField("No. Series");
                //Navigator begin
                if OrigNoSeriesNo = '' then
                    UpdateOrigNoSeriesNo(GenJnlBatch."No. Series", PostingDate, 0);
                //Navigator end
                DocNo := NoSeriesManagement.GetNextNo(GenJnlBatch."No. Series", PostingDate, false);
            end;
            PreviousTargetDocumentNo := AwardRuleLine."Document No.";

            GenJnlLine.LockTable();
            GenJnlLine.SetRange("Journal Template Name", AwardRuleLine."Journal Template Name");
            GenJnlLine.SetRange("Journal Batch Name", AwardRuleLine."Journal Batch Name");
            LineNo := 10000;
            if GenJnlLine.FindLast() then;
            LineNo += GenJnlLine."Line No.";

            GenJnlLine.Init();
            GenJnlLine.Validate("Journal Template Name", AwardRuleLine."Journal Template Name");
            GenJnlLine.Validate("Journal Batch Name", AwardRuleLine."Journal Batch Name");
            GenJnlLine."Line No." := LineNo;

            GenJnlTemplate.Get(AwardRuleLine."Journal Template Name");
            GenJnlLine."Source Code" := GenJnlTemplate."Source Code";
            GenJnlBatch.Get(AwardRuleLine."Journal Template Name", AwardRuleLine."Journal Batch Name");

            GenJnlLine."Status NVG" := GenJnlLine."Status NVG"::New;
            GenJnlLine.Validate("Posting Date", PostingDate);
            GenJnlLine."Transaction Type NVG" := GenJnlTemplate."Transaction Type NVG";
            GenJnlLine."Document No." := DocNo;
            GenJnlLine."Posting No. Series" := GenJnlBatch."Posting No. Series";
            if GenJnlLine."Posting No. Series" = '' then begin
                GenJnlLine."Posting No. Series" := GenJnlTemplate."Posting No. Series";
            end;

            if AwardRuleHeader."Customer Target Lines Exist" then
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;

            GenJnlLine."Account Type" := "Gen. Journal Account Type".FromInteger(AwardRuleLine."Account Type");
            if (AwardRuleLine."Account Type" = AwardRuleLine."Account Type"::Customer) and (AwardRuleLine."Account No. Filter" = '') then begin
                Award.TestField("Sponsoring Funder No.");
                Funder.Get(Award."Sponsoring Funder No.");
                Funder.CalcFields("Customer No.");
                Funder.TestField("Customer No.");
                GenJnlLine.Validate("Account No.", Funder."Customer No.");
            end else
                GenJnlLine.Validate("Account No.", AwardRuleLine."Account No. Filter");

            LineDistributionBufferRates.Reset();
            LineDistributionBufferRates.SetCurrentKey("Award No.");
            LineDistributionBufferRates.SetRange("Award No.", LineDistributionBufferRates."Award No.");
            LineDistributionBufferRates.SetRange("Document No.", AwardRuleLine."Document No.");
            LineDistributionBufferRates.SetRange("Award Rate Code NVG", "Award Rule Line NVG"."Award Rate Code NVG");
            if LineDistributionBufferRates.FindSet(false, false) then
                repeat
                    GenJnlLine."Line No." := LineNo;
                    LineNo += 10000;

                    RuleAmount := LineDistributionBufferRates.Amount;
                    PriorPostAmount := LineDistributionBufferRates.Percent;

                    if not BlankLimit then begin
                        LimitAmount := CalculateLimit("Award Rule Line NVG", LineDistributionBufferRates);
                    end;

                    if (RuleAmount <= LimitAmount) or BlankLimit then
                        AmountToPost := RuleAmount - PriorPostAmount
                    else
                        AmountToPost := LimitAmount - PriorPostAmount;

                    //TBL1.01
                    IF NOT BlankLimit THEN
                        UpdateLimitUsed("Award Rule Line NVG", LineDistributionBufferRates, AmountToPost);
                    BlankLimit := SaveBlankLimit;
                    //====================


                    if AwardRuleLine.Operation = AwardRuleLine.Operation::"+" then begin
                        GenJnlLine.Validate(Amount, AmountToPost);
                        GenJnlLine."Post to AV NVG" := true;
                    end else begin
                        GenJnlLine.Validate(Amount, -AmountToPost);
                        GenJnlLine."Post to AV NVG" := false;
                    end;

                    if GenJnlLine."Document Type" = GenJnlLine."Document Type"::Invoice then begin
                        if (GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account") and (GenJnlLine.Amount > 0) then
                            GenJnlLine."Document Type" := GenJnlLine."Document Type"::"Credit Memo";
                        if (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) and (GenJnlLine.Amount < 0) then
                            GenJnlLine."Document Type" := GenJnlLine."Document Type"::"Credit Memo";
                    end;

                    GenJnlLine.Description := AwardRuleLine.Description;
                    GenJnlLine."External Document No." := AwardRuleLine."Document No.";
                    GenJnlLine."System-Created Entry" := true;
                    if GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer then
                        GenJnlLine."Applies-to ID" := "Award"."No.";

                    if (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) and
                       (not "FundManagement NVG".CheckARDistributed()) and (not "FundManagement NVG".CheckAREditable()) then begin
                        if AwardRuleLine."Fund Filter" <> '' then begin
                            Error(SNText008, "Award"."No.", AwardRuleLine."Award Rule No.")
                        end;
                    end;

                    if AwardRuleLine."Fund Filter" <> '' then
                        GenJnlLine.Validate("Fund No. NVG", AwardRuleLine."Fund Filter")
                    else
                        if "FundManagement NVG".CheckARDistributed() or (GenJnlLine."Account Type" <> GenJnlLine."Account Type"::Customer) then begin
                            if LineDistributionBufferRates."Fund No." <> '' then
                                GenJnlLine.Validate("Fund No. NVG", LineDistributionBufferRates."Fund No.")
                            else
                                GenJnlLine.Validate("Fund No. NVG", Award."Fund No.");
                        end;
                    if AwardRuleLine."Fund Class Filter" <> '' then
                        GenJnlLine.Validate("Fund Class Code NVG", AwardRuleLine."Fund Class Filter");
                    if AwardRuleLine."Shortcut Dimension 1 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 1 Code" := AwardRuleLine."Shortcut Dimension 1 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 1 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 1 Code" := LineDistributionBufferRates."Shortcut Dimension 1 Code"
                        else
                            GenJnlLine."Shortcut Dimension 1 Code" := Award."Global Dimension 1 Code";
                    if AwardRuleLine."Shortcut Dimension 2 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 2 Code" := AwardRuleLine."Shortcut Dimension 2 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 2 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 2 Code" := LineDistributionBufferRates."Shortcut Dimension 2 Code"
                        else
                            GenJnlLine."Shortcut Dimension 2 Code" := Award."Global Dimension 2 Code";
                    if AwardRuleLine."Shortcut Dimension 3 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 3 Code NVG" := AwardRuleLine."Shortcut Dimension 3 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 3 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 3 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 3 Code"
                        else
                            GenJnlLine."Shortcut Dimension 3 Code NVG" := Award."Global Dimension 3 Code";
                    if AwardRuleLine."Shortcut Dimension 4 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 4 Code NVG" := AwardRuleLine."Shortcut Dimension 4 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 4 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 4 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 4 Code"
                        else
                            GenJnlLine."Shortcut Dimension 4 Code NVG" := Award."Global Dimension 4 Code";
                    if AwardRuleLine."Shortcut Dimension 5 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 5 Code NVG" := AwardRuleLine."Shortcut Dimension 5 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 5 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 5 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 5 Code"
                        else
                            GenJnlLine."Shortcut Dimension 5 Code NVG" := Award."Global Dimension 5 Code";
                    if AwardRuleLine."Shortcut Dimension 6 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 6 Code NVG" := AwardRuleLine."Shortcut Dimension 6 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 6 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 6 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 6 Code"
                        else
                            GenJnlLine."Shortcut Dimension 6 Code NVG" := Award."Global Dimension 6 Code";
                    if AwardRuleLine."Shortcut Dimension 7 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 7 Code NVG" := AwardRuleLine."Shortcut Dimension 7 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 7 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 7 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 7 Code"
                        else
                            GenJnlLine."Shortcut Dimension 7 Code NVG" := Award."Global Dimension 7 Code";
                    if AwardRuleLine."Shortcut Dimension 8 Filter" <> '' then
                        GenJnlLine."Shortcut Dimension 8 Code NVG" := AwardRuleLine."Shortcut Dimension 8 Filter"
                    else
                        if LineDistributionBufferRates."Shortcut Dimension 8 Code" <> '' then
                            GenJnlLine."Shortcut Dimension 8 Code NVG" := LineDistributionBufferRates."Shortcut Dimension 8 Code"
                        else
                            GenJnlLine."Shortcut Dimension 8 Code NVG" := Award."Global Dimension 8 Code";

                    WriteAwardDimension := true;
                    if (GenJnlLine."Account Type" = GenJnlLine."Account Type"::Customer) and (not "FundManagement NVG".CheckARDistributed()) then begin
                        if not "FundManagement NVG".CheckAREditable() then
                            WriteAwardDimension := false
                        else
                            if GenJnlLine."Fund No. NVG" <> '' then
                                WriteAwardDimension := false
                    end;

                    if WriteAwardDimension then begin
                        case Award."Award Dimension No." - 1 of
                            0:
                                if LineDistributionBufferRates."Fund No." = '' then
                                    GenJnlLine.Validate("Fund No. NVG", Award."Award Dimension Value");
                            1:
                                if LineDistributionBufferRates."Shortcut Dimension 1 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 1 Code", Award."Award Dimension Value");
                            2:
                                if LineDistributionBufferRates."Shortcut Dimension 2 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 2 Code", Award."Award Dimension Value");
                            3:
                                if LineDistributionBufferRates."Shortcut Dimension 3 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 3 Code NVG", Award."Award Dimension Value");
                            4:
                                if LineDistributionBufferRates."Shortcut Dimension 4 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 4 Code NVG", Award."Award Dimension Value");
                            5:
                                if LineDistributionBufferRates."Shortcut Dimension 5 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 5 Code NVG", Award."Award Dimension Value");
                            6:
                                if LineDistributionBufferRates."Shortcut Dimension 6 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 6 Code NVG", Award."Award Dimension Value");
                            7:
                                if LineDistributionBufferRates."Shortcut Dimension 7 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 7 Code NVG", Award."Award Dimension Value");
                            8:
                                if LineDistributionBufferRates."Shortcut Dimension 8 Code" = '' then
                                    GenJnlLine.Validate("Shortcut Dimension 8 Code NVG", Award."Award Dimension Value");
                        end;
                    end;
                    GenJnlLine."Ctl. Fund No. NVG" := GenJnlBatch."Ctl. Fund No. NVG";
                    GenJnlLine."Award No. NVG" := "Award"."No.";
                    GenJnlLine."Award Rule Type NVG" := GenJnlLine."Award Rule Type NVG"::"Indirect Cost Recovery NVG";
                    GenJnlLine."Inter-Company Name NVG" := '';
                    if LineDistributionBufferRates."Inter-Company Name" <> CompanyName() then
                        GenJnlLine."Inter-Company Name NVG" := LineDistributionBufferRates."Inter-Company Name";
                    GenJnlLine."Internal Control No. NVG" := "GLTranManagement NVG".GenerateICN();
                    UpdateDimensions(GenJnlLine);
                    GenJnlLine."Document Line No. NVG" := GenJnlLine."Line No.";//Navigator
                    if (GenJnlLine.Amount <> 0) and PosttoGL then begin
                        GenJnlLine.Insert(true);
                        LineInserted := true;
                    end;
                until LineDistributionBufferRates.Next() = 0;
        until AwardRuleLine.Next() = 0;

        if LineInserted then begin
            DocNo := NoSeriesManagement.GetNextNo(GenJnlBatch."No. Series", PostingDate, true);
            LineInserted := false;
            //Navigator begin
        end else
            Clear(NoSeriesManagement);
        //Navigator end
    end;

    procedure UpdateDimensions(var GenJnlLine: Record "Gen. Journal Line")
    var
        Award: Record "Award NVG";
        AwardNo: Code[10];
    begin

        case AVSetup."Award Dimension No." - 1 of
            0:
                AwardNo := GenJnlLine."Fund No. NVG";
            1:
                AwardNo := GenJnlLine."Shortcut Dimension 1 Code";
            2:
                AwardNo := GenJnlLine."Shortcut Dimension 2 Code";
            3:
                AwardNo := GenJnlLine."Shortcut Dimension 3 Code NVG";
            4:
                AwardNo := GenJnlLine."Shortcut Dimension 4 Code NVG";
            5:
                AwardNo := GenJnlLine."Shortcut Dimension 5 Code NVG";
            6:
                AwardNo := GenJnlLine."Shortcut Dimension 6 Code NVG";
            7:
                AwardNo := GenJnlLine."Shortcut Dimension 7 Code NVG";
            8:
                AwardNo := GenJnlLine."Shortcut Dimension 8 Code NVG";
        end;
        if not Award.Get(AwardNo) then begin
            case AVSetup."Subaward Dimension No." - 1 of
                1:
                    GenJnlLine."Shortcut Dimension 1 Code" := '';
                2:
                    GenJnlLine."Shortcut Dimension 2 Code" := '';
                3:
                    GenJnlLine."Shortcut Dimension 3 Code NVG" := '';
                4:
                    GenJnlLine."Shortcut Dimension 4 Code NVG" := '';
                5:
                    GenJnlLine."Shortcut Dimension 5 Code NVG" := '';
                6:
                    GenJnlLine."Shortcut Dimension 6 Code NVG" := '';
                7:
                    GenJnlLine."Shortcut Dimension 7 Code NVG" := '';
                8:
                    GenJnlLine."Shortcut Dimension 8 Code NVG" := '';
            end;
            case AVSetup."Restriction Dimension No." - 1 of
                1:
                    GenJnlLine."Shortcut Dimension 1 Code" := '';
                2:
                    GenJnlLine."Shortcut Dimension 2 Code" := '';
                3:
                    GenJnlLine."Shortcut Dimension 3 Code NVG" := '';
                4:
                    GenJnlLine."Shortcut Dimension 4 Code NVG" := '';
                5:
                    GenJnlLine."Shortcut Dimension 5 Code NVG" := '';
                6:
                    GenJnlLine."Shortcut Dimension 6 Code NVG" := '';
                7:
                    GenJnlLine."Shortcut Dimension 7 Code NVG" := '';
                8:
                    GenJnlLine."Shortcut Dimension 8 Code NVG" := '';
            end;
        end;
    end;

    procedure CalculatePriorPostings(AwardRuleLine: Record "Award Rule Line NVG"; LineDistributionBufferSource: Record "Line Distribution Buffer NVG") PriorAmount: Decimal
    var
        GLEntry: Record "G/L Entry";
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
    begin
        SetDates(AwardRuleLine);

        AwardRuleLineGroupBy.Reset();
        AwardRuleLineGroupBy.SetRange("Award Rule No.", AwardRuleLine."Award Rule No.");
        AwardRuleLineGroupBy.SetRange("Line Type", AwardRuleLineGroupBy."Line Type"::Source);
        AwardRuleLineGroupBy.SetRange("Document No.", AwardRuleLine."Document No.");
        AwardRuleLineGroupBy.FindFirst();

        GLEntry.Reset();
        GLEntry.SetCurrentKey("Transaction Type NVG", "Fund No. NVG", "Global Dimension 1 Code", "Global Dimension 2 Code");
        SetInitialFilters(GLEntry);
        if LineDistributionBufferSource."Inter-Company Name" = CompanyName() then begin
            GLEntry.SetFilter("Inter-Company Name NVG", '%1', '');
        end else begin
            GLEntry.SetFilter("Inter-Company Name NVG", '%1', LineDistributionBufferSource."Inter-Company Name");
        end;

        if AwardRuleLineGroupBy."Group By Fund" then
            GLEntry.SetRange("Fund No. NVG", LineDistributionBufferSource."Fund No.");
        if AwardRuleLineGroupBy."Group By Dimension 1" then
            GLEntry.SetRange("Global Dimension 1 Code", LineDistributionBufferSource."Shortcut Dimension 1 Code");
        if AwardRuleLineGroupBy."Group By Dimension 2" then
            GLEntry.SetRange("Global Dimension 2 Code", LineDistributionBufferSource."Shortcut Dimension 2 Code");
        if AwardRuleLineGroupBy."Group By Dimension 3" then
            GLEntry.SetRange("Global Dimension 3 Code NVG", LineDistributionBufferSource."Shortcut Dimension 3 Code");
        if AwardRuleLineGroupBy."Group By Dimension 4" then
            GLEntry.SetRange("Global Dimension 4 Code NVG", LineDistributionBufferSource."Shortcut Dimension 4 Code");
        if AwardRuleLineGroupBy."Group By Dimension 5" then
            GLEntry.SetRange("Global Dimension 5 Code NVG", LineDistributionBufferSource."Shortcut Dimension 5 Code");
        if AwardRuleLineGroupBy."Group By Dimension 6" then
            GLEntry.SetRange("Global Dimension 6 Code NVG", LineDistributionBufferSource."Shortcut Dimension 6 Code");
        if AwardRuleLineGroupBy."Group By Dimension 7" then
            GLEntry.SetRange("Global Dimension 7 Code NVG", LineDistributionBufferSource."Shortcut Dimension 7 Code");
        if AwardRuleLineGroupBy."Group By Dimension 8" then
            GLEntry.SetRange("Global Dimension 8 Code NVG", LineDistributionBufferSource."Shortcut Dimension 8 Code");

        PriorAmount := 0;
        if GLEntry.FindSet(false, false) then begin
            repeat
                PriorAmount := PriorAmount + GLEntry.Amount;
            until GLEntry.Next() = 0;
        end;
        exit(PriorAmount);
    end;

    procedure CalculateLimit(AwardRuleLine: Record "Award Rule Line NVG"; LineDistributionBufferRates: Record "Line Distribution Buffer NVG" temporary) LimitAmount: Decimal
    var
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
    begin
        LimitAmount := 0;

        LineDistributionBufferLimit.SetCurrentKey("Document No.");
        LineDistributionBufferLimit.SetRange("Document No.", LineDistributionBufferRates."Document No.");
        LineDistributionBufferLimit.SetRange("Allocation No.", LineDistributionBufferRates."Allocation No.");

        AwardRuleLineGroupBy.Reset();
        AwardRuleLineGroupBy.SetRange("Award Rule No.", AwardRuleLine."Award Rule No.");
        AwardRuleLineGroupBy.SetRange("Line Type", AwardRuleLine."Line Type"::Source);
        AwardRuleLineGroupBy.SetRange("Document No.", AwardRuleLine."Document No.");
        AwardRuleLineGroupBy.FindFirst();

        if AwardRuleLineGroupBy."Group By Fund" then
            LineDistributionBufferLimit.SetRange("Fund No.", LineDistributionBufferRates."Fund No.");
        if AwardRuleLineGroupBy."Group By Dimension 1" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 1 Code", LineDistributionBufferRates."Shortcut Dimension 1 Code");
        if AwardRuleLineGroupBy."Group By Dimension 2" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 2 Code", LineDistributionBufferRates."Shortcut Dimension 2 Code");
        if AwardRuleLineGroupBy."Group By Dimension 3" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 3 Code", LineDistributionBufferRates."Shortcut Dimension 3 Code");
        if AwardRuleLineGroupBy."Group By Dimension 4" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 4 Code", LineDistributionBufferRates."Shortcut Dimension 4 Code");
        if AwardRuleLineGroupBy."Group By Dimension 5" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 5 Code", LineDistributionBufferRates."Shortcut Dimension 5 Code");
        if AwardRuleLineGroupBy."Group By Dimension 6" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 6 Code", LineDistributionBufferRates."Shortcut Dimension 6 Code");
        if AwardRuleLineGroupBy."Group By Dimension 7" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 7 Code", LineDistributionBufferRates."Shortcut Dimension 7 Code");
        if AwardRuleLineGroupBy."Group By Dimension 8" then
            LineDistributionBufferLimit.SetRange("Shortcut Dimension 8 Code", LineDistributionBufferRates."Shortcut Dimension 8 Code");


        //From 09 TBL Upgrade Test 2017 first

        IF LineDistributionBufferLimit.FINDSET(FALSE, FALSE) THEN BEGIN
            REPEAT
                LimitAmount += LineDistributionBufferLimit.Amount;
                //TBL1.01
                IF LineDistributionBufferLimit.Percent <> 0 THEN  //Reduce Limit by Amount To Post from previous entries.
                    LimitAmount := LimitAmount - LineDistributionBufferLimit.Percent;
            UNTIL LineDistributionBufferLimit.NEXT = 0;
            LimitAmount := ABS(LimitAmount);
        END ELSE BEGIN
            BlankLimit := TRUE;  //TBL1.01
            LimitAmount := -1;
        END;
        //NM Blocked below - v 22.5 STD
        /*  if LineDistributionBufferLimit.FindSet(false, false) then begin
              repeat
                  LimitAmount += LineDistributionBufferLimit.Amount;
              until LineDistributionBufferLimit.Next() = 0;
              LimitAmount := Abs(LimitAmount);
          end;
         */ //NM  
    end;

    procedure SetInitialFilters(var GLEntry: Record "G/L Entry")
    begin
        GLEntry.SetRange("Posting Date", StartDate, EndDate);
        GLEntry.SetRange("Closing Entry NVG", false);

        if AwardRuleLineDetail."Award Rule No." = '' then begin
            GLEntry.SetRange("Transaction Type NVG", AwardRuleLine."Transaction Type");
            GLEntry.SetFilter("G/L Account No.", AwardRuleLine."Account No. Filter");
            GLEntry.SetFilter("Fund No. NVG", AwardRuleLine."Fund Filter");
            GLEntry.SetFilter("Global Dimension 1 Code", AwardRuleLine."Shortcut Dimension 1 Filter");
            GLEntry.SetFilter("Global Dimension 2 Code", AwardRuleLine."Shortcut Dimension 2 Filter");
            GLEntry.SetFilter("Global Dimension 3 Code NVG", AwardRuleLine."Shortcut Dimension 3 Filter");
            GLEntry.SetFilter("Global Dimension 4 Code NVG", AwardRuleLine."Shortcut Dimension 4 Filter");
            GLEntry.SetFilter("Global Dimension 5 Code NVG", AwardRuleLine."Shortcut Dimension 5 Filter");
            GLEntry.SetFilter("Global Dimension 6 Code NVG", AwardRuleLine."Shortcut Dimension 6 Filter");
            GLEntry.SetFilter("Global Dimension 7 Code NVG", AwardRuleLine."Shortcut Dimension 7 Filter");
            GLEntry.SetFilter("Global Dimension 8 Code NVG", AwardRuleLine."Shortcut Dimension 8 Filter");
            GLEntry.SetFilter("Fund Class Code NVG", AwardRuleLine."Fund Class Filter");
            GLEntry.SetFilter("Budget Plan No. NVG", AwardRuleLine."Budget Plan Filter");
        end else begin
            GLEntry.SetRange("Transaction Type NVG", AwardRuleLineDetail."Transaction Type");
            GLEntry.SetFilter("G/L Account No.", AwardRuleLineDetail."Account No. Filter");
            GLEntry.SetFilter("Fund No. NVG", AwardRuleLineDetail."Fund Filter");
            GLEntry.SetFilter("Global Dimension 1 Code", AwardRuleLineDetail."Shortcut Dimension 1 Filter");
            GLEntry.SetFilter("Global Dimension 2 Code", AwardRuleLineDetail."Shortcut Dimension 2 Filter");
            GLEntry.SetFilter("Global Dimension 3 Code NVG", AwardRuleLineDetail."Shortcut Dimension 3 Filter");
            GLEntry.SetFilter("Global Dimension 4 Code NVG", AwardRuleLineDetail."Shortcut Dimension 4 Filter");
            GLEntry.SetFilter("Global Dimension 5 Code NVG", AwardRuleLineDetail."Shortcut Dimension 5 Filter");
            GLEntry.SetFilter("Global Dimension 6 Code NVG", AwardRuleLineDetail."Shortcut Dimension 6 Filter");
            GLEntry.SetFilter("Global Dimension 7 Code NVG", AwardRuleLineDetail."Shortcut Dimension 7 Filter");
            GLEntry.SetFilter("Global Dimension 8 Code NVG", AwardRuleLineDetail."Shortcut Dimension 8 Filter");
            GLEntry.SetFilter("Fund Class Code NVG", AwardRuleLineDetail."Fund Class Filter");
        end;

        case Award."Award Dimension No." - 1 of
            0:
                GLEntry.SetRange("Fund No. NVG", Award."Award Dimension Value");
            1:
                GLEntry.SetRange("Global Dimension 1 Code", Award."Award Dimension Value");
            2:
                GLEntry.SetRange("Global Dimension 2 Code", Award."Award Dimension Value");
            3:
                GLEntry.SetRange("Global Dimension 3 Code NVG", Award."Award Dimension Value");
            4:
                GLEntry.SetRange("Global Dimension 4 Code NVG", Award."Award Dimension Value");
            5:
                GLEntry.SetRange("Global Dimension 5 Code NVG", Award."Award Dimension Value");
            6:
                GLEntry.SetRange("Global Dimension 6 Code NVG", Award."Award Dimension Value");
            7:
                GLEntry.SetRange("Global Dimension 7 Code NVG", Award."Award Dimension Value");
            8:
                GLEntry.SetRange("Global Dimension 8 Code NVG", Award."Award Dimension Value");
        end;
    end;

    procedure GenerateLineDistribtionBuffer(var LDB: Record "Line Distribution Buffer NVG")
    var
        GLEntry: Record "G/L Entry";
        TempGLEntry: Record "G/L Entry" temporary;
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
        AppliedAmount: Decimal;
    begin
        GLEntry.SetCurrentKey("Transaction Type NVG", "Fund No. NVG", "Global Dimension 1 Code", "Global Dimension 2 Code");
        SetInitialFilters(GLEntry);

        if not GLEntry.FindSet(false, false) then
            exit;

        repeat
            TempGLEntry := GLEntry;
            TempGLEntry.Insert();
        until GLEntry.Next() = 0;

        repeat
            SetInitialFilters(TempGLEntry);
            InitLineDistributionBuffer(LDB);
            LDB."Inter-Company Name" := CompanyName();

            if AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source then begin
                AwardRuleLineGroupBy := AwardRuleLine
            end else begin
                AwardRuleLineGroupBy.Reset();
                AwardRuleLineGroupBy.SetRange("Award Rule No.", AwardRuleLine."Award Rule No.");
                AwardRuleLineGroupBy.SetRange("Line Type", AwardRuleLine."Line Type"::Source);
                AwardRuleLineGroupBy.SetRange("Document No.", AwardRuleLine."Document No.");
                AwardRuleLineGroupBy.FindFirst();
            end;

            if AwardRuleLineGroupBy."Group By Fund" then begin
                TempGLEntry.SetRange("Fund No. NVG", TempGLEntry."Fund No. NVG");
                LDB."Fund No." := TempGLEntry."Fund No. NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 1" then begin
                TempGLEntry.SetRange("Global Dimension 1 Code", TempGLEntry."Global Dimension 1 Code");
                LDB."Shortcut Dimension 1 Code" := TempGLEntry."Global Dimension 1 Code";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 2" then begin
                TempGLEntry.SetRange("Global Dimension 2 Code", TempGLEntry."Global Dimension 2 Code");
                LDB."Shortcut Dimension 2 Code" := TempGLEntry."Global Dimension 2 Code";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 3" then begin
                TempGLEntry.SetRange("Global Dimension 3 Code NVG", TempGLEntry."Global Dimension 3 Code NVG");
                LDB."Shortcut Dimension 3 Code" := TempGLEntry."Global Dimension 3 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 4" then begin
                TempGLEntry.SetRange("Global Dimension 4 Code NVG", TempGLEntry."Global Dimension 4 Code NVG");
                LDB."Shortcut Dimension 4 Code" := TempGLEntry."Global Dimension 4 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 5" then begin
                TempGLEntry.SetRange("Global Dimension 5 Code NVG", TempGLEntry."Global Dimension 5 Code NVG");
                LDB."Shortcut Dimension 5 Code" := TempGLEntry."Global Dimension 5 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 6" then begin
                TempGLEntry.SetRange("Global Dimension 6 Code NVG", TempGLEntry."Global Dimension 6 Code NVG");
                LDB."Shortcut Dimension 6 Code" := TempGLEntry."Global Dimension 6 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 7" then begin
                TempGLEntry.SetRange("Global Dimension 7 Code NVG", TempGLEntry."Global Dimension 7 Code NVG");
                LDB."Shortcut Dimension 7 Code" := TempGLEntry."Global Dimension 7 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 8" then begin
                TempGLEntry.SetRange("Global Dimension 8 Code NVG", TempGLEntry."Global Dimension 8 Code NVG");
                LDB."Shortcut Dimension 8 Code" := TempGLEntry."Global Dimension 8 Code NVG";
            end;

            TempGLEntry.CalcSums(Amount);
            AppliedAmount := TempGLEntry.Amount;

            if (AppliedAmount > AwardRuleLineDetail."Maximum Amount") and (AwardRuleLineDetail."Maximum Amount" <> 0) then
                AppliedAmount := AwardRuleLineDetail."Maximum Amount";
            if AwardRuleLineDetail.Operation = AwardRuleLineDetail.Operation::"-" then
                AppliedAmount := -AppliedAmount;

            LDB.Amount := AppliedAmount;
            LDB."Transaction Type" := TempGLEntry."Transaction Type NVG";
            InsertLineDistributionBuffer(LDB);

            if AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source then
                TotalSourceAmount += LDB.Amount;
            if AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Limits then
                LimitAmount += LDB.Amount;

            TempGLEntry.DeleteAll();
            SetInitialFilters(TempGLEntry);
        until not TempGLEntry.FindFirst();
    end;

    procedure InitLineDistributionBuffer(var LDB: Record "Line Distribution Buffer NVG")
    begin
        LDB.Init();
        LDB."Internal Control No." := "GLTranManagement NVG".GenerateICN();
        LDB."Award No." := "Award"."No.";
        LDB."Table ID" := Database::"Award Rule Header NVG";
        LDB."Process Date" := Today();
        LDB."Posting Date" := PostingDate;
        LDB."Document No." := AwardRuleLine."Document No.";
        LDB."Allocation No." := AwardRuleLine."Award Rule No.";
        LDB.Description := AwardRuleLine.Description;
        LDB."Award Rate Line Type" := AwardRuleLine."Line Type";
        LDB."Award Rate Code NVG" := AwardRuleLine."Award Rate Code NVG";

        if AwardRuleLineDetail.Description <> '' then
            LDB.Description := AwardRuleLineDetail.Description;

        case Award."Award Dimension No." - 1 of
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
        end;
    end;

    procedure InsertLineDistributionBuffer(var LDB: Record "Line Distribution Buffer NVG")
    var
        AppliedAmount: Decimal;
    begin
        LDB."Line No." := Counter;
        LDB.Insert();
        Counter := Counter + 10000;
    end;

    procedure SetDates(AwardRuleLine: Record "Award Rule Line NVG")
    begin
        if AwardRuleLine."Period Type" = AwardRuleLine."Period Type"::Specific then begin
            AwardRuleLine.TestField("From Date");
            AwardRuleLine.TestField("To Date");
            StartDate := AwardRuleLine."From Date";
            EndDate := AwardRuleLine."To Date";
        end else
            "AVManagement NVG".GetDateRange(AwardRuleLine."Period Type", PostingDate, StartDate, EndDate);
    end;

    procedure SetDatesDetail(AwardRuleLineDetail: Record "Award Rule Line Detail NVG")
    begin
        if AwardRuleLineDetail."Period Type" = AwardRuleLineDetail."Period Type"::Specific then begin
            AwardRuleLineDetail.TestField("From Date");
            AwardRuleLineDetail.TestField("To Date");
            StartDate := AwardRuleLineDetail."From Date";
            EndDate := AwardRuleLineDetail."To Date";
        end else
            "AVManagement NVG".GetDateRange(AwardRuleLineDetail."Period Type", PostingDate, StartDate, EndDate);
    end;

    procedure SetOptions(pPostingDate: Date; pPosttoGL: Boolean)
    begin
        PostingDate := pPostingDate;
        PosttoGL := pPosttoGL;
    end;

    procedure GenerateSourceIC()
    var
        LineDistributionBufferSource2: Record "Line Distribution Buffer NVG" temporary;
    begin
        if not TempCompany.FindSet(false, false) then
            exit;

        // AwardRuleLine.SetRange("Award Rule No.", Award."Indirect Cost Recovery Code");

        //TBL1.00
        IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."Indirect Cost Recovery Code 2");
        IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code");
        IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
            AwardRuleLine.SETRANGE(AwardRuleLine."Award Rule No.", Award."IDC Provisional Code 2");
        //TBL1.00

        AwardRuleLine.SetRange("Line Type", AwardRuleLine."Line Type"::Source);
        if not AwardRuleLine.FindSet(false, false) then
            exit;

        AwardRuleLine.CalcFields("No. of Detail Lines");
        if AwardRuleLine."No. of Detail Lines" = 0 then
//TBL1.00
//Error(SNText007, Award."Indirect Cost Recovery Code", AwardRuleLine."Document No.");
BEGIN
            IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code" THEN
                ERROR(SNText007, Award."Indirect Cost Recovery Code", AwardRuleLine."Document No.");
            IF IDCSelection = IDCSelection::"Indirect Cost Recovery Code 2" THEN
                ERROR(SNText007, Award."Indirect Cost Recovery Code 2", AwardRuleLine."Document No.");
            IF IDCSelection = IDCSelection::"IDC Provisional Code" THEN
                ERROR(SNText007, Award."IDC Provisional Code", AwardRuleLine."Document No.");
            IF IDCSelection = IDCSelection::"IDC Provisional Code 2" THEN
                ERROR(SNText007, Award."IDC Provisional Code 2", AwardRuleLine."Document No.");
        END;
        //TBL1.00
        repeat
            AwardRuleLineDetail.SetRange("Award Rule No.", AwardRuleLine."Award Rule No.");
            AwardRuleLineDetail.SetRange("Line Type", AwardRuleLine."Line Type");
            AwardRuleLineDetail.SetRange("Award Rule Line No.", AwardRuleLine."Line No.");
            AwardRuleLineDetail.FindSet(false, false);
            repeat
                SetDatesDetail(AwardRuleLineDetail);
                TempCompany.FindSet(false, false);
                repeat
                    GenerateLineDistribtionBuffIC(LineDistributionBufferSource2, TempCompany.Name);
                    ComputeMatrixAddition(LineDistributionBufferSource, LineDistributionBufferSource2);
                until TempCompany.Next() = 0;
            until AwardRuleLineDetail.Next() = 0;
        until AwardRuleLine.Next() = 0;

        Clear(AwardRuleLineDetail);
    end;

    procedure GenerateLineDistribtionBuffIC(var LDB: Record "Line Distribution Buffer NVG"; var TempCompanyName: Text[80])
    var
        GLSetupIC: Record "General Ledger Setup";
        GLEntry: Record "G/L Entry";
        TempGLEntry: Record "G/L Entry" temporary;
        AwardRuleLineGroupBy: Record "Award Rule Line NVG";
        AppliedAmount: Decimal;
    begin
        GLSetupIC.ChangeCompany(TempCompanyName);
        GLSetupIC.Get();
        GLSetupIC.TestField("LCY Code");

        GLEntry.ChangeCompany(TempCompanyName);

        GLEntry.SetCurrentKey("Transaction Type NVG", "Fund No. NVG", "Global Dimension 1 Code", "Global Dimension 2 Code");
        SetInitialFilters(GLEntry);

        if not GLEntry.FindSet(false, false) then
            exit;

        repeat
            TempGLEntry := GLEntry;
            TempGLEntry.Insert();
        until GLEntry.Next() = 0;

        repeat
            SetInitialFilters(TempGLEntry);
            InitLineDistributionBuffer(LDB);
            LDB."Inter-Company Name" := TempCompanyName;

            if AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source then begin
                AwardRuleLineGroupBy := AwardRuleLine
            end else begin
                AwardRuleLineGroupBy.Reset();
                AwardRuleLineGroupBy.SetRange("Award Rule No.", AwardRuleLine."Award Rule No.");
                AwardRuleLineGroupBy.SetRange("Line Type", AwardRuleLine."Line Type"::Source);
                AwardRuleLineGroupBy.SetRange("Document No.", AwardRuleLine."Document No.");
                AwardRuleLineGroupBy.FindFirst();
            end;

            if AwardRuleLineGroupBy."Group By Fund" then begin
                TempGLEntry.SetRange("Fund No. NVG", TempGLEntry."Fund No. NVG");
                LDB."Fund No." := TempGLEntry."Fund No. NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 1" then begin
                TempGLEntry.SetRange("Global Dimension 1 Code", TempGLEntry."Global Dimension 1 Code");
                LDB."Shortcut Dimension 1 Code" := TempGLEntry."Global Dimension 1 Code";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 2" then begin
                TempGLEntry.SetRange("Global Dimension 2 Code", TempGLEntry."Global Dimension 2 Code");
                LDB."Shortcut Dimension 2 Code" := TempGLEntry."Global Dimension 2 Code";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 3" then begin
                TempGLEntry.SetRange("Global Dimension 3 Code NVG", TempGLEntry."Global Dimension 3 Code NVG");
                LDB."Shortcut Dimension 3 Code" := TempGLEntry."Global Dimension 3 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 4" then begin
                TempGLEntry.SetRange("Global Dimension 4 Code NVG", TempGLEntry."Global Dimension 4 Code NVG");
                LDB."Shortcut Dimension 4 Code" := TempGLEntry."Global Dimension 4 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 5" then begin
                TempGLEntry.SetRange("Global Dimension 5 Code NVG", TempGLEntry."Global Dimension 5 Code NVG");
                LDB."Shortcut Dimension 5 Code" := TempGLEntry."Global Dimension 5 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 6" then begin
                TempGLEntry.SetRange("Global Dimension 6 Code NVG", TempGLEntry."Global Dimension 6 Code NVG");
                LDB."Shortcut Dimension 6 Code" := TempGLEntry."Global Dimension 6 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 7" then begin
                TempGLEntry.SetRange("Global Dimension 7 Code NVG", TempGLEntry."Global Dimension 7 Code NVG");
                LDB."Shortcut Dimension 7 Code" := TempGLEntry."Global Dimension 7 Code NVG";
            end;
            if AwardRuleLineGroupBy."Group By Dimension 8" then begin
                TempGLEntry.SetRange("Global Dimension 8 Code NVG", TempGLEntry."Global Dimension 8 Code NVG");
                LDB."Shortcut Dimension 8 Code" := TempGLEntry."Global Dimension 8 Code NVG";
            end;

            if GLSetup."LCY Code" = GLSetupIC."LCY Code" then begin
                TempGLEntry.CalcSums(Amount);
                AppliedAmount := TempGLEntry.Amount;
            end else
                if GLSetup."LCY Code" = GLSetupIC."Additional Reporting Currency" then begin
                    TempGLEntry.CalcSums("Additional-Currency Amount");
                    AppliedAmount := TempGLEntry."Additional-Currency Amount";
                end else begin
                    TempGLEntry.CalcSums(Amount);
                    AppliedAmount := CurrExchRate.ExchangeAmtFCYToLCY(PostingDate, GLSetupIC."LCY Code", TempGLEntry.Amount,
                                                  CurrExchRate.ExchangeRate(PostingDate, GLSetupIC."LCY Code"));
                end;

            if (AppliedAmount > AwardRuleLineDetail."Maximum Amount") and (AwardRuleLineDetail."Maximum Amount" <> 0) then
                AppliedAmount := AwardRuleLineDetail."Maximum Amount";
            if AwardRuleLineDetail.Operation = AwardRuleLineDetail.Operation::"-" then
                AppliedAmount := -AppliedAmount;

            LDB.Amount := AppliedAmount;
            LDB."Transaction Type" := TempGLEntry."Transaction Type NVG";
            InsertLineDistributionBuffer(LDB);

            if AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Source then
                TotalSourceAmount += LDB.Amount;
            if AwardRuleLine."Line Type" = AwardRuleLine."Line Type"::Limits then
                LimitAmount += LDB.Amount;
            TempGLEntry.DeleteAll();
            SetInitialFilters(TempGLEntry);
        until not TempGLEntry.FindFirst();

        TempGLEntry.ChangeCompany(CompanyName());
    end;

    procedure GenerateDimensionText(LDB: Record "Line Distribution Buffer NVG")
    var
        Dimension: Record Dimension;
    begin
        DimText := '';

        if (LDB."Fund No." <> '') and (AVSetup."Award Dimension No." - 1 <> 0) and (Award."Award Dimension No." - 1 <> 0) then
            DimText := DimText + SNText006 + LDB."Fund No." + ' ';
        if (LDB."Shortcut Dimension 1 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 1) and
           (Award."Award Dimension No." - 1 <> 1) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 1 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 1 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 2 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 2) and
           (Award."Award Dimension No." - 1 <> 2) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 2 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 2 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 3 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 3) and
           (Award."Award Dimension No." - 1 <> 3) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 3 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 3 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 4 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 4) and
           (Award."Award Dimension No." - 1 <> 4) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 4 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 4 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 5 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 5) and
           (Award."Award Dimension No." - 1 <> 5) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 5 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 5 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 6 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 6) and
           (Award."Award Dimension No." - 1 <> 6) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 6 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 6 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 7 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 7) and
           (Award."Award Dimension No." - 1 <> 7) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 7 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 7 Code" + ' ';
        end;
        if (LDB."Shortcut Dimension 8 Code" <> '') and (AVSetup."Award Dimension No." - 1 <> 8) and
           (Award."Award Dimension No." - 1 <> 8) then begin
            Dimension.Get(GLSetup."Shortcut Dimension 8 Code");
            DimText := DimText + Dimension.Name + ': ' + LDB."Shortcut Dimension 8 Code" + ' ';
        end;
    end;

    procedure ComputeMatrixAddition(var Operand1: Record "Line Distribution Buffer NVG" temporary; var Operand2: Record "Line Distribution Buffer NVG" temporary)
    begin
        if Operand2.IsEmpty() then
            exit;
        Operand2.FindSet(true, false);
        repeat
            Operand1.SetRange("Document No.", Operand2."Document No.");
            Operand1.SetRange("Allocation No.", Operand2."Allocation No.");
            Operand1.SetRange("G/L Account No.", Operand2."G/L Account No.");
            Operand1.SetRange("Fund No.", Operand2."Fund No.");
            Operand1.SetRange("Shortcut Dimension 1 Code", Operand2."Shortcut Dimension 1 Code");
            Operand1.SetRange("Shortcut Dimension 2 Code", Operand2."Shortcut Dimension 2 Code");
            Operand1.SetRange("Shortcut Dimension 3 Code", Operand2."Shortcut Dimension 3 Code");
            Operand1.SetRange("Shortcut Dimension 4 Code", Operand2."Shortcut Dimension 4 Code");
            Operand1.SetRange("Shortcut Dimension 5 Code", Operand2."Shortcut Dimension 5 Code");
            Operand1.SetRange("Shortcut Dimension 6 Code", Operand2."Shortcut Dimension 6 Code");
            Operand1.SetRange("Shortcut Dimension 7 Code", Operand2."Shortcut Dimension 7 Code");
            Operand1.SetRange("Shortcut Dimension 8 Code", Operand2."Shortcut Dimension 8 Code");
            Operand1.SetRange("Inter-Company Name", Operand2."Inter-Company Name");

            if Operand1.FindFirst() then begin
                Operand1.Amount += Operand2.Amount;
                Operand1.Modify();
                Operand1.Reset();
            end else begin
                Operand1.Reset();
                Operand1 := Operand2;
                Operand1."Line No." := 10000 + Operand1.Count();
                if not Operand1.Insert() then
                    repeat
                        Operand1."Line No." += 1;
                    until Operand1.Insert();
            end;
        until Operand2.Next() = 0;
        Operand2.DeleteAll()
    end;

    procedure UpdateOrigNoSeriesNo(NoSeriesCode: Code[10]; StartDate: Date; Flow: Option "Get;Set")
    var
        NoSeriesLine: Record "No. Series Line";
    begin
        //Navigator begin
        if StartDate = 0D then
            StartDate := WorkDate();
        NoSeriesLine.Reset();
        NoSeriesLine.SetCurrentKey("Series Code", "Starting Date");
        NoSeriesLine.SetRange("Series Code", NoSeriesCode);
        NoSeriesLine.SetRange("Starting Date", 0D, StartDate);
        if NoSeriesLine.FindLast() then begin
            NoSeriesLine.SetRange("Starting Date", NoSeriesLine."Starting Date");
            NoSeriesLine.SetRange(Open, true);
            if NoSeriesLine.FindFirst() then begin
                if Flow = 0 then begin
                    if NoSeriesLine."Last No. Used" = '' then begin
                        NoSeriesLine.TestField("Starting No.");
                        OrigNoSeriesNo := NoSeriesLine."Starting No.";
                    end else
                        OrigNoSeriesNo := NoSeriesLine."Last No. Used";
                end else begin
                    NoSeriesLine.Validate("Last No. Used", OrigNoSeriesNo);
                    NoSeriesLine.Modify(true);
                end;
            end;
        end;
        //Navigator end
    end;
}


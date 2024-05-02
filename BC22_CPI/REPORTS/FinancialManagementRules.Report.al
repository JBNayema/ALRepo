dotnet
{
    assembly("mscorlib")
    {
        Version = '4.0.0.0';
        Culture = 'neutral';
        PublicKeyToken = 'b77a5c561934e089';

        type("System.IO.StreamReader"; "StreamReader")
        {
        }
    }

}
report 50135 "Financial Management Rules"
{
    // SSI1.00 2017.09.22 Word Templates
    RDLCLayout = './FinancialManagementRules.rdlc';
    WordLayout = './Layout/FinancialManagementRules.docx';

    Caption = 'Financial Management Rules';
    DefaultLayout = Word;

    dataset
    {
        dataitem(Award; "Award NVG")
        {
            RequestFilterFields = "No.";
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(ApplicationID; Award."No.")
            {
            }
            column(GrantAgreementNumber; Award."Reference No.")
            {
            }
            column(TotalApprovedAmount; Award."Total Estimate (SCY)")
            {
            }
            column(GrantStartDate; Format(Award."Start Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(GrantEndDate; Format(Award."End Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(ApplicationNameLocal; Award.Description)
            {
            }
            column(DetailedDescription; Award.Description)
            {
            }
            column(DetailedDescription2; Award."Description 2")
            {
            }
            column(DetailedDescrEng; Award.Description + ' ' + Award."Description 2")
            {
            }
            column(ApplicationNameEng; Award.Description)
            {
            }
            column(CurrencyCode; Award."Currency Code")
            {
            }
            column(ApprSubAmount; Award."Total Estimate (SCY)")
            {
            }
            column(CurrentDate; Format(CurrentDate, 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(CurrentDateText; CurrentDateText)
            {
            }
            column(DefaultBudgetType; DefaultBudgetType)
            {
            }
            column(SubCatgName; TextExpDetails)
            {
            }
            column(ProjectCode; ProjectCode)
            {
            }
            column(SpeedkeyAward; SpeedkeyAward)
            {
            }
            column(SpeedkeyBeneficiary; SpeedkeyBeneficiary)
            {
            }
            column(SpeedkeyCoW; SpeedkeyCoW)
            {
            }
            column(SpeedkeyGeography; SpeedkeyGeography)
            {
            }
            column(SpeedkeyProgram; SpeedkeyProgram)
            {
            }
            column(SpeedkeyProject; SpeedkeyProject)
            {
            }
            column(SpeedkeyFund; SpeedkeyFund)
            {
            }
            column(ModificationAmount; ModificationAmount)
            {
            }
            column(ModificationAmountRCY; ModificationAmountRCY)
            {
            }
            column(ProgramName; ProgramName)
            {
            }
            column(FPOSTotalBudget; FPOSTotalBudget)
            {
            }
            column(TotalExpenditures; Award."Expenses (SCY)")
            {
            }
            column(ACTV_DATE; ACTV_DATE)
            {
            }
            column(AMEND_PRP; AMEND_PRP)
            {
            }
            column(AMTVERB_EN; "AMTVERB-EN")
            {
            }
            column(DETAIL_DES; DETAIL_DES)
            {
            }
            column(FACTSHT1; FACTSHT1)
            {
            }
            column(FACTSHT10; FACTSHT10)
            {
            }
            column(FACTSHT11; FACTSHT11)
            {
            }
            column(FACTSHT12; FACTSHT12)
            {
            }
            column(FACTSHT13; FACTSHT13)
            {
            }
            column(FACTSHT14; FACTSHT14)
            {
            }
            column(FACTSHT15; FACTSHT15)
            {
            }
            column(FACTSHT16; FACTSHT16)
            {
            }
            column(FACTSHT2; FACTSHT2)
            {
            }
            column(FACTSHT3; FACTSHT3)
            {
            }
            column(FACTSHT4; FACTSHT4)
            {
            }
            column(FACTSHT5; FACTSHT5)
            {
            }
            column(FACTSHT6; FACTSHT6)
            {
            }
            column(FACTSHT71; FACTSHT71)
            {
            }
            column(FACTSHT72; FACTSHT72)
            {
            }
            column(FACTSHT8; FACTSHT8)
            {
            }
            column(FACTSHT9; FACTSHT9)
            {
            }
            column(REGDATE; REGDATE)
            {
            }
            column(TOTALRECAM; TOTALRECAM)
            {
            }
            column(TOTALREQAM; TOTALREQAM)
            {
            }
            dataitem("Parent Award"; "Award nvg")
            {
                DataItemLink = "No." = FIELD("Parent No.");
                DataItemTableView = SORTING("No.");
                dataitem(Funder; "Funder nvg")
                {
                    DataItemLink = "No." = FIELD("Originating Funder No.");
                    DataItemTableView = SORTING("No.");
                    column(DonorName; Funder.Name)
                    {
                    }
                }
            }
            dataitem(Currency; Currency)
            {
                DataItemLink = Code = FIELD("Currency Code");
                DataItemTableView = SORTING(Code);
                column(CurrencySymbol; Currency.Symbol)
                {
                }
            }
            dataitem("Award Type"; "Award Type nvg")
            {
                DataItemLink = Code = FIELD(Type);
                DataItemTableView = SORTING(Code);
                column(ProgramSubCatgName; "Award Type".Description)
                {
                }
            }
            dataitem("Award Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = FILTER('SA-HO'));
                column(CS_Name; "Award Contact".Name)
                {
                }
                column(CS_Position; "Award Contact"."Role Description")
                {
                }
                column(CS_Relation; "Award Contact"."Role Description")
                {
                }
            }
            dataitem("PO Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = FILTER('PO'));
                column(PO_Name; "PO Contact".Name)
                {
                }
            }
            dataitem("PL Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = FILTER('SA-LEADER'));
                column(PL_NameLoc; "PL Contact".Name)
                {
                }
                column(PL_Position; "PL Contact"."Role Description")
                {
                }
            }
            dataitem("PD Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = FILTER('PD'));
                column(PD_Name; "PD Contact".Name)
                {
                }
            }
            dataitem("Grant Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = FILTER('SA-CONTACT'));
                column(GrantContact_Name; "Grant Contact".Name)
                {
                }
                column(GrantContact_Position; "Grant Contact"."Role Description")
                {
                }
            }
            dataitem("ED Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = CONST('ED'));
                column(EDContact_Name; "ED Contact".Name)
                {
                }
                column(EDContact_Position; "ED Contact"."Role Description")
                {
                }
            }
            dataitem("GM Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = CONST('GM'));
                column(GMName; "GM Contact".Name)
                {
                }
                column(GMPosition; "GM Contact"."Role Description")
                {
                }
            }
            dataitem("PC Contact"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = CONST('PC'));
                column(PCName; "PC Contact".Name)
                {
                }
                column(PCPosition; "PC Contact"."Role Description")
                {
                }
            }
            dataitem("SA Signer"; "Award Contact nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Contact Code", "Role Code") WHERE("Role Code" = CONST('SA-SIGNER'));
                column(SignerName; "SA Signer".Name)
                {
                }
                column(SignerPosition; "SA Signer"."Role Description")
                {
                }
            }
            dataitem("AV Ledger Entry"; "AV Ledger Entry NVG")
            {
                DataItemLink = "Award/Subaward No." = FIELD("No.");
                DataItemTableView = SORTING("Award/Subaward No.", "Entry Type") WHERE("Entry Type" = FILTER(Estimate));
                column(ExpCatgApprovedAmt; "AV Ledger Entry"."Estimated Amount (SCY)")
                {
                }
                column(ExpCatgName; "AV Ledger Entry".Description)
                {
                }
                dataitem("Detailed AV Ledger Entry"; "Detailed AV Ledger Entry nvg")
                {
                    DataItemLink = "AV Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("AV Ledger Entry No.", "Apply Entry No.", "AV Entry Type", "Entry Type", "Posting Date");
                    column(DetailedExpCatgApprovedAmt; "Detailed AV Ledger Entry".Amount)
                    {
                    }
                    column(DetailedAVName; "Detailed AV Ledger Entry".Description)
                    {
                    }
                    dataitem(Fund; "Fund nvg")
                    {
                        DataItemLink = "No." = FIELD("Fund No.");
                        DataItemTableView = SORTING("No.");

                        trigger OnAfterGetRecord()
                        begin
                            if DefaultBudgetType = '' then
                                DefaultBudgetType := Fund.Name
                            else
                                DefaultBudgetType := DefaultBudgetType + ' ' + Fund.Name;
                        end;
                    }
                }
                dataitem(OSFFundsBudget; "Detailed AV Ledger Entry nvg")
                {
                    DataItemLink = "AV Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("AV Ledger Entry No.", "Apply Entry No.", "AV Entry Type", "Entry Type", "Posting Date") WHERE("Fund No." = FILTER('*FOSI* OR *FPOS* OR *OSI*'), "AV Entry Type" = CONST(Estimate));
                }
                dataitem(NonOSFFundsBudget; "Detailed AV Ledger Entry nvg")
                {
                    DataItemLink = "AV Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("AV Ledger Entry No.", "Apply Entry No.", "AV Entry Type", "Entry Type", "Posting Date") WHERE("Fund No." = FILTER(<> '*FOSI*'), "Fund No." = FILTER(<> '*FPOS*'), "Fund No." = FILTER(<> '*OSI*'), "AV Entry Type" = CONST(Estimate));
                    column(TPBudgetFund; NonOSFFundsBudget."Fund No.")
                    {
                    }
                    column(TPBudgetDescription; NonOSFFundsBudget.Description)
                    {
                    }
                    column(TPBudgetAmount; NonOSFFundsBudget."Amount (SCY)")
                    {
                    }
                    dataitem(TPFund; "Fund nvg")
                    {
                        DataItemLink = "No." = FIELD("Fund No.");
                        DataItemTableView = SORTING("No.");
                        column(TPFundName; TPFund.Name)
                        {
                        }
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ThirdPartyTotal += NonOSFFundsBudget."Amount (SCY)";
                    end;

                    trigger OnPreDataItem()
                    begin
                        ThirdPartyTotal := 0;
                    end;
                }
                dataitem(ThirdPartyTotalAmount; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(ThirdPartyTotal; ThirdPartyTotal)
                    {
                    }
                }
            }
            dataitem("Equipment Donation"; "Milestone nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Due Date", "Completion Date") ORDER(Ascending) WHERE("Activity Type Code" = FILTER('EQUIPMENT'));
                column(EquipmentAmount; EquipmentAmountDecimal)
                {
                }
                column(EquipmentLineNo; EquipmentLineNo)
                {
                }
                column(EquipmentName; "Equipment Donation".Description)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                    EquipmentAmountAsDecimal: Decimal;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    EquipmentAmount := '';
                    EquipmentLineNo := LastEquipmentLineNo + 1;

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        EquipmentAmount := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;

                    if Evaluate(EquipmentAmountDecimal, EquipmentAmount) then;

                    if Evaluate(EquipmentAmountAsDecimal, EquipmentAmount) then begin
                        EquipmentTotal += EquipmentAmountAsDecimal;

                    end;
                    LastEquipmentLineNo := EquipmentLineNo;
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = WHERE(Number = CONST(1));
                column(EquipmentTotal; EquipmentTotal)
                {
                }
            }
            dataitem("Milestone Installment"; "Milestone nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Due Date", "Completion Date") ORDER(Ascending) WHERE("Activity Type Code" = FILTER('INSTALL*'));
                column(InstallmentAmount; InstallmentAmount)
                {
                }
                column(InstallmentDueDate; Format("Milestone Installment"."Due Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(InstallmentNum; InstallmentLineNo)
                {
                }
                column(InstallmentCompletionDate; Format("Milestone Installment"."Completion Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(InstallmentCount; Format("Milestone Installment".Count))
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    InstallmentAmount := '';
                    InstallmentLineNo := LastInstallmentLineNo + 1;

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        InstallmentAmount := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;

                    LastInstallmentLineNo := InstallmentLineNo;

                    if "Milestone Installment"."Due Date" > LastInstallDate then
                        LastInstallDate := "Milestone Installment"."Due Date";

                    if InstallmentDateList = '' then
                        InstallmentDateList := Format("Milestone Installment"."Due Date", 0, '<Day,2>/<Month,2>/<Year4>')
                    else
                        InstallmentDateList += ', ' + Format("Milestone Installment"."Due Date", 0, '<Day,2>/<Month,2>/<Year4>');
                end;
            }
            dataitem(InstallmentDates; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(InstallmentDateList; InstallmentDateList)
                {
                }
            }
            dataitem(LastInstallInfo; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(LastInstallDate; Format(LastInstallDate, 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem(NextInstallmentInfo; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(NextInstallmentAmount; NextInstallmentAmount)
                {
                }
                column(NextInstallmentDueDate; NextInstallmentDueDate)
                {
                }
            }
            dataitem("Milestone Report"; "Milestone nvg")
            {
                DataItemLink = "Award No." = FIELD("No.");
                DataItemTableView = SORTING("Award No.", "Due Date", "Completion Date") ORDER(Ascending) WHERE("Activity Type Code" = FILTER('*REP*' | 'INTFINNAR'));
                column(ReporRemark; ReportRemark)
                {
                }
                column(ReportDate; Format("Milestone Report"."Due Date", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(ReportNum; ReportLineNo)
                {
                }
                column(ReportCount; Format("Milestone Report".Count))
                {
                }
                column(ReportDescription; "Milestone Report".Description)
                {
                }
                dataitem("AV Activity Type"; "AV Activity Type nvg")
                {
                    DataItemLink = Code = FIELD("Activity Type Code");
                    DataItemTableView = SORTING(Code);
                    column(ReportType; "AV Activity Type".Description)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ReportRemark := '';
                    ReportLineNo := LastReportLineNo + 1;

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ReportRemark := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;

                    LastReportLineNo := ReportLineNo;

                    if "Milestone Report"."Due Date" > LastReportDate then
                        LastReportDate := "Milestone Report"."Due Date";

                    if FirstReportDate = 0D then
                        FirstReportDate := "Milestone Report"."Due Date";

                    if ReportDateList = '' then
                        ReportDateList := Format("Milestone Report"."Due Date", 0, '<Day,2>/<Month,2>/<Year4>')
                    else
                        ReportDateList += ', ' + Format("Milestone Report"."Due Date", 0, '<Day,2>/<Month,2>/<Year4>');
                end;
            }
            dataitem(ReportDates; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(ReportDateList; ReportDateList)
                {
                }
            }
            dataitem(ReportStartEndDates; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(FirstReportDate; Format(FirstReportDate, 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
                column(LastReportDate; Format(LastReportDate, 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Grant Activation Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('ACTV_DATE'), "Table ID" = CONST(37055300));
                column(GrantActivationDate; Format("TC Grant Activation Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Grant Due Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('GRDUEDATE'), "Table ID" = CONST(37055300));
                column(GrantDueDate; Format("TC Grant Due Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Project Duration Months"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PRDURATION'), "Table ID" = CONST(37055300));
                column(ProjectDurationMonths; "TC Project Duration Months"."Integer Value")
                {
                }
            }
            dataitem("TC Amount Verbal Loc"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('AMTVERBLOC'), "Table ID" = CONST(37055300));
                column(AmountVerbalLoc; AmountVerbalLoc)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    AmountVerbalLoc := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        AmountVerbalLoc := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Amount Verbal RUS"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('AMTVERBRUS'), "Table ID" = CONST(37055300));
                column(AmountVerbalRus; AmountVerbalRus)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    AmountVerbalRus := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        AmountVerbalRus := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Assessment"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('ASSESSMENT'), "Table ID" = CONST(37055300));
                column(Assessment; Assessment)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    Assessment := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        Assessment := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Classification"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('CLASSFIC'), "Table ID" = CONST(37055300));
                column(Classification; Classification)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    Classification := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        Classification := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Grant Approved Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('GRAPRVDAT'), "Table ID" = CONST(37055300));
                column(GrantApprovedDate; Format("TC Grant Approved Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Grant Received Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('GRREGDATE'), "Table ID" = CONST(37055300));
                column(DateReceived; Format("TC Grant Received Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Passport Authority"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PASSPAUTH'), "Table ID" = CONST(37055300));
                column(ApplicantPassportAuthority; ApplicantPassportAuthority)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ApplicantPassportAuthority := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ApplicantPassportAuthority := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Passport Information"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PASSPINFO'), "Table ID" = CONST(37055300));
                column(ApplicantPassportInfo; ApplicantPassportInfo)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ApplicantPassportInfo := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ApplicantPassportInfo := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Project Contribution"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PROJCONTRI'), "Table ID" = CONST(37055300));
                column(ProjectContribution; ProjectContribution)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ProjectContribution := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ProjectContribution := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Project Duration Days"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PROJDURDAY'), "Table ID" = CONST(37055300));
                column(ProjectDurationDays; "TC Project Duration Days"."Decimal Value")
                {
                }
            }
            dataitem("TC Project Impact"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PROJIMPACT'), "Table ID" = CONST(37055300));
                column(ProjectImpact; ProjectImpact)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ProjectImpact := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ProjectImpact := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                trigger OnPreDataItem()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                end;
            }
            dataitem("TC Project Name"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PROJNAME'), "Table ID" = CONST(37055300));
                column(ProjectName; ProjectName)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ProjectName := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ProjectName := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Project Name Code"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PROJNMCODE'), "Table ID" = CONST(37055300));
                column(Project_Name_CodeLocal; Project_Name_CodeLocal)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    Project_Name_CodeLocal := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        Project_Name_CodeLocal := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Quantitative"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('QUANTITIVE'), "Table ID" = CONST(37055300));
                column(Quantitative; Quantitative)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    Quantitative := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        Quantitative := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Registration Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('REG_DATE'), "Table ID" = CONST(37055300));
                column(RegistrationDate; Format("TC Registration Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                end;
            }
            dataitem("TC Registered"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('GRREGISTER'), "Table ID" = CONST(37055300));
                column(Registered; Registered)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    Registered := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        Registered := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Registration Number"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('GRREGNO'), "Table ID" = CONST(37055300));
                column(RegistrationNumber; RegistrationNumber)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    RegistrationNumber := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        RegistrationNumber := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Number of Installments"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('INSTALLNO'), "Table ID" = CONST(37055300));
                column(NumberOfInstallments; "TC Number of Installments"."Integer Value")
                {
                }
            }
            dataitem("TC Last Installment Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('INSTLSTDAT'), "Table ID" = CONST(37055300));
                column(LastInstallmentDate; Format("TC Last Installment Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Goal"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('FACTSHT4'), "Table ID" = CONST(37055300));
                column(Goal; Goal)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    Goal := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        Goal := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Pub Statement"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PUB_STATM'), "Table ID" = CONST(37055300));
                column(PublicationStatement; PubStmt)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    PubStmt := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        PubStmt := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC Midterm Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('MIDREP'), "Table ID" = CONST(37055300));
                column(MidtermReportDate; Format("TC Midterm Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC Final Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('FINREPCL'), "Table ID" = CONST(37055300));
                column(FinalReportDate; Format("TC Final Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }
            }
            dataitem("TC FEM Date"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('FEM'), "Table ID" = CONST(37055300));
                column(FEMDate; Format("TC FEM Date"."Date Value", 0, '<Day,2>/<Month,2>/<Year4>'))
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                end;
            }
            dataitem("TC PROBSTMNT"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PROBSTMNT'), "Table ID" = CONST(37055300));
                column(PROBSTMNT; PROBSTMNT)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    PROBSTMNT := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        PROBSTMNT := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC ACTIVITIES"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('ACTIVITIES'), "Table ID" = CONST(37055300));
                column(ACTIVITIES; ACTIVITIES)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    ACTIVITIES := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        ACTIVITIES := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC IMPLORG"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('IMPLORG'), "Table ID" = CONST(37055300));
                column(IMPLORG; IMPLORG)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    IMPLORG := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        IMPLORG := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC GENDANALYS"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('GENDANALYS'), "Table ID" = CONST(37055300));
                column(GENDANALYS; GENDANALYS)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    GENDANALYS := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        GENDANALYS := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC YOUTHPART"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('YOUTHPART'), "Table ID" = CONST(37055300));
                column(YOUTHPART; YOUTHPART)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    YOUTHPART := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        YOUTHPART := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC SUSTAIN"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('SUSTAIN'), "Table ID" = CONST(37055300));
                column(SUSTAIN; SUSTAIN)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    SUSTAIN := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        SUSTAIN := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC CONCCOND"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('CONCCOND'), "Table ID" = CONST(37055300));
                column(CONCCOND; CONCCOND)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    CONCCOND := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        CONCCOND := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC COI"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('COI'), "Table ID" = CONST(37055300));
                column(COI; COI)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    COI := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        COI := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC BUDGCOMNT"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('BUDGCOMNT'), "Table ID" = CONST(37055300));
                column(BUDGCOMNT; BUDGCOMNT)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    BUDGCOMNT := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        BUDGCOMNT := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC LOCALPART"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('LOCALPART'), "Table ID" = CONST(37055300));
                column(LOCALPART; LOCALPART)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    LOCALPART := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        LOCALPART := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC PARTNERCMNT"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('PARTNERCMN'), "Table ID" = CONST(37055300));
                column(PARTNERCMNT; PARTNERCMNT)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    PARTNERCMNT := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        PARTNERCMNT := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC TOTALREQAMT"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('TOTALREQAM'), "Table ID" = CONST(37055300));
                column(TOTALREQAMT; TOTALREQAMT)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    TOTALREQAMT := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        TOTALREQAMT := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC CNTXTBAKGRND"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('CNTXTBAKGR'), "Table ID" = CONST(37055300));
                column(CNTXTBAKGRND; CNTXTBAKGRND)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    CNTXTBAKGRND := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        CNTXTBAKGRND := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem("TC INDCTR_SCS"; "EF Extended Field Entry nvg")
            {
                DataItemLink = "Primary Key Value 1" = FIELD("No.");
                DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Extended Field Code" = FILTER('FACTSHT6'), "Table ID" = CONST(37055300));
                column(INDCTR_SCS; INDCTR_SCS)
                {
                }

                trigger OnAfterGetRecord()
                var
                    InStream: InStream;
                    StreamReader: DotNet StreamReader;
                begin
                    TermsConditions.CalcFields("Extended Text");
                    INDCTR_SCS := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        INDCTR_SCS := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = FIELD("Vendor No.");
                DataItemTableView = SORTING("No.") ORDER(Ascending);
                column(ApplicantCityName; Vendor.City)
                {
                }
                column(Birth_CourtRegistr_City; Vendor.City)
                {
                }
                column(ApplicantCountryName; Vendor."Country/Region Code")
                {
                }
                column(ApplicantStreetAddress; Vendor.Address + Vendor."Address 2")
                {
                }
                column(ApplicantStreetAddressAlt; Vendor.Address + Vendor."Address 2")
                {
                }
                column(ApplicantTaxNumber; Vendor."VAT Registration No.")
                {
                }
                column(ApplicantFamilyLoc; Vendor.Name)
                {
                }
                column(ApplicantFirstMiddleNameLoc; Vendor.Name)
                {
                }
                column(ApplicantZIP; Vendor."Post Code")
                {
                }
                column(ApplicantTaxID; Vendor."Federal ID No.")
                {
                }
                column(ApplicantPhoneNo; Vendor."Phone No.")
                {
                }
                dataitem("Vendor Posting Group"; "Vendor Posting Group")
                {
                    DataItemLink = Code = FIELD("Vendor Posting Group");
                    DataItemTableView = SORTING(Code);
                    dataitem(Disbursement; "G/L Entry")
                    {
                        DataItemLink = "G/L Account No." = FIELD("Payables Account");
                        DataItemTableView = SORTING("Entry No.") WHERE("Document Type" = CONST(Payment));

                        trigger OnAfterGetRecord()
                        begin
                            TotalDisbursed += Disbursement."Subaward Currency Amount nvg";
                            TotalRemainingBudget -= Disbursement."Subaward Currency Amount nvg";
                        end;

                        trigger OnPreDataItem()
                        begin
                            Disbursement.SetFilter("Global Dimension 6 Code nvg", Award."No.");
                        end;
                    }
                    dataitem(DisbursedTotal; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(TotalDisbursed; TotalDisbursed)
                        {
                        }
                        column(TotalRemainingBudget; TotalRemainingBudget)
                        {
                        }
                    }
                }
                dataitem("Vendor Title"; "EF Extended Field Entry nvg")
                {
                    DataItemLink = "Primary Key Value 1" = FIELD("No.");
                    DataItemTableView = SORTING("Table ID", "Main Page ID", "Primary Key Value 1", "Primary Key Value 2", "Primary Key Value 3", "Category Code", "Extended Field Code", "Effective Date") WHERE("Table ID" = CONST(23), "Extended Field Code" = CONST('TITLE'));
                    column(ApplicantTitleLoc; "Vendor Title"."Code Value")
                    {
                    }
                }
                dataitem("Vendor Bank Account"; "Vendor Bank Account")
                {
                    DataItemLink = "Vendor No." = FIELD("No.");
                    DataItemTableView = SORTING("Vendor No.", Code);
                    column(BankCode; "Vendor Bank Account"."SWIFT Code")
                    {
                    }
                    column(BankAccountNumber; "Vendor Bank Account"."Bank Account No.")
                    {
                    }
                    column(BankAccountName; "Vendor Bank Account".Name)
                    {
                    }
                    column(BankAddress1; "Vendor Bank Account".Address)
                    {
                    }
                    column(BankAddress2; "Vendor Bank Account"."Address 2")
                    {
                    }
                    column(BankCity; "Vendor Bank Account".City)
                    {
                    }
                    column(BankZIP; "Vendor Bank Account"."Post Code")
                    {
                    }
                    column(BankCountry; "Vendor Bank Account"."Country/Region Code")
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            var
                AwardAVLedgerEntry: Record "AV Ledger Entry nvg";
                AwardDetailedAVLedgerEntry: Record "Detailed AV Ledger Entry nvg";
                AwardFund: Record "Fund nvg";
                AwardFund2: Record "Fund nvg" temporary;
                AwardFund3: Record "Fund nvg" temporary;
                AwardFund4: Record "Fund nvg" temporary;
                InStream: InStream;
                StreamReader: DotNet StreamReader;
            begin
                Modification.SetFilter("Modification No.", ModificationNo);
                Modification.SetFilter("Award/Subaward No.", Award."No.");
                if Modification.FindFirst then begin
                    Modification.CalcFields("Total Mod. Estimate", "Total Estimate (RCY)");
                    ModificationAmount := Modification."Total Mod. Estimate";
                    ModificationAmountRCY := Modification."Total Mod. Estimate (RCY)";
                end;

                DetailedAVLedgerEntry.Reset;
                DetailedAVLedgerEntry.SetFilter("Award/Subaward No.", Award."No.");
                DetailedAVLedgerEntry.SetRange("Transaction Type", DetailedAVLedgerEntry."Transaction Type"::Actual);
                DetailedAVLedgerEntry.SetRange("AV Entry Type", DetailedAVLedgerEntry."AV Entry Type"::Estimate);
                if DetailedAVLedgerEntry.FindFirst then begin
                    Clear(DimensionValue);
                    DimensionValue.SetFilter("Dimension Code", 'PROGRAM');
                    DimensionValue.SetFilter(Code, DetailedAVLedgerEntry."Global Dimension 1 Code");
                    if DimensionValue.FindFirst then
                        ProgramName := DimensionValue.Name;

                    repeat
                        FPOSTotalBudget += DetailedAVLedgerEntry."Amount (RCY)";
                    until DetailedAVLedgerEntry.Next = 0;
                end;

                AwardAVLedgerEntry.SetRange("Entry Type", AwardAVLedgerEntry."Entry Type"::Estimate);
                AwardAVLedgerEntry.SetFilter("Award/Subaward No.", Award."No.");
                AwardFund2.Reset;

                if AwardAVLedgerEntry.FindFirst then
                    repeat
                        AwardDetailedAVLedgerEntry.SetRange("AV Ledger Entry No.", AwardAVLedgerEntry."Entry No.");
                        if AwardDetailedAVLedgerEntry.FindFirst then
                            repeat
                                AwardFund.SetFilter("No.", AwardDetailedAVLedgerEntry."Fund No.");
                                AwardFund2.SetFilter("No.", AwardDetailedAVLedgerEntry."Fund No.");
                                if (AwardFund.FindFirst) and (not (AwardFund2.FindFirst)) then begin
                                    if DefaultBudgetType = '' then
                                        DefaultBudgetType := AwardFund."No."
                                    else
                                        DefaultBudgetType := DefaultBudgetType + ' ' + AwardFund."No.";
                                    AwardFund2.Init;
                                    AwardFund2."No." := AwardFund."No.";
                                    AwardFund2.Insert;
                                end;
                                AwardFund3.SetFilter("No.", AwardDetailedAVLedgerEntry."Global Dimension 2 Code");
                                if (not (AwardFund3.FindFirst)) then begin
                                    if ProjectCode = '' then
                                        ProjectCode := AwardDetailedAVLedgerEntry."Global Dimension 2 Code"
                                    else
                                        ProjectCode := ProjectCode + ' ' + AwardDetailedAVLedgerEntry."Global Dimension 2 Code";
                                    AwardFund3.Init;
                                    AwardFund3."No." := AwardDetailedAVLedgerEntry."Global Dimension 2 Code";
                                    AwardFund3.Insert;
                                end;
                                AwardFund4.SetFilter("No.", AwardDetailedAVLedgerEntry."Global Dimension 1 Code");
                                if (not (AwardFund4.FindFirst)) then begin
                                    if ProgramCode = '' then
                                        ProgramCode := AwardDetailedAVLedgerEntry."Global Dimension 1 Code"
                                    else
                                        ProgramCode := ProgramCode + ' ' + AwardDetailedAVLedgerEntry."Global Dimension 1 Code";
                                    AwardFund4.Init;
                                    AwardFund4."No." := AwardDetailedAVLedgerEntry."Global Dimension 1 Code";
                                    AwardFund4.Insert;
                                end;
                            until AwardDetailedAVLedgerEntry.Next = 0;
                    until AwardAVLedgerEntry.Next = 0;

                SpeedkeyAward := Award."Global Dimension 5 Code";
                SpeedkeyBeneficiary := Award."Global Dimension 4 Code";
                SpeedkeyCoW := ProjectCode; //Award."Global Dimension 2 Code";
                SpeedkeyGeography := Award."Global Dimension 3 Code";
                SpeedkeyProgram := ProgramCode;//Award."Global Dimension 1 Code";
                SpeedkeyProject := Award."Global Dimension 6 Code";
                SpeedkeyFund := DefaultBudgetType; //Award."Fund No.";


                //Award Terms and Conditions//
                TermsConditions.SetRange("Table ID", 37055300);
                TermsConditions.SetRange("Main Page ID", 37055378);
                TermsConditions.SetFilter("Primary Key Value 1", Award."No.");

                TermsConditions.SetFilter("Extended Field Code", 'ACTV_DATE');
                if TermsConditions.FindFirst then
                    ACTV_DATE := Format(TermsConditions."Date Value", 0, '<Day,2>/<Month,2>/<Year4>');

                TermsConditions.SetFilter("Extended Field Code", 'AMEND_PRP');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    AMEND_PRP := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        AMEND_PRP := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'AMTVERB-EN');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    "AMTVERB-EN" := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        "AMTVERB-EN" := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'DETAIL_DES');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    DETAIL_DES := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        DETAIL_DES := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT1');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT1 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT1 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT10');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT10 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT10 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT11');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT11 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT11 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT12');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT12 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT12 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT13');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT13 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT13 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT14');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT14 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT14 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT15');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT15 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT15 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT16');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT16 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT16 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT2');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT2 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT2 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT3');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT3 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT3 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT4');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT4 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT4 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT5');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT5 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT5 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT6');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT6 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT6 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                if CompanyName = 'OSISA Johannesburg' then
                    TermsConditions.SetFilter("Extended Field Code", 'FACTSHT7')
                else
                    TermsConditions.SetFilter("Extended Field Code", 'PROJPURP');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT71 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT71 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT72');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT72 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT72 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT8');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT8 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT8 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'FACTSHT9');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    FACTSHT9 := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        FACTSHT9 := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'REGDATE');
                if TermsConditions.FindFirst then
                    REGDATE := Format(TermsConditions."Date Value", 0, '<Day,2>/<Month,2>/<Year4>');

                TermsConditions.SetFilter("Extended Field Code", 'TOTALRECAM');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    TOTALRECAM := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        TOTALRECAM := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;

                TermsConditions.SetFilter("Extended Field Code", 'TOTALREQAM');
                if TermsConditions.FindFirst then begin
                    TermsConditions.CalcFields("Extended Text");
                    TOTALREQAM := '';

                    if TermsConditions."Extended Text".HasValue then begin
                        TermsConditions."Extended Text".CreateInStream(InStream);
                        StreamReader := StreamReader.StreamReader(InStream);
                        TOTALREQAM := StreamReader.ReadToEnd();
                        StreamReader.Close();
                    end;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
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
        InstallmentLineNo := 0;
        LastInstallmentLineNo := 0;
        ReportLineNo := 0;
        LastReportLineNo := 0;
        CurrentDate := WorkDate;
        CompanyInfo.Get();
    end;

    var
        CompanyInfo: Record "Company Information";
        TermsConditions: Record "EF Extended Field Entry nvg";
        EquipmentTotal: Decimal;
        ReportLineNo: Integer;
        LastReportLineNo: Integer;
        InstallmentLineNo: Integer;
        LastInstallmentLineNo: Integer;
        EquipmentLineNo: Integer;
        LastEquipmentLineNo: Integer;
        EquipmentAmountDecimal: Decimal;
        InstallmentAmount: Text;
        DefaultBudgetType: Text;
        EquipmentAmount: Text;
        ReportRemark: Text;
        AmountVerbalLoc: Text;
        AmountVerbalRus: Text;
        Assessment: Text;
        Classification: Text;
        ApplicantPassportAuthority: Text;
        ApplicantPassportInfo: Text;
        ProjectContribution: Text;
        ProjectImpact: Text;
        ProjectName: Text;
        Project_Name_CodeLocal: Text;
        Quantitative: Text;
        Goal: Text;
        Registered: Text;
        RegistrationNumber: Text;
        MonthAsText: Text;
        CurrentDate: Date;
        CurrentDateText: Text;
        ThirdPartyTotal: Decimal;
        InstallmentDateList: Text;
        LastInstallDate: Date;
        Modifications: Record "Modification Header nvg";
        ModificationNo: Code[20];
        ModificationAmount: Decimal;
        ModificationAmountRCY: Decimal;
        Modification: Record "Modification Header nvg";
        ProgramName: Text;
        DetailedAVLedgerEntry: Record "Detailed AV Ledger Entry nvg";
        DimensionValue: Record "Dimension Value";
        PubStmt: Text;
        FPOSTotalBudget: Decimal;
        ReportDateList: Text;
        TotalDisbursed: Decimal;
        TotalRemainingBudget: Decimal;
        TotalExpense: Decimal;
        NextInstallmentAmount: Text;
        NextInstallmentDueDate: Date;
        PROBSTMNT: Text;
        ACTIVITIES: Text;
        IMPLORG: Text;
        GENDANALYS: Text;
        YOUTHPART: Text;
        SUSTAIN: Text;
        CONCCOND: Text;
        COI: Text;
        BUDGCOMNT: Text;
        LOCALPART: Text;
        PARTNERCMNT: Text;
        TOTALREQAMT: Text;
        CNTXTBAKGRND: Text;
        INDCTR_SCS: Text;
        ProgramSubCatgName: Text;
        FundingAwardNo: Code[20];
        ProjectCode: Code[400];
        ProgramCode: Code[400];
        SpeedkeyProgram: Code[400];
        SpeedkeyCoW: Code[400];
        SpeedkeyGeography: Code[400];
        SpeedkeyBeneficiary: Code[400];
        SpeedkeyAward: Code[400];
        SpeedkeyProject: Code[400];
        SpeedkeyFund: Code[400];
        FirstReportDate: Date;
        LastReportDate: Date;
        ACTV_DATE: Text;
        AMEND_PRP: Text;
        "AMTVERB-EN": Text;
        DETAIL_DES: Text;
        FACTSHT1: Text;
        FACTSHT10: Text;
        FACTSHT11: Text;
        FACTSHT12: Text;
        FACTSHT13: Text;
        FACTSHT14: Text;
        FACTSHT15: Text;
        FACTSHT16: Text;
        FACTSHT2: Text;
        FACTSHT3: Text;
        FACTSHT4: Text;
        FACTSHT5: Text;
        FACTSHT6: Text;
        FACTSHT71: Text;
        FACTSHT72: Text;
        FACTSHT8: Text;
        FACTSHT9: Text;
        REGDATE: Text;
        TOTALRECAM: Text;
        TOTALREQAM: Text;
        TextExpDetails: Label 'See Attachment for Expenditure Details';
        "Extended Text": Integer;
}


pageextension 50009 GenJnlPageExt extends "General Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field("Fund No."; Rec."Fund No.")
            {
                ApplicationArea = all;
                visible = true;
            }
        }
    }

    actions
    {
        addafter("A&ccount")
        {
            action(ImportXML)
            {
                caption = 'Import Payroll Summary..';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Import;
                ApplicationArea = all;
                trigger OnAction()
                var
                    GenJnlImport: XmlPort GeneralJournalXMLPort;
                begin
                    Clear(GenJnlImport);
                    GenJnlImport.SetJournalTemplateBatch(rec."Journal Template Name", rec."Journal Batch Name", rec."Source Code", rec."Reason Code");
                    GenJnlImport.Run();
                end;
            }
            action(CorrectLine)
            {
                caption = 'Correct Lines';
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Import;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    SecondLineCorrections();
                end;

            }
        }
    }
    procedure CorrectSomeLines()
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlLine1: Record "Gen. Journal Line";
        GenJnlLine2: Record "Gen. Journal Line";
        LineNo: Integer;
        LineNo2: Integer;
        AccountNo: Code[20];
        FundNo: Code[20];
        Amount: Decimal;
        BatchName: Code[10];




    begin
        BatchName := 'TEST';
        GenJnlLine2.SetFilter("Journal Batch Name", '%1', BatchName);
        if GenJnlLine2.FindFirst() then
            repeat
                LineNo := GenJnlLine2."Line No.";
                LineNo := LineNo + 10000;
                LineNo2 := LineNo + 10000;
                FundNo := GenJnlLine2."Fund No.";
                AccountNo := GenJnlLine2."Account No.";
                Amount := GenJnlLine2.Amount;



                GenJnlLine1.Reset();
                GenJnlLine1.Init();
                GenJnlLine1.SetFilter("Journal Batch Name", '%1', BatchName);
                GenJnlLine1.SetFilter("Line No.", '%1', LineNo2);
                GenJnlLine1.SetFilter("Fund No.", '%1', FundNo);
                GenJnlLine1.SetFilter("Account No.", '%1', AccountNo);
                If GenJnlLine1.FindFirst() then begin

                    repeat
                        GenJnlLine.SetFilter("Journal Batch Name", '%1', BatchName);
                        GenJnlLine.SetFilter("Line No.", '%1', LineNo);
                        GenJnlLine.SetFilter("Fund No.", '%1', FundNo);
                        GenJnlLine.SetFilter("Account No.", '%1', AccountNo);
                        If GenJnlLine.FindFirst() then
                            if (System.Abs(GenJnlLine.Amount) = System.Abs(Amount)) and (System.Abs(GenJnlLine1.Amount) = System.Abs(Amount)) then begin
                                if (GenJnlLine."Line No." = LineNo) and (GenJnlLine1."Line No." = LineNo2) then begin
                                    GenJnlLine."Document No." := '';
                                    GenJnlLine.Modify();
                                    GenJnlLine1."Document No." := '';
                                    GenJnlLine1.Modify()
                                end
                                else
                                    GenJnlLine.Modify(false);
                                GenJnlLine1.Modify(false)
                            end;
                    until
                            (GenJnlLine2.Next() = 0) and (GenJnlLine1.Next() = 0);
                end;

            until
            GenJnlLine2.Next() = 0;
    end;



















    procedure SecondLineCorrections()
    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlLine1: Record "Gen. Journal Line";
        GenJnlLine2: Record "Gen. Journal Line";
        LineNo: Integer;
        LineNo2: Integer;
        AccountNo: Code[20];
        FundNo: Code[20];
        Amount: Decimal;
        BatchName: Code[10];



    begin
        BatchName := 'TEST';
        GenJnlLine2.SetFilter("Journal Batch Name", '%1', BatchName);
        if GenJnlLine2.FindFirst() then
            repeat
                LineNo := GenJnlLine2."Line No.";
                LineNo := LineNo + 10000;
                LineNo2 := LineNo + 10000;
                FundNo := GenJnlLine2."Fund No.";
                AccountNo := GenJnlLine2."Account No.";
                Amount := GenJnlLine2.Amount;




                // GenJnlLine1.Init();
                // GenJnlLine2.Reset;
                // GenJnlLine2.Init;
                // GenJnlLine1.SetFilter("Journal Batch Name", '%1', BatchName);
                // GenJnlLine1.SetFilter("Fund No.", '%1', FundNo);
                // GenJnlLine1.SetFilter("Account No.", '%1', AccountNo);
                // GenJnlLine2.SetFilter("Fund No.", '%1', FundNo);
                // GenJnlLine2.SetFilter("Account No.", '%1', AccountNo);
                // GenJnlLine2.SetFilter("Line No.", '%1|%2', LineNo, LineNo2);
                // GenJnlLine1.SetFilter("Line No.", '%1|%2', LineNo2, LineNo);
                // GenJnlLine1.Findset;
                // GenJnlLine2.Findset;
                if GenJnlLine2.FindFirst() then
                    repeat
                        if (GenJnlLine2.FindSet()) and (GenJnlLine1.FindSet()) then
                            repeat

                                if (System.Abs(GenJnlLine2.Amount) = System.Abs(Amount)) and (System.Abs(GenJnlLine1.Amount) = System.Abs(Amount)) then begin
                                    if (GenJnlLine2."Line No." = LineNo) and (GenJnlLine1."Line No." = LineNo2) then begin
                                        GenJnlLine2."Document No." := '';
                                        GenJnlLine2.Modify();
                                        GenJnlLine1."Document No." := '';
                                        GenJnlLine1.Modify()
                                    end
                                    else
                                        GenJnlLine2.Modify(false);
                                    GenJnlLine1.Modify(false)
                                end;
                            until
                                (GenJnlLine2.Next() = 0) and (GenJnlLine1.Next() = 0);
                    until
                 GenJnlLine1.Next() = 0;
            until
            GenJnlLine2.Next() = 0;
    end;


}

page 50104 GLSetupWS
{
    Caption = 'GL Setup List WS';
    PageType = List;
    SourceTable = "General Ledger Setup";
    Editable = false;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
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
                field("Amount Decimal Places"; Rec."Amount Decimal Places")
                {
                    ApplicationArea = all;
                }
                field("Amount Rounding Precision"; Rec."Amount Rounding Precision")
                {
                    ApplicationArea = all;
                }
                field("Acc. Sched. for Balance Sheet"; Rec."Acc. Sched. for Balance Sheet")
                {
                    ApplicationArea = all;
                }
                field("Acc. Sched. for Cash Flow Stmt"; Rec."Acc. Sched. for Cash Flow Stmt")
                {
                    ApplicationArea = all;
                }
                field("Acc. Sched. for Income Stmt."; Rec."Acc. Sched. for Income Stmt.")
                {
                    ApplicationArea = all;
                }
                field("Acc. Sched. for Retained Earn."; Rec."Acc. Sched. for Retained Earn.")
                {
                    ApplicationArea = all;
                }
                field("Adapt Main Menu to Permissions"; Rec."Adapt Main Menu to Permissions")
                {
                    ApplicationArea = all;
                }
                field("Additional Reporting Currency"; Rec."Additional Reporting Currency")
                {
                    ApplicationArea = all;
                }
                field("Adjust ARC Jnl. Batch Name"; Rec."Adjust ARC Jnl. Batch Name")
                {
                    ApplicationArea = all;
                }
                field("Adjust ARC Jnl. Template Name"; Rec."Adjust ARC Jnl. Template Name")
                {
                    ApplicationArea = all;
                }
                field("Adjust for Payment Disc."; Rec."Adjust for Payment Disc.")
                {
                    ApplicationArea = all;
                }
                field("Allow Deferral Posting From"; Rec."Allow Deferral Posting From")
                {
                    ApplicationArea = all;
                }
                field("Allow Deferral Posting To"; Rec."Allow Deferral Posting To")
                {
                    ApplicationArea = all;
                }
                field("Allow G/L Acc. Deletion Before"; Rec."Allow G/L Acc. Deletion Before")
                {
                    ApplicationArea = all;
                }
                field("Allow Query From Consolid."; Rec."Allow Query From Consolid.")
                {
                    ApplicationArea = all;
                }
                field("Appln. Rounding Precision"; Rec."Appln. Rounding Precision")
                {
                    ApplicationArea = all;
                }
                field("Apply Jnl. Batch Name"; Rec."Apply Jnl. Batch Name")
                {
                    ApplicationArea = all;
                }
                field("Apply Jnl. Template Name"; Rec."Apply Jnl. Template Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Acc. Recon. Batch Name"; Rec."Bank Acc. Recon. Batch Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Acc. Recon. Template Name"; Rec."Bank Acc. Recon. Template Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Account Nos."; Rec."Bank Account Nos.")
                {
                    ApplicationArea = all;
                }
                field("Bank Rec. Adj. Doc. Nos."; Rec."Bank Rec. Adj. Doc. Nos.")
                {
                    ApplicationArea = all;
                }
                field("Bank Recon. with Auto. Match"; Rec."Bank Recon. with Auto. Match")
                {
                    ApplicationArea = all;
                }
                field("Bill-to/Sell-to VAT Calc."; Rec."Bill-to/Sell-to VAT Calc.")
                {
                    ApplicationArea = all;
                }
                field("Block Deletion of G/L Accounts"; Rec."Block Deletion of G/L Accounts")
                {
                    ApplicationArea = all;
                }
                field("CFDI Enabled"; Rec."CFDI Enabled")
                {
                    ApplicationArea = all;
                }
                field("Cancel on Time Expiration"; Rec."Cancel on Time Expiration")
                {
                    ApplicationArea = all;
                }
                field("Check G/L Account Usage"; Rec."Check G/L Account Usage")
                {
                    ApplicationArea = all;
                }
                field("Control VAT Period"; Rec."Control VAT Period")
                {
                    ApplicationArea = all;
                }
                field("Cust. Balances Due"; Rec."Cust. Balances Due")
                {
                    ApplicationArea = all;
                }
                field("Deposit Nos."; Rec."Deposit Nos.")
                {
                    ApplicationArea = all;
                }
                field("Disable CFDI Payment Details"; Rec."Disable CFDI Payment Details")
                {
                    ApplicationArea = all;
                }
                field("EMU Currency"; Rec."EMU Currency")
                {
                    ApplicationArea = all;
                }
                field("Enable Data Check"; Rec."Enable Data Check")
                {
                    ApplicationArea = all;
                }
                field("Fin. Rep. for Balance Sheet"; Rec."Fin. Rep. for Balance Sheet")
                {
                    ApplicationArea = all;
                }
                field("Fin. Rep. for Cash Flow Stmt"; Rec."Fin. Rep. for Cash Flow Stmt")
                {
                    ApplicationArea = all;
                }
                field("Fin. Rep. for Income Stmt."; Rec."Fin. Rep. for Income Stmt.")
                {
                    ApplicationArea = all;
                }
                field("Fin. Rep. for Retained Earn."; Rec."Fin. Rep. for Retained Earn.")
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
                field("Hash Algorithm"; Rec."Hash Algorithm")
                {
                    ApplicationArea = all;
                }
                field("Hide Payment Method Code"; Rec."Hide Payment Method Code")
                {
                    ApplicationArea = all;
                }
                field("Inv. Rounding Precision (LCY)"; Rec."Inv. Rounding Precision (LCY)")
                {
                    ApplicationArea = all;
                }
                field("Inv. Rounding Type (LCY)"; Rec."Inv. Rounding Type (LCY)")
                {
                    ApplicationArea = all;
                }
                field("Job Q. Prio. for Post & Print"; Rec."Job Q. Prio. for Post & Print")
                {
                    ApplicationArea = all;
                }
                field("Job Queue Category Code"; Rec."Job Queue Category Code")
                {
                    ApplicationArea = all;
                }
                field("Job Queue Priority for Post"; Rec."Job Queue Priority for Post")
                {
                    ApplicationArea = all;
                }
                field("Job WIP Jnl. Batch Name"; Rec."Job WIP Jnl. Batch Name")
                {
                    ApplicationArea = all;
                }
                field("Job WIP Jnl. Template Name"; Rec."Job WIP Jnl. Template Name")
                {
                    ApplicationArea = all;
                }
                field("Journal Templ. Name Mandatory"; Rec."Journal Templ. Name Mandatory")
                {
                    ApplicationArea = all;
                }
                field("LCY Code"; Rec."LCY Code")
                {
                    ApplicationArea = all;
                }
                field("Last IC Transaction No."; Rec."Last IC Transaction No.")
                {
                    ApplicationArea = all;
                }
                field("Local Address Format"; Rec."Local Address Format")
                {
                    ApplicationArea = all;
                }
                field("Local Cont. Addr. Format"; Rec."Local Cont. Addr. Format")
                {
                    ApplicationArea = all;
                }
                field("Local Currency Description"; Rec."Local Currency Description")
                {
                    ApplicationArea = all;
                }
                field("Local Currency Symbol"; Rec."Local Currency Symbol")
                {
                    ApplicationArea = all;
                }
                field("Mark Cr. Memos as Corrections"; Rec."Mark Cr. Memos as Corrections")
                {
                    ApplicationArea = all;
                }
                field("Max. Payment Tolerance Amount"; Rec."Max. Payment Tolerance Amount")
                {
                    ApplicationArea = all;
                }
                field("Max. VAT Difference Allowed"; Rec."Max. VAT Difference Allowed")
                {
                    ApplicationArea = all;
                }
                field("Notify On Success"; Rec."Notify On Success")
                {
                    ApplicationArea = all;
                }
                field("PAC Code"; Rec."PAC Code")
                {
                    ApplicationArea = all;
                }
                field("PAC Environment"; Rec."PAC Environment")
                {
                    ApplicationArea = all;
                }
                field("Payment Discount Grace Period"; Rec."Payment Discount Grace Period")
                {
                    ApplicationArea = all;
                }
                field("Payment Tolerance %"; Rec."Payment Tolerance %")
                {
                    ApplicationArea = all;
                }
                field("Payment Tolerance Posting"; Rec."Payment Tolerance Posting")
                {
                    ApplicationArea = all;
                }
                field("Payment Tolerance Warning"; Rec."Payment Tolerance Warning")
                {
                    ApplicationArea = all;
                }
                field("Payroll Trans. Import Format"; Rec."Payroll Trans. Import Format")
                {
                    ApplicationArea = all;
                }
                field("Pmt. Disc. Excl. VAT"; Rec."Pmt. Disc. Excl. VAT")
                {
                    ApplicationArea = all;
                }
                field("Pmt. Disc. Tolerance Posting"; Rec."Pmt. Disc. Tolerance Posting")
                {
                    ApplicationArea = all;
                }
                field("Pmt. Disc. Tolerance Warning"; Rec."Pmt. Disc. Tolerance Warning")
                {
                    ApplicationArea = all;
                }
                field("Post & Print with Job Queue"; Rec."Post & Print with Job Queue")
                {
                    ApplicationArea = all;
                }
                field("Post with Job Queue"; Rec."Post with Job Queue")
                {
                    ApplicationArea = all;
                }
                field("Posting Preview Type"; Rec."Posting Preview Type")
                {
                    ApplicationArea = all;
                }
                field("Prepayment Unrealized VAT"; Rec."Prepayment Unrealized VAT")
                {
                    ApplicationArea = all;
                }
                field("Print VAT specification in LCY"; Rec."Print VAT specification in LCY")
                {
                    ApplicationArea = all;
                }
                field("Register Time"; Rec."Register Time")
                {
                }
                field("Report Output Type"; Rec."Report Output Type")
                {
                    ApplicationArea = all;
                }
                field("Req.Country/Reg. Code in Addr."; Rec."Req.Country/Reg. Code in Addr.")
                {
                    ApplicationArea = all;
                }
                field("SAT Certificate"; Rec."SAT Certificate")
                {
                    ApplicationArea = all;
                }
                field("SAT Certificate Thumbprint"; Rec."SAT Certificate Thumbprint")
                {
                    ApplicationArea = all;
                }
                field("SEPA Export w/o Bank Acc. Data"; Rec."SEPA Export w/o Bank Acc. Data")
                {
                    ApplicationArea = all;
                }
                field("SEPA Non-Euro Export"; Rec."SEPA Non-Euro Export")
                {
                    ApplicationArea = all;
                }
                field("Send PDF Report"; Rec."Send PDF Report")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = all;
                }
                field("Show Amounts"; Rec."Show Amounts")
                {
                    ApplicationArea = all;
                }
                field("Sim. Request Stamp"; Rec."Sim. Request Stamp")
                {
                    ApplicationArea = all;
                }
                field("Sim. Send"; Rec."Sim. Send")
                {
                    ApplicationArea = all;
                }
                field("Sim. Signature"; Rec."Sim. Signature")
                {
                    ApplicationArea = all;
                }
                field("Summarize G/L Entries"; Rec."Summarize G/L Entries")
                {
                    ApplicationArea = all;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = all;
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = all;
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = all;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = all;
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = all;
                }
                field("Tax Invoice Renaming Threshold"; Rec."Tax Invoice Renaming Threshold")
                {
                    ApplicationArea = all;
                }
                field("USD Currency Code"; Rec."USD Currency Code")
                {
                    ApplicationArea = all;
                }
                field("Unit-Amount Decimal Places"; Rec."Unit-Amount Decimal Places")
                {
                    ApplicationArea = all;
                }
                field("Unit-Amount Rounding Precision"; Rec."Unit-Amount Rounding Precision")
                {
                    ApplicationArea = all;
                }
                field("Unrealized VAT"; Rec."Unrealized VAT")
                {
                    ApplicationArea = all;
                }
                field("VAT Exchange Rate Adjustment"; Rec."VAT Exchange Rate Adjustment")
                {
                    ApplicationArea = all;
                }
                field("VAT Reporting Date"; Rec."VAT Reporting Date")
                {
                    ApplicationArea = all;
                }
                field("VAT Reporting Date Usage"; Rec."VAT Reporting Date Usage")
                {
                    ApplicationArea = all;
                }
                field("VAT Rounding Type"; Rec."VAT Rounding Type")
                {
                    ApplicationArea = all;
                }
                field("VAT Tolerance %"; Rec."VAT Tolerance %")
                {
                    ApplicationArea = all;
                }
                field("VAT in Use"; Rec."VAT in Use")
                {
                    ApplicationArea = all;
                }
                field("Vendor Balances Due"; Rec."Vendor Balances Due")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

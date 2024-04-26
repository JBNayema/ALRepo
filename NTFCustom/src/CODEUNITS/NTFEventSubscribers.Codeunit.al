codeunit 50001 NTFEventsSub
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Correct Posted Sales Invoice", 'OnAfterCreateCopyDocument', '', false, false)]
    local procedure UpdateExtDocNo(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        NewExtDoc: Text[30];
    begin

        NewExtDoc := 'V2_' + CopyStr(SalesInvoiceHeader."External Document No.", 1, 25);

        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice then begin
            SalesHeader."External Document No." := NewExtDoc;
            SalesHeader."Your Reference" := SalesInvoiceHeader."No.";
            SalesHeader.Modify(false);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"TransferOrder-Post Receipt", 'OnBeforePostItemJournalLine', '', false, false)]
    local procedure CopyJournalLines(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferReceiptHeader: Record "Transfer Receipt Header"; TransferReceiptLine: Record "Transfer Receipt Line"; CommitIsSuppressed: Boolean; TransLine: Record "Transfer Line"; PostedWhseRcptHeader: Record "Posted Whse. Receipt Header")
    var
        NewLocation: Record Location;
        SourceCode: Code[10];
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
    begin

        ItemJournalLine.Init();
        ItemJournalLine."Journal Template Name" := 'ITEM';
        ItemJournalLine."Journal Batch Name" := 'CONS';
        ItemJournalLine."Line No." := GenerateLineNo();
        ItemJournalLine."Posting Date" := TransferReceiptHeader."Posting Date";
        ItemJournalLine."Document Date" := TransferReceiptHeader."Posting Date";
        ItemJournalLine."Document No." := TransferReceiptHeader."No.";
        ItemJournalLine."Document Type" := ItemJournalLine."Document Type"::"Transfer Receipt";
        ItemJournalLine."Document Line No." := TransferReceiptLine."Line No.";
        ItemJournalLine."Order Type" := ItemJournalLine."Order Type"::Transfer;
        ItemJournalLine."Order No." := TransferReceiptHeader."Transfer Order No.";
        ItemJournalLine."Order Line No." := TransferLine."Line No.";
        ItemJournalLine."External Document No." := TransferReceiptHeader."External Document No.";
        ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::Sale; //CHANGED FROM 'Transfer' to 'Sale'
        ItemJournalLine."Item No." := TransferReceiptLine."Item No.";
        ItemJournalLine.Description := TransferReceiptLine.Description;
        ItemJournalLine."Shortcut Dimension 1 Code" := TransferReceiptLine."Shortcut Dimension 1 Code";
        ItemJournalLine."New Shortcut Dimension 1 Code" := TransferReceiptLine."Shortcut Dimension 1 Code";
        ItemJournalLine."Shortcut Dimension 2 Code" := TransferReceiptLine."Shortcut Dimension 2 Code";
        ItemJournalLine."New Shortcut Dimension 2 Code" := TransferReceiptLine."Shortcut Dimension 2 Code";
        ItemJournalLine."Dimension Set ID" := TransferReceiptLine."Dimension Set ID";
        ItemJournalLine."New Dimension Set ID" := TransferReceiptLine."Dimension Set ID";
        //ItemJournalLine."Location Code" := TransHeader."In-Transit Code";
        ItemJournalLine."Location Code" := TransferLine."In-Transit Code";

        //ItemJournalLine."New Location Code" := TransferReceiptHeader."Transfer-to Code";
        ItemJournalLine."Location Code" := TransferReceiptHeader."Transfer-From Code";

        ItemJournalLine.Quantity := TransferReceiptLine.Quantity;
        ItemJournalLine."Invoiced Quantity" := TransferReceiptLine.Quantity;
        ItemJournalLine."Quantity (Base)" := TransferReceiptLine."Quantity (Base)";
        ItemJournalLine."Invoiced Qty. (Base)" := TransferReceiptLine."Quantity (Base)";
        ItemJournalLine."Source Code" := SourceCode;
        ItemJournalLine."Gen. Prod. Posting Group" := TransferReceiptLine."Gen. Prod. Posting Group";
        ItemJournalLine."Inventory Posting Group" := TransferReceiptLine."Inventory Posting Group";
        ItemJournalLine."Unit of Measure Code" := TransferReceiptLine."Unit of Measure Code";
        ItemJournalLine."Qty. per Unit of Measure" := TransferReceiptLine."Qty. per Unit of Measure";
        ItemJournalLine."Variant Code" := TransferReceiptLine."Variant Code";
        ItemJournalLine."New Bin Code" := TransLine."Transfer-To Bin Code";
        ItemJournalLine."Item Category Code" := TransLine."Item Category Code";
        if TransferLine."In-Transit Code" <> '' then begin
            if NewLocation.Code <> TransferLine."In-Transit Code" then
                NewLocation.Get(TransferLine."In-Transit Code");
            ItemJournalLine."Country/Region Code" := NewLocation."Country/Region Code";
        end;
        ItemJournalLine."Transaction Type" := TransferReceiptHeader."Transaction Type";
        ItemJournalLine."Transport Method" := TransferReceiptHeader."Transport Method";
        ItemJournalLine."Entry/Exit Point" := TransferReceiptHeader."Entry/Exit Point";
        ItemJournalLine.Area := TransferReceiptHeader.Area;
        ItemJournalLine."Transaction Specification" := TransferReceiptHeader."Transaction Specification";
        ItemJournalLine."Shpt. Method Code" := TransferReceiptHeader."Shipment Method Code";
        ItemJournalLine."Direct Transfer" := TransLine."Direct Transfer";
        ItemJournalLine.Insert();
        //WriteDownDerivedLines(TransferLine);
        //ItemJnlPostLine.SetPostponeReservationHandling(true);

    end;

    procedure GenerateLineNo() LineNo: Integer
    var
        ItemJournalLine: Record "Item Journal Line";
        PreviousLineNo: Integer;
    begin
        ItemJournalLine.SetRange("Journal Template Name", 'ITEM');
        ItemJournalLine.SetRange("Journal Batch Name", 'CONS');
        if ItemJournalLine.FindSet() then begin
            ItemJournalLine.SetRange("Line No.", ItemJournalLine."Line No.");
            PreviousLineNo := ItemJournalLine.GetRangeMax("Line No.");
            LineNo := PreviousLineNo + 10000;
        end;
    end;






}

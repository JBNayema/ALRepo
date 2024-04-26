tableextension 50002 TransferHeaderExt extends "Transfer Header"
{
    fields
    {


    }

    procedure RelocateInventory()
    var
        NewTransferLine: Record "Transfer Line";
    begin
        Item.Init();
        item.setfilter("No.", 'I1210'); //I0790|I1133|I1206|I1207|I1208|I1209|I1210|I1211
        if item.FindFirst() then
            repeat
                ItemNumber := Item."No.";
                ItemLedgerEntry.Init();
                ItemLedgerEntry.SetFilter("Item No.", '%1', Item."No.");
                ItemLedgerEntry.SetFilter("Location Code", 'PRODUCTION');
                ItemLedgerEntry.SetFilter(Open, 'Yes');

                NewDocNo := GenerateRandomDocNo();
                if ItemLedgerEntry.FindSet() then begin
                    TransferHeader.Init();
                    TransferHeader."No." := NewDocNo;
                    TransferHeader."Transfer-from Code" := 'PRODUCTION';
                    TransferHeader."Transfer-to Code" := 'AUCTION';
                    TransferHeader."Direct Transfer" := true;
                    TransferHeader."Posting Date" := WorkDate();
                    TransferHeader.Insert();

                    TransferHeader.SetFilter("No.", '%1', NewDocNo);
                    TransferHeader.LockTable();


                    g := 1000000000;
                    LineNo := Random(g);
                    SourceTableNo := 5740;
                    TargetTableNo := 5741;
                    SafeTransferFields(SourceTableNo, TargetTableNo);

                    NewTransferLine.SetFilter("Document No.", '%1', NewDocNo);
                    if NewTransferLine.FindFirst() then begin
                        NewTransferLine."Line No." := LineNo;
                        NewTransferLine."Transfer-from Code" := 'PRODUCTION';
                        NewTransferLine."Transfer-to Code" := 'AUCTION';
                        NewTransferLine."Direct Transfer" := true;
                        NewTransferLine."Item No." := 'I1210';
                        NewTransferLine.Quantity := Quantity;
                        NewTransferLine.Insert();
                    end;
                    //NewTransferLine.TransferFields(TransferHeader, true);
                    //NewTransferLine."Document No." := NewDocNo;




                    //Release.Run(TransferHeader);
                    CODEUNIT.Run(CODEUNIT::"TransferOrder-Post (Yes/No)", TransferHeader);

                end
                else begin
                    exit;
                end;
            until
            Item.NEXT = 0;

    end;


    procedure SetTransferLines() TransferLines: Record "Transfer Line"
    var


    begin
        Quantity := 1000;
        TransferLines.Init();
        TransferLines."Document No." := GenerateRandomDocNo();
        g := 1000000000;
        LineNo := Random(g);
        TransferLines."Line No." := LineNo;

        // TransferLines."Line No." += 10000;
        TransferLines."Transfer-from Code" := 'PRODUCTION';
        TransferLines."Transfer-to Code" := 'AUCTION';
        TransferLines."Direct Transfer" := true;
        TransferLines."Item No." := 'I1210';
        TransferLines.Quantity := Quantity;
        TransferLines.Insert();
        TransferLines.modify;
    end;






    local procedure DetermineTransferOrderSeriesNo(): Code[20]
    var
        InventorySetup: Record "Inventory Setup";
    begin
        InventorySetup.Get();
        exit(InventorySetup."Transfer Order Nos.");
    end;

    procedure getItemNo(): code[20]
    begin

    end;

    procedure GenerateRandomDocNo() DocNo: Code[20]
    var
        x: integer;
        y: Integer;
    begin
        x := 1000000000;
        y := Random(x);
        DocNo := Format(y);
    end;

    Procedure SafeTransferFields(SourceTableID: Integer; TargetTableID: Integer);
    var
        SourceRef: RecordRef;
        TargetRef: RecordRef;
        FldRef: FieldRef;
        FieldsSource: Record Field;
        FieldsTarget: Record Field;
        FieldsNoToTransfer: Record Integer temporary;

    begin
        FieldsSource.SetRange(TableNo, SourceTableID);
        FieldsSource.SetRange(Class, FieldsSource.Class::Normal);
        FieldsSource.SetRange(Enabled, true);
        FieldsSource.SetFilter("No.", '%1', 1);
        IF FieldsSource.FindSet() then
            repeat
                //Check if the field exists in the destination table and if the criteria for the trasfer are satisfied
                if FieldsTarget.GET(TargetTableID, FieldsSource."No.") then
                    if (FieldsTarget.Class = FieldsSource.Class) and
                        (FieldsTarget.Type = FieldsSource.Type) and
                        (FieldsTarget.ObsoleteState <> FieldsTarget.ObsoleteState::Removed)
                    then begin
                        //This field must be transferred
                        FieldsNoToTransfer.Number := FieldsSource."No.";
                        FieldsNoToTransfer.Insert();
                    end;
            until FieldsSource.Next() = 0;

        if FieldsNoToTransfer.IsEmpty then
            exit;  //There are no fields to transfer

        //Execute the transferfields of the selected fields
        SourceRef.Open(SourceTableID);
        TargetRef.Open(TargetTableID);
        if SourceRef.FindSet() THEN
            repeat
                FieldsNoToTransfer.FindSet();
                repeat
                    FldRef := TargetRef.Field(FieldsNoToTransfer.Number);
                    FldRef.Value := SourceRef.Field(FieldsNoToTransfer.Number).Value;
                until FieldsNoToTransfer.Next() = 0;
                TargetRef.Insert();
            until SourceRef.Next() = 0;
    end;




    var
        Item: Record Item;
        ItemLedgerEntry: Record "Item Ledger Entry";
        Quantity: Decimal;
        TransferHeader: Record "Transfer Header";
        TransferLine: Record "Transfer Line";
        transferOrder: Page "Transfer Order";
        Release: Codeunit "Release Transfer Document";
        ItemNumber: Code[20];
        g: Integer;
        LineNo: Integer;
        Location: record Location;
        Items: page "Item Card";
        bankaccrecon: record "Bank Acc. Reconciliation";
        bankacc: page "Bank Acc. Reconciliation";
        productionorder: record "Production Order";
        ITL: Page "Item Ledger Entries";
        itemavaila: page "Item Avail. by Location Lines";
        ItemList: Page "Item List";
        itemregister: record "Item Register";
        PaymentJnl: Page "Payment Journal";
        VendLedgENtries: Page "Vendor Ledger Entries";
        postingType: enum "Gen. Journal Source Type";
        ItemList1: Page "Item List";
        Text000: Label '&Ship,&Receive';
        TransHeader: Record "Transfer Header";
        NewDocNo: Code[20];
        SourceTableNo: Integer;
        TargetTableNo: Integer;

    ///find a better way to generate line numbers than random numbers which may clash with the existing ones


}
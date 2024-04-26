codeunit 50000 NTFCustom
{
    procedure CalculateGreenLeaf() MonthQty: Decimal;
    var
        GreanLeafQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        GreanLeafQuantity.SETRANGE(Posting_Date, CALCDATE('<-CM>', WORKDATE), WORKDATE);
        GreanLeafQuantity.SETFILTER(Entry_Type, '%1|%2', ItemLedgerEntry."Entry Type"::"Positive Adjmt.", ItemLedgerEntry."Entry Type"::Purchase, ItemLedgerEntry."Entry Type"::"Negative Adjmt.");
        GreanLeafQuantity.SETFILTER(Item_No, '%1', 'I0763');
        GreanLeafQuantity.OPEN;
        IF GreanLeafQuantity.READ THEN
            MonthQty := GreanLeafQuantity.Sum_Quantity;
    end;

    procedure CalculateGreenLeafYTD() YearQty: Decimal;
    var
        GreanLeafQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
        FiscalStart: Date;

    begin
        FiscalStart := GetAccPeriodStart;

        GreanLeafQuantity.SETFILTER(Posting_Date, '%1..%2', FiscalStart, WORKDATE);
        GreanLeafQuantity.SETFILTER(Entry_Type, '%1|%2', ItemLedgerEntry."Entry Type"::"Positive Adjmt.", ItemLedgerEntry."Entry Type"::Purchase, ItemLedgerEntry."Entry Type"::"Negative Adjmt.");
        GreanLeafQuantity.SETFILTER(Item_No, '%1', 'I0763');
        GreanLeafQuantity.OPEN;
        IF GreanLeafQuantity.READ THEN
            YearQty := GreanLeafQuantity.Sum_Quantity;
    end;



    procedure CalculateMadeTea() Qty: Decimal;
    var
        GreenLeafMonth: Decimal;
        ProducedMonth: Decimal;

    begin
        GreenLeafMonth := CalculateGreenLeaf;

        // Qty := (Rec."Produced Tea - Month" / GreenLeafMonth) * 100;

        // "Made Tea Percentage" := ("Produced Tea - Month" / "Green Leaf Received-month") * 100;

    end;

    procedure CalculatePackedTea() MonthQty: Decimal;
    var
        PackedTeaQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        PackedTeaQuantity.SETRANGE(Posting_Date, CALCDATE('<-CM>', WORKDATE), WORKDATE);
        PackedTeaQuantity.SETFILTER(Entry_Type, '%1', ItemLedgerEntry."Entry Type"::Output);
        PackedTeaQuantity.SetFilter(Item_No, '%1..%2', 'I1089', 'I1211'); //I0698|I0722..I0729|I0762|I0784|I0789..I0791|I1089|I1133|I1205..I1211
        PackedTeaQuantity.OPEN;
        IF PackedTeaQuantity.READ THEN
            MonthQty := PackedTeaQuantity.Sum_Quantity;
    end;

    procedure CalculatePackedTeaYTD() YearQty: Decimal;
    var
        PackedTeaQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
        FiscalStart: Date;

    begin
        FiscalStart := GetAccPeriodStart;
        PackedTeaQuantity.SETFILTER(Posting_Date, '%1..%2', FiscalStart, WORKDATE);
        PackedTeaQuantity.SETFILTER(Entry_Type, '%1', ItemLedgerEntry."Entry Type"::Output);
        PackedTeaQuantity.SetFilter(Item_No, '%1..%2', 'I1089', 'I1211'); //I0698|I0722..I0729|I0762|I0784|I0789..I0791|I1089|I1133|I1205..I1211
        PackedTeaQuantity.OPEN;
        IF PackedTeaQuantity.READ THEN
            YearQty := PackedTeaQuantity.Sum_Quantity;
    end;


    procedure CalculateDispatchToPacker() MonthQty: Decimal;
    var
        DispatchToPackerQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
    //TransShipLine: Record "Transfer Shipment Line";
    begin
        DispatchToPackerQuantity.SETRANGE(Posting_Date, CALCDATE('<-CM>', WORKDATE), WORKDATE);
        DispatchToPackerQuantity.SETFILTER(Entry_Type, '%1', ItemLedgerEntry."Document Type"::"Transfer Shipment");
        // DispatchToPackerQuantity.SETFILTER(Location_code,  '=%1', 'PRODUCTION');
        DispatchToPackerQuantity.SETFILTER(Location_code, 'PRODUCTION');
        DispatchToPackerQuantity.OPEN;
        IF DispatchToPackerQuantity.READ THEN
            MonthQty := ABS(DispatchToPackerQuantity.Sum_Quantity);
    end;


    Procedure AfterDispatchPackers() MonthQty: Decimal;
    var
        DispatchToPackerQuantity: Query DispatchPackersQuery;
        TransShipLine: Record "Transfer Shipment Line";
    begin
        DispatchToPackerQuantity.SETRANGE(shipment_date, CALCDATE('<-CM>', WORKDATE), WORKDATE);
        DispatchToPackerQuantity.SETFILTER(transfer_from_code, '%1', 'PRODUCTION');
        DispatchToPackerQuantity.SETFILTER(transfer_TO_code, '%1', 'PACKERS');

        DispatchToPackerQuantity.OPEN;
        IF DispatchToPackerQuantity.READ THEN
            MonthQty := ABS(DispatchToPackerQuantity.Sum_Quantity);
    end;



    procedure CalculateDispatchToPackerYTD() YearQty: Decimal;
    var
        DispatchToPackerQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
        FiscalStart: Date;
    begin
        FiscalStart := GetAccPeriodStart;
        DispatchToPackerQuantity.SETFILTER(Posting_Date, '%1..%2', FiscalStart, WORKDATE);
        DispatchToPackerQuantity.SETFILTER(Entry_Type, '%1', ItemLedgerEntry."Document Type"::"Transfer Shipment");
        DispatchToPackerQuantity.SETFILTER(Location_code, '%1', 'PRODUCTION');
        DispatchToPackerQuantity.OPEN;
        IF DispatchToPackerQuantity.READ THEN
            YearQty := -DispatchToPackerQuantity.Sum_Quantity;
    end;

    procedure CalculateDispatchToAuction() MonthQty: Decimal;
    var
        DispatchToAuctionQuantity: Query GreenLeafCustom;
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        DispatchToAuctionQuantity.SETRANGE(Posting_Date, CALCDATE('<-CM>', WORKDATE), WORKDATE);
        DispatchToAuctionQuantity.SETFILTER(Entry_Type, '%1', ItemLedgerEntry."Document Type"::"Transfer Shipment");
        DispatchToAuctionQuantity.SETFILTER(Location_code, '%1', 'Auction');
        DispatchToAuctionQuantity.OPEN;
        IF DispatchToAuctionQuantity.READ THEN
            MonthQty := DispatchToAuctionQuantity.Sum_Quantity;
    end;

    procedure CalculateProducedYTD() YearQty: Decimal;
    var
        ProdOrderView: Query "ProdOrderQuery.al";
        ProdOrderRec: Record "Production Order";

        FiscalStart: Date;
    begin
        FiscalStart := GetAccPeriodStart;
        //   CalcFormula = sum("Production Order".Quantity WHERE("Source Type" = const(Family),
        //                                                                 "Source No." = filter('SORTED TEAS'),
        // "Starting Date" = field("Month Date Filter")));

        ProdOrderView.SETFILTER(StartingDate, '%1..%2', FiscalStart, WORKDATE);
        ProdOrderView.SETFILTER(SourceType, '%1', ProdOrderRec."Source Type"::Family);
        ProdOrderView.SETFILTER(SourceNo, '%1', 'SORTED TEAS');
        ProdOrderView.Open;
        IF ProdOrderView.Read then
            YearQty := ProdOrderView.Sum_Quantity;



    end;

    procedure CalculateProducedMonth() MonthQty: Decimal;
    var
        ProdOrderView: Query "ProdOrderQuery.al";
        ProdOrderRec: Record "Production Order";

        FiscalStart: Date;
    begin
        FiscalStart := GetAccPeriodStart;
        //   CalcFormula = sum("Production Order".Quantity WHERE("Source Type" = const(Family),
        //                                                                 "Source No." = filter('SORTED TEAS'),
        // "Starting Date" = field("Month Date Filter")));

        ProdOrderView.SETFILTER(StartingDate, '%1..%2', CALCDATE('<-CM>', WORKDATE), WORKDATE);
        ProdOrderView.SETFILTER(SourceType, '%1', ProdOrderRec."Source Type"::Family);
        ProdOrderView.SETFILTER(SourceNo, '%1', 'SORTED TEAS');
        ProdOrderView.Open;
        IF ProdOrderView.Read then
            MonthQty := ProdOrderView.Sum_Quantity;



    end;




    procedure GetAccPeriodStart() FiscalDate: Date;

    var
        AccountingPeriod: Record "Accounting Period";
        Date1: Date;
        Date2: Date;

    begin
        AccountingPeriod.RESET;
        AccountingPeriod.SETRANGE("New Fiscal Year", true);
        AccountingPeriod."Starting Date" := WORKDATE;
        AccountingPeriod.FIND('=<');
        Date1 := AccountingPeriod."Starting Date";
        IF AccountingPeriod.NEXT = 0 THEN
            Date2 := 99991231D
        ELSE
            Date2 := AccountingPeriod."Starting Date" - 1;

        FiscalDate := Date1;
    end;




}
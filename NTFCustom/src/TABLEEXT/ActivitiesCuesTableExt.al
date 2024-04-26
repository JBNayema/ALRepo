tableextension 50010 ProductCues extends "Activities Cue"
{

    fields
    {
        // Add changes to table fields here
        field(50011; "Green Leaf Received Today"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Green Leaf Received Today (KGS)';
            DecimalPlaces = 0;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Entry Type" = filter(Purchase | "Positive Adjmt." | "Negative Adjmt."),
                                                                "Item No." = filter('I0763'),
                                                                "Posting Date" = field("Prod. Date Filter")));
            Editable = false;

        }
        field(50016; "Green Leaf Received-month"; Decimal)
        {

            Caption = 'Green Leaf Received-month (KGS)';
            DecimalPlaces = 0;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Entry Type" = filter(Purchase | "Positive Adjmt." | "Negative Adjmt."),
                                                                "Item No." = filter('I0763'),
                                                                "Posting Date" = field("Month Date Filter")));
            Editable = false;



        }
        field(50017; "Green Leaf Received-YTD"; Decimal)
        {

            Caption = 'Green Leaf Received-YTD (KGS)';
            DecimalPlaces = 0;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Entry Type" = filter(Purchase | "Positive Adjmt." | "Negative Adjmt."),
                                                                "Item No." = filter('I0763'),
                                                                "Posting Date" = field("YTD Date Filter")));
            Editable = false;
        }
        field(50029; "Produced Tea - Today"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Produced Tea - Today (KGS)';
            CalcFormula = sum("Production Order".Quantity WHERE("Source Type" = const(Family),
                                                                "Source No." = filter('SORTED TEAS'),
                                                                "Starting Date" = field("Prod. Date Filter")));
            DecimalPlaces = 0;
            Editable = false;

        }
        field(50012; "Produced Tea - Month"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Produced Tea - Month (KGS)';
            CalcFormula = sum("Production Order".Quantity WHERE("Source Type" = const(Family),
                                                                "Source No." = filter('SORTED TEAS'),
                                                                "Starting Date" = field("Month Date Filter")));
            DecimalPlaces = 0;
            Editable = false;

        }

        field(50024; "Produced Tea - YTD"; Decimal)
        {
            Caption = 'Produced Tea - YTD (KGS)';
            DecimalPlaces = 0;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Production Order".Quantity WHERE("Source Type" = const(Family),
                                                                "Source No." = filter('SORTED TEAS'),
                                                                "Starting Date" = field("YTD Date Filter")));


        }
        field(50013; "Packed Tea Today"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Packed Tea Today (KGS)';
            DecimalPlaces = 0;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Entry Type" = CONST(Output),
                                                                 "Posting Date" = FIELD("Prod. Date Filter"), "Item No." = filter('I1089..I1211')));
            Editable = false;
        }
        field(50018; "Packed Tea-month"; Decimal)
        {
            //DataClassification = ToBeClassified;
            Caption = 'Packed Tea-month (KGS)';
            DecimalPlaces = 0;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Entry Type" = CONST(Output),
                                                                 "Posting Date" = FIELD("Month Date Filter"), "Item No." = filter('I1089..I1211')));
            Editable = false;
        }
        field(50033; "Packed Tea YTD"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Packed Tea YTD (KGS)';
            DecimalPlaces = 0;
            CalcFormula = sum("Item Ledger Entry".Quantity WHERE("Entry Type" = CONST(Output),
                                                                 "Posting Date" = FIELD("YTD Date Filter"), "Item No." = filter('I1089..I1211')));
            Editable = false;
        }
        field(50014; "Dispatch To Packers - Today"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Dispatch To Packers - Today (KGS)';
            DecimalPlaces = 0;
            CalcFormula = sum("Transfer Shipment Line".Quantity WHERE("Transfer-to Code" = filter('PACKERS'),
                                                                "Transfer-from Code" = filter('PRODUCTION'),
                                                                "Shipment Date" = FIELD("Prod. Date Filter")));
            Editable = false;
        }

        field(50019; "Dispatch To Packers-month"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Dispatch To Packers-Month (KGS)';
            CalcFormula = sum("Transfer Shipment Line".Quantity WHERE("Transfer-to Code" = filter('PACKERS'),
                                                                "Transfer-from Code" = filter('PRODUCTION'),
                                                                "Shipment Date" = FIELD("Month Date Filter")));
            Editable = false;

            DecimalPlaces = 0;
        }
        field(50025; "Dispatch To Packers-YTD"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Dispatch To Packers - YTD (KGS)';
            DecimalPlaces = 0;
            CalcFormula = sum("Transfer Shipment Line".Quantity WHERE("Transfer-to Code" = filter('PACKERS'),
                                                                "Transfer-from Code" = filter('PRODUCTION'),
                                                                "Shipment Date" = FIELD("YTD Date Filter")));
            Editable = false;
        }
        field(50015; "Dispatch To Auction"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Dispatch To Auction - Today (KGS)';
            CalcFormula = sum("Transfer Shipment Line".Quantity WHERE("Transfer-to Code" = filter('AUCTION'),
                                                                "Transfer-from Code" = filter('PRODUCTION'),
                                                                "Shipment Date" = FIELD("Prod. Date Filter")));
            Editable = false;
            DecimalPlaces = 0;
        }
        field(50020; "Dispatch To Auction-month"; Decimal)
        {
            Caption = 'Dispatch To Auction-month (KGS)';
            FieldClass = FlowField;
            Editable = false;
            DecimalPlaces = 0;
            CalcFormula = sum("Transfer Shipment Line".Quantity WHERE("Transfer-to Code" = filter('AUCTION'),
                                                                "Transfer-from Code" = filter('PRODUCTION'),
                                                                "Shipment Date" = FIELD("Month Date Filter")));
        }
        field(50032; "Dispatch To Auction- YTD"; Decimal)
        {
            // DataClassification = CustomerContent;
            Caption = 'Dispatch To Auction- YTD (KGS)';
            FieldClass = FlowField;
            DecimalPlaces = 0;
            CalcFormula = sum("Transfer Shipment Line".Quantity WHERE("Transfer-to Code" = filter('AUCTION'),
                                                                "Transfer-from Code" = filter('PRODUCTION'),
                                                                "Shipment Date" = FIELD("YTD Date Filter")));
            Editable = false;
        }
        field(50021; "Prod. Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50022; "Month Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50034; "YTD Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50023; "Made Tea Percentage"; Decimal)
        {
            Caption = 'Made Tea';
            Editable = false;
            DecimalPlaces = 2;
        }
        field(50027; "Made Tea YTD"; Decimal)
        {
            Caption = 'Made Tea YTD';
            Editable = false;
            DecimalPlaces = 2;
        }
        field(50035; "Outturn Ratio"; Decimal)
        {
            Caption = 'Outturn Ratio - Month';
            Editable = false;
            DecimalPlaces = 2;

        }
        field(50028; "Auction Sales- This Month"; Decimal)
        {

        }

    }

    procedure CalculateMadeTea() Qty: Decimal;
    var
        GreenLeafMonth: Decimal;
        ProducedMonth: Decimal;
        NTFCustom: Codeunit NTFCustom;

    begin
        GreenLeafMonth := NTFCustom.CalculateGreenLeaf;
        CalcFields("Produced Tea - Month");

        IF (GreenLeafMonth <> 0) AND ("Produced Tea - Month" <> 0) THEN
            Qty := ("Produced Tea - Month" / GreenLeafMonth) * 100;

    end;

    procedure CalculateMadeTeaYTD() Qty: Decimal;
    var
        GreenLeafYTD: Decimal;
        ProducedYTD: Decimal;
        NTFCustom: Codeunit NTFCustom;

    begin
        GreenLeafYTD := NTFCustom.CalculateGreenLeafYTD;
        // CalcFields("Produced Tea - YTD");

        IF (GreenLeafYTD <> 0) AND ("Produced Tea - YTD" <> 0) THEN
            Qty := ("Produced Tea - YTD" / GreenLeafYTD) * 100;


    end;


    procedure OutTurnCalculation() Outturn: Decimal
    var
        ProdOrder: Record "Production Order";
        ProdOrder1: Record "Production Order";
        ItemLedgerEntry: Record "Item Ledger Entry";
        GreanLeafQuantity: Query GreenLeafCustom;
        MaxDate: Date;
        MonthlyProduce: Decimal;
        MonthlyReceieved: Decimal;
    begin
        StartDate := CalcDate('<-CM>', WorkDate);
        //obtain the monthly produce
        MonthlyProduce := NTFCustom.CalculateProducedMonth();
        //calculate the last date of tea production
        StartDate := CalcDate('<-CM>', WorkDate);
        // Initialize the ProdOrder record
        ProdOrder.Init();

        // Set filters on ProdOrder
        ProdOrder.SetFilter("Source Type", 'Family');
        ProdOrder.SetFilter("Source No.", 'SORTED TEAS');
        ProdOrder.SetFilter("Starting Date", '%1..%2', StartDate, WorkDate);

        // Get the maximum date from ProdOrder
        ProdOrder.SetCurrentKey("Starting Date-Time", "Starting Date");
        ProdOrder.SetAscending("Starting Date", true);
        if ProdOrder.FindLast() then begin
            MaxDate := ProdOrder."Starting Date";
        end;


        //calculate tea recieved that month
        // Set filters on GreanLeafQuantity
        GreanLeafQuantity.SETrange(Posting_Date, StartDate, maxdate);
        GreanLeafQuantity.SETFILTER(Entry_Type, '%1|%2|%3',
            ItemLedgerEntry."Entry Type"::"Positive Adjmt.",
            ItemLedgerEntry."Entry Type"::Purchase,
            ItemLedgerEntry."Entry Type"::"Negative Adjmt.");
        GreanLeafQuantity.SETFILTER(Item_No, '%1', 'I0763');

        // Open the query
        GreanLeafQuantity.OPEN;

        // Read the data and calculate the sum quantity
        IF GreanLeafQuantity.READ THEN
            MonthlyReceieved := GreanLeafQuantity.Sum_Quantity;
        if (MonthlyProduce <> 0) and (MonthlyReceieved <> 0) then
            Outturn := ((MonthlyProduce / MonthlyReceieved) * 100);

    end;








    var
        myInt: Integer;
        FiscalStart: Date;
        StartDate: date;
        NTFCustom: Codeunit NTFCustom;



}
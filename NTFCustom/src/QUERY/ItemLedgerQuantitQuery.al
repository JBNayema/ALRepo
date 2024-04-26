query 50010 GreenLeafCustom
{
    Caption = 'Item Ledg. Quatity (Calc)';


    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            filter(Entry_Type; "Entry Type")
            {

            }
            filter(Item_No; "Item No.")
            {

            }
            filter(Document_Type; "Document Type")
            {

            }
            filter(Location_Code; "Location Code")
            {

            }
            filter(Posting_date; "Posting Date")
            {

            }
            column(Sum_Quantity; Quantity)
            {
                Method = Sum;

            }
        }
    }
}


query 50012 DispatchPackersQuery
{
    Caption = 'TransferShipLine (Calc)';


    elements
    {
        dataitem(TransshipLine; "Transfer shipment Line")
        {
            filter(Shipment_Date; "Shipment Date")
            {

            }
            filter(Transfer_from_Code; "Transfer-from Code")
            {

            }
            filter(Transfer_to_Code; "Transfer-to Code")
            {

            }

            column(Sum_Quantity; Quantity)
            {
                Method = Sum;

            }
        }
    }
}
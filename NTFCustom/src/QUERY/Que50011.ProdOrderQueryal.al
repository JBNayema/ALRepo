query 50011 "ProdOrderQuery.al"
{
    Caption = 'ProdOrderQuery';
    QueryType = Normal;
    
    elements
    {
        dataitem(ProductionOrder; "Production Order")
        {
            filter(No; "No.")
            {
            }
            filter(LocationCode; "Location Code")
            {
            }
            filter(InventoryPostingGroup; "Inventory Posting Group")
            {
            }
            filter(FinishedDate; "Finished Date")
            {
            }
            filter(EndingDate; "Ending Date")
            {
            }
            filter(DueDate; "Due Date")
            {
            }
            filter(SourceType; "Source Type")
            {
            }
            filter(SourceNo; "Source No.")
            {
            }
        
            filter(Status; Status)
            {
            }
            filter(StartingDate; "Starting Date")
            {
            }
            filter(EndingDateTime; "Ending Date-Time")
            {
            }
                column(Sum_Quantity; Quantity)
            {
                Method =Sum;
            }
        }
    }
    

}

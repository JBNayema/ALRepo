page 50000 "Reorder Quantities"
{
    ApplicationArea = All;
    Caption = 'Reorder Quantities';
    PageType = List;
    SourceTable = "Reorder Quantity";
    UsageCategory = Lists;
    CardPageId = "Reorder Quantity Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(LocationTo; Rec.LocationTo)
                {
                    ApplicationArea = all;
                }
                field(QuantityAtLocation; Rec.QuantityAtLocation)
                {
                    ApplicationArea = all;
                }
                field(ReorderLevel; Rec.ReorderLevel)
                {
                    ApplicationArea = all;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Replenish)
            {
                ApplicationArea = Location;
                Caption = 'Replenish Inventories';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Release the document to the next stage of processing. You must reopen the document before you can make changes to it.';
                trigger OnAction()
                begin
                    TransferDetails();
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        Item: Record Item;
    begin
        CopyItems();
    end;



    local procedure CopyItems()
    var
        Item: Record Item;
        Reorder: Record "Reorder Quantity";
        ItemNo: Code[20];
        ReorderItemNo: Code[20];
        Location: Record Location;
    begin
        item.reset;
        reorder.reset;
        reorder.DeleteAll();
        item.SetFilter("Item Category Code", '%1|%2', 'TEA', 'PACKEDTEA');
        if item.FindFirst() then
            repeat
                ItemNo := item."No.";
                Reorder.reset;
                Reorder.SetFilter("Item No", '<>%1', ItemNo);
                if Reorder.Findset() then begin
                    Location.Init();
                    Location.SetFilter("Tea Storage", '%1', true);
                    if Location.FindFirst() then
                        repeat
                            Reorder."Item No" := Item."No.";
                            Reorder.Description := item.Description;
                            Reorder.LocationTo := Location.Code;
                            Reorder.ReorderLevel := item."Reorder Point";
                            reorder.Insert()
                        until
                            Location.Next() = 0;

                end
                else
                    if reorder.IsEmpty then begin
                        Location.Init();
                        Location.SetFilter("Tea Storage", '%1', true);
                        if Location.FindFirst() then
                            repeat
                                Reorder."Item No" := Item."No.";
                                Reorder.Description := item.Description;
                                Reorder.LocationTo := Location.Code;
                                Reorder.ReorderLevel := item."Reorder Point";
                                reorder.Insert()
                            until
                                Location.Next() = 0;
                    end;
            until
            item.next = 0;
    end;


    procedure TransferDetails()
    begin
        Rec.init;
        if rec.FindFirst() then
            repeat
                ItemNumber := rec."Item No";
                Rec.Init();
                rec.SetFilter("Item No", '%1', ItemNumber);
                if rec.FindSet() then
                    repeat
                        if Rec.QuantityAtLocation > Rec.ReorderLevel then begin
                            LocationFrom := Rec.LocationTo;
                            DifferenceQuantity := Rec.QuantityAtLocation - rec.ReorderLevel;
                            Reorder1.init;
                            Reorder1.SetFilter("Item No", '%1', ItemNumber);
                            reorder1.SetFilter(LocationTo, '<>%1', LocationFrom);
                            CountRows := Reorder1.Count;
                            TransferQuantity := (DifferenceQuantity / CountRows);
                            if Reorder1.FindSet() then
                                repeat
                                    ItemNumber := Reorder1."Item No";
                                    LocationTo := Reorder1.LocationTo;
                                    TransferOrder();
                                until Reorder1.next = 0;
                        end

                    until Rec.Next() = 0;
            until Rec.Next = 0;
    end;

    procedure TransferOrder()
    var
        TransferLine: Record "Transfer Line";
        Release: Codeunit "Release Transfer Document";
        TransferHeader: Record "Transfer Header";
        Post: CODEUNIT "TransferOrder-Post (Yes/No)";
        TransferPage: Page "Transfer Order";
    begin
        FinalDocNo := GenerateDocNo();
        FinalLineNo := GenerateLineNumber();
        TransferHeader.Init;


        TransferLine.init;
        TransferLine."Direct Transfer" := true;
        TransferLine."Document No." := FinalDocNo;
        TransferLine."Line No." := FinalLineNo;
        TransferLine.SetLoadFields("Document No.", "Line No.");
        TransferLine."Transfer-from Code" := LocationFrom;
        TransferLine."Transfer-to Code" := LocationTo;
        TransferLine."Direct Transfer" := true;
        TransferLine."Item No." := ItemNumber;
        TransferLine.Quantity := TransferQuantity;
        TransferLine.Insert();


        //TransferHeader.TransferFields(TransferLine, false);
        TransferHeader."No." := FinalDocNo;
        TransferHeader."Transfer-from Code" := LocationFrom;
        TransferHeader."Transfer-to Code" := LocationTo;
        TransferHeader."Posting Date" := WorkDate();
        TransferHeader."Direct Transfer" := true;
        TransferHeader.Insert();

        //Release.Run(TransferHeader);
        //Post.Run(TransferHeader);





    end;

    Procedure ReleaseTransferOrder()
    begin

    end;

    procedure GenerateLineNumber() NewLineNo: Integer
    begin
        TransLine.reset;
        TransLine.SetFilter("Line No.", '%1..%2', 0, 999999999);
        LineNo := TransLine.GetRangeMax("Line No.");
        NewLineNo := LineNo + 10000;
        //EXIT(NewLineNo);
    end;

    Procedure GenerateDocNo() DocNo: Code[20]
    begin
        MaxNo := 1000000000;
        No := System.Random(MaxNo);
        DocNo := Format(No);
    end;




    var
        ItemNumber: Code[20];
        TransferQuantity: Decimal;
        LocationTo: Code[10];
        LocationFrom: Code[10];
        DifferenceQuantity: Decimal;
        Reorder: Record "Reorder Quantity";
        Reorder1: Record "Reorder Quantity";
        CountRows: Integer;
        TransLine: Record "Transfer Line";
        LineNo: Integer;
        No: Integer;
        MaxNo: Integer;
        FinalDocNo: Code[20];
        FinalLineNo: Integer;
    //NewLineNo: Integer;
}

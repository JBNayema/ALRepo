codeunit 50101 CPIEvents
{
    EventSubscriberInstance = StaticAutomatic;
    [EventSubscriber(ObjectType::Table, Database::"Payment Buffer", 'OnCopyFieldsFromVendorLedgerEntry', '', true, true)]
    procedure CopyCustomFieldstoPaymentBuffer(var PaymentBufferTarget: Record "Payment Buffer"; VendorLedgerEntrySource: Record "Vendor Ledger Entry")
    begin

        PaymentBufferTarget.Description := VendorLedgerEntrySource.Description;
	PaymentBufferTarget.ExtDocNo := VendorLedgerEntrySource."External Document No.";
    end;


}
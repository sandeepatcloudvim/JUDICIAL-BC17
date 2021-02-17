pageextension 50005 ExtendGeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        addafter(Amount)
        {
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = All;
                Caption = 'Vendor No.';
            }
            field(SourceName; SourceName)
            {
                ApplicationArea = All;
                Caption = 'Vendor Name';
            }
            field(PuchaseInvoiceDesc; PuchaseInvoiceDesc)
            {
                ApplicationArea = All;
                Caption = 'Purch. Invoice Description';

            }

        }
        addafter("External Document No.")
        {
            field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
            }

            field(Comment; Rec.Comment)
            {
                ApplicationArea = All;
                Caption = 'Comment';
            }
        }
    }

    actions
    {
        addafter("Value Entries")
        {
            action("Update Source Details")
            {
                ApplicationArea = All;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = report "Update Dimension";

            }
        }
    }

    var
        myInt: Integer;
        SourceName: Text[150];
        PuchaseInvoiceDesc: Text[150];
        recPurchInvLine: Record "Purch. Inv. Line";

    trigger OnAfterGetRecord()
    var
        EventSub: Codeunit ExtendEvents;
    begin
        EventSub.UpdateGLDimension(Rec);

        clear(PuchaseInvoiceDesc);
        PuchaseInvoiceDesc := UpdatePurchaseInvoiceDesc(Rec."Document No.", Rec."Dimension Set ID", Rec."Debit Amount");

        Clear(SourceName);
        SourceName := UpdateSourceDetails(Rec."Source No.", Rec."Source Type");
    end;

    procedure UpdatePurchaseInvoiceDesc(DocumnetNo: Code[50]; DimensionSetID: Integer; DbtAmount: Decimal): Text[150]
    var
    begin
        recPurchInvLine.Reset();
        recPurchInvLine.Setrange("Document No.", DocumnetNo);
        recPurchInvLine.SetRange("Dimension Set ID", DimensionSetID);
        recPurchInvLine.SetRange("Line Amount", DbtAmount);
        IF recPurchInvLine.FindFirst() THEN
            EXIT(recPurchInvLine.Description);
    end;

    local procedure UpdateSourceDetails(SourceNo: Code[50]; AccountType: Enum "Gen. Journal Source Type"): Text[150]
    var
        recVendor: Record Vendor;
        recCustomer: Record Customer;
        recFixedAsset: Record "Fixed Asset";
        recBankAccount: Record "Bank Account";
        recEmployee: Record Employee;
        recGeneralJournal: Record "Gen. Journal Line";
        recIC: Record "IC Partner";
        JournalAccountType: Enum "Gen. Journal Account Type";
    begin
        if AccountType = AccountType::Vendor then begin
            if recVendor.get(SourceNo) then
                exit(recVendor.Name);
        end else
            if AccountType = AccountType::Customer then begin
                if recCustomer.get(SourceNo) then
                    exit(recCustomer.Name);
            end else
                if AccountType = AccountType::"Fixed Asset" then begin
                    if recFixedAsset.get(SourceNo) then
                        exit(recFixedAsset.Description);
                end else
                    if AccountType = AccountType::"Bank Account" then begin
                        if recBankAccount.get(SourceNo) then
                            exit(recBankAccount.Name);
                    end else
                        if AccountType = AccountType::Employee then begin
                            if recEmployee.Get(SourceNo) then
                                exit(recEmployee."First Name" + ' ' + recEmployee."Last Name");
                        end else
                            if AccountType = AccountType::"IC Partner" then begin
                                if recIC.get(SourceNo) then
                                    exit(recIC.Name);
                            end;
    end;



}
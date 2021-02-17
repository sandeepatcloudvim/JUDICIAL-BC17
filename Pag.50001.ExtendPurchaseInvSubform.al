pageextension 50001 ExtendPurchInvSubform extends "Purch. Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::"G/L Account";
        Rec.Quantity := 1;
    end;
}
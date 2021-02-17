pageextension 50000 ExtendPurchaseInvoices extends "Purchase Invoices"
{
    layout
    {
        addafter("Location Code")
        {
            field("Responsibility Center"; rec."Responsibility Center")
            {
                ApplicationArea = All;
                Caption = 'Responsibility Center';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;


}
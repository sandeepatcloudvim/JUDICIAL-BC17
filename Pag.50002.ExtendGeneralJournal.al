pageextension 50002 ExtendGeneralJournal extends "General Journal"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
            }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Amount (LCY)")
        {
            field("Debit Amount1"; Rec."Debit Amount")
            {
                ApplicationArea = All;
                Caption = 'Debit Amount';
            }
            field("Credit Amount1"; Rec."Credit Amount")
            {
                ApplicationArea = All;
                Caption = 'Credit Amount';
            }
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify(ShortcutDimCode6)
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify(ShortcutDimCode7)
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify(ShortcutDimCode8)
        {
            Visible = false;
            ApplicationArea = All;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

}
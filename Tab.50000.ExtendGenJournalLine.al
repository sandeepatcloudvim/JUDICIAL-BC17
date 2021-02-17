tableextension 50000 ExtendGenJournalLine extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = CustomerContent;
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            DataClassification = CustomerContent;
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
        ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
    end;
}
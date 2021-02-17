tableextension 50001 ExtendGLEntry extends "G/L Entry"
{
    fields
    {
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = CustomerContent;
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

        }

        field(50001; Comment; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Comment';
        }
    }

    var
        myInt: Integer;

}
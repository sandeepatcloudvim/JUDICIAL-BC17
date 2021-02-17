report 50000 "Update Dimension"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = tabledata 17 = rimd;

    dataset
    {
        dataitem(GLEntry; "G/L Entry")
        {
            trigger OnAfterGetRecord()
            var
            begin
                GLSetup.Get;
                IF GLEntry.FindSet then
                    repeat
                        if DimSetEntry.Get(GLEntry."Dimension Set ID", GLSetup."Shortcut Dimension 3 Code") then
                            GLEntry."Shortcut Dimension 3 Code" := DimSetEntry."Dimension Value Code";
                        GLEntry.Modify();
                    until GLEntry.Next = 0;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
        GLSetup: Record "General Ledger Setup";
        DimSetEntry: Record "Dimension Set Entry";
}
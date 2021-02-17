codeunit 50000 ExtendEvents
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitGLEntry', '', true, true)]
    local procedure UpdateGLEntry(VAR GLEntry: Record "G/L Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."Shortcut Dimension 3 Code" := GenJournalLine."Shortcut Dimension 3 Code";
        GLEntry.Comment := GenJournalLine.Comment;
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]

    local procedure UpdateGLEntryDetails(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")
    var
        GLSetup: Record "General Ledger Setup";
        DimSetEntry: Record "Dimension Set Entry";
    begin

        GLSetup.Get;

        if DimSetEntry.Get(GenJournalLine."Dimension Set ID", GLSetup."Shortcut Dimension 3 Code") then
            GLEntry."Shortcut Dimension 3 Code" := DimSetEntry."Dimension Value Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterInitNewLine', '', true, true)]

    local procedure UpdateGLDetails(VAR GenJournalLine: Record "Gen. Journal Line")
    var
        GLSetup: Record "General Ledger Setup";
        DimSetEntry: Record "Dimension Set Entry";
    begin
        GLSetup.Get;

        if DimSetEntry.Get(GenJournalLine."Dimension Set ID", GLSetup."Shortcut Dimension 3 Code") then
            GenJournalLine."Shortcut Dimension 3 Code" := DimSetEntry."Dimension Value Code";
    end;


    procedure UpdateGLDimension(VAR GLEntry: Record "G/L Entry")
    var
        GLSetup: Record "General Ledger Setup";
        DimSetEntry: Record "Dimension Set Entry";
    begin
        GLSetup.Get;

        if DimSetEntry.Get(GLEntry."Dimension Set ID", GLSetup."Shortcut Dimension 3 Code") then
            GLEntry."Shortcut Dimension 3 Code" := DimSetEntry."Dimension Value Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Detail Trial Balance" then
            NewReportId := Report::"CBR Detail Trial Balance";
    end;

}
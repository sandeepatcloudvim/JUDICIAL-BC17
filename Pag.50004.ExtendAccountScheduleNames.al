pageextension 50004 ExtendAccountScheduleNames extends "Account Schedule Names"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        modify(Overview)
        {
            ApplicationArea = All;
            Visible = false;
        }
        addafter(Overview)
        {
            action(CBROverview)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Overview';
                Ellipsis = true;
                Image = ViewDetails;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'See an overview of the current account schedule based on the current account schedule name and column layout.';

                trigger OnAction()
                var
                    AccSchedOverview: Page "CBR Acc. Schedule Overview";
                begin
                    AccSchedOverview.SetAccSchedName(Rec.Name);
                    AccSchedOverview.Run;
                end;
            }
        }

    }

    var
        myInt: Integer;
}
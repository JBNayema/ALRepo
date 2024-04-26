pageextension 50023 AccountantDashboard extends "Accountant Role Center"
{
    layout
    {
        // Add changes to page layout here

        addbefore("Control99")
        {
            part("Daily Tea Production Activities"; "Tea Production Activites")
            {
                ApplicationArea = Accountant;
                Visible = false;
            }
            part(Control16; "O365 Activities")
            {
                AccessByPermission = TableData "Activities Cue" = I;
                ApplicationArea = Basic, Suite;

            }
        }

    }

    actions
    {
        // Add changes to page actions here

    }




}
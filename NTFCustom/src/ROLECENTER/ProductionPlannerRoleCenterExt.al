pageextension 50021 ManufacturingDashboard extends "Production Planner Role Center"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Control1905113808")
        {
            part("Daily Tea Production Activities"; "Tea Production Activites")
            {
                ApplicationArea = Manufacturing;
            }
        }

    }

    actions
    {
        // Add changes to page actions here

    }

    var

}
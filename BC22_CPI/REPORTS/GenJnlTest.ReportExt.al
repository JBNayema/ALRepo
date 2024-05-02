reportextension 50105 GenJnlTestExt extends "General Journal - Test"
{
    dataset
    {
        add(Integer)
        {
            column(FundNoCaption; "Gen. Journal Line".FieldCaption("Fund No. NVG"))
            {
            }
        }
        add("Gen. Journal Line")
        {
            column(Fund_No__NVG; "Fund No. NVG")
            {
            }

        }
    }
    rendering
    {

        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './layout/CPI_GenJnlTest.rdl';
        }
    }
}

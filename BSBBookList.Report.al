report 50100 "BSB Book List"
{
    Caption = 'Book List';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'BSBBookList.rdlc';

    dataset
    {
        dataitem(SingleRowData; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            #region column
            column(COMPANYNAME; CompanyProperty.DisplayName()) { }
            column(ShowNoOfPages; ShowNoOfPages) { }
            #endregion column
        }
        dataitem("BSB Book"; "BSB Book")
        {
            RequestFilterFields = "No.", Author;
            #region columns
            column(No_BSBBook; "No.") { IncludeCaption = true; }
            column(Description_BSBBook; Description) { IncludeCaption = true; }
            column(Author_BSBBook; Author) { IncludeCaption = true; }
            column(NoofPages_BSBBook; "No. of Pages") { IncludeCaption = true; }
            #endregion columns
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowNoOfPages; ShowNoOfPages)
                    {
                        Caption = 'Show No. of Pages';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Show No. of Pages field';
                    }
                }
            }
        }
    }
    labels
    {
        ReportCaptionLbl = 'Book - List';
        PageCaptionLbl = 'Page {0} of {1}';
    }
    var
#pragma warning disable AA0204
        ShowNoOfPages: Boolean;
#pragma warning restore AA0204
}
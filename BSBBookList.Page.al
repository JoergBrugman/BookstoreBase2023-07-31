page 50101 "BSB Book List"
{
    Caption = 'Books';
    PageType = List;
    SourceTable = "BSB Book";
    CardPageId = "BSB Book Card";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Books)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBM field.';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ToolTip = 'Specifies the value of the No. of Pages field.';
                    Visible = false;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }
    actions
    {
        area(Promoted)
        {
            actionref(CreateBooksRef; CreateBooks) { }
            actionref(BookSaleRef; BookSale) { }
        }
        area(Processing)
        {
            action(CreateBooks)
            {
                Caption = 'Create Books';
                Image = CreateDocuments;
                ApplicationArea = All;
                ToolTip = 'Executes the Create Books action.';
                RunObject = codeunit "BSB Create Books";
            }
            action(BookSale)
            {
                Caption = 'Start Sales Process';
                Image = Process;
                ApplicationArea = All;
                ToolTip = 'Executes the Start Sales Process action.';

                trigger OnAction()
                var
                    BSBBookTypeProcessMgmt: Codeunit "BSB Book Type Process Mgmt.";
                    BSBBookTypeProcess: Interface "BSB Book Type Process";
                begin
                    BSBBookTypeProcess := BSBBookTypeProcessMgmt.GetHandler(Rec);
                    BSBBookTypeProcess.StartDeployBook();
                    BSBBookTypeProcess.StartDeliverBook();
                end;
            }
        }
    }
}
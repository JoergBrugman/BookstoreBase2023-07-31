// Das ist die Doku zu Table 50100
table 50100 "BSB Book"
{
    Caption = 'Book';
    DataCaptionFields = "No.", Description;
    LookupPageId = "BSB Book List";

    fields
    {
        field(1; "No."; Code[20]) { NotBlank = true; }
        field(2; Description; Text[100])
        {
            trigger OnValidate()
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
            end;
        }
        field(3; "Search Description"; Code[100]) { }
        field(4; Blocked; Boolean) { }
        field(5; Type; Enum "BSB Book Type")
        {
            Caption = 'Type';
            // OptionMembers = " ",Hardcover,Paperback;
            // OptionCaption = ' ,Hardcover,Paperback';
        }
        field(7; Created; Date)
        {
            Editable = false;
        }
        field(8; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(10; Author; Text[50]) { }
        field(11; "Author Provision %"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }
        field(15; ISBN; Code[20]) { }
        field(16; "No. of Pages"; Integer)
        {
            MinValue = 0;
        }
        field(17; "Edition No."; Integer)
        {
            MinValue = 0;
        }
        field(18; "Date of Publishing"; Date) { }
    }
    keys
    {
        key(PK; "No.") { Clustered = true; }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Author, "No. of Pages") { }
    }

    var
        OnDeleteBookErr: Label 'A Book cannot be deleted';

    trigger OnInsert()
    begin
        Created := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    var
        IsHandled: Boolean;
    begin
        OnBeforeOnDelete(Rec, IsHandled);
        if IsHandled then
            exit;

        Error(OnDeleteBookErr);
    end;

    /// <summary>
    /// Check if Book is blocked and fire some error
    /// </summary>
    procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;

    procedure ShowCard()
    begin
        Page.RunModal(Page::"BSB Book Card", Rec);
    end;

    /// <summary>
    /// ShowCard.
    /// </summary>
    /// <param name="BookNo">Code[20].</param>
    procedure ShowCard(BookNo: Code[20])
    var
        BSBBook: Record "BSB Book";
    begin
        if not BSBBook.Get(BookNo) then
            exit;
        BSBBook.ShowCard();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    begin
    end;
}
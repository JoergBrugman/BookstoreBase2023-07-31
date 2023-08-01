// Das ist die Doku zu Table 50100
table 50100 "BSB Book"
{
    Caption = 'Book';

    fields
    {
        field(1; "No."; Code[20]) { NotBlank = true; }
        field(2; Description; Text[100]) { }
        field(3; "Search Description"; Code[100]) { }
        field(4; Blocked; Boolean) { }
        field(5; Type; Option)
        {
            OptionMembers = " ",Hardcover,Paperback;
            OptionCaption = ' ,Hardcover,Paperback';
        }
        field(7; Created; Date)
        {
            Editable = false;
            //TODO Automatisch bestücken
        }
        field(8; "Last Date Modified"; Date)
        {
            Editable = false;
            //TODO Automatisch bestücken
        }
        field(10; Author; Text[50]) { }
        field(11; "Author Provision %"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }
        field(15; ISBM; Code[20]) { }
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

    //TODO Bücher dürfen nicht gelöscht werden
    //TODO TestBlocked bauen
}
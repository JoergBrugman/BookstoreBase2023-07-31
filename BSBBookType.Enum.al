enum 50100 "BSB Book Type" implements "BSB Book Type Process"
{
    Extensible = true;
    DefaultImplementation = "BSB Book Type Process" = "BSB Book Type Default Impl.";
    UnknownValueImplementation = "BSB Book Type Process" = "BSB Book Type Default Impl.";

    value(0; " ") { Caption = 'None'; }
    value(1; Hardcover)
    {
        Caption = 'Hardcover';
        Implementation = "BSB Book Type Process" = "BSB Book Type Hardcover Impl.";
    }
    value(2; Paperback)
    {
        Caption = 'Paperback';
        Implementation = "BSB Book Type Process" = "BSB Book Type Paperback Impl.";
    }
}
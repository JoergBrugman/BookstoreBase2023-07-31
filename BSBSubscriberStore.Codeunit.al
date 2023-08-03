codeunit 50100 "BSB Subscriber Store"
{
    var
        FavoriteHintMsg: Label 'Do not forgett to enter %1 in %2 %3 %4', Comment = '"DEU"=Bitte vergessen Sie nicht %1 in % %3 %4 anzugeben';

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterInsertEvent, '', true, true)]
    local procedure FavoriteBookHint(var Rec: Record Customer)
    begin
        if Rec."BSB Favorite Book No." = '' then
            Message(FavoriteHintMsg,
                Rec.FieldCaption("BSB Favorite Book No."),
                Rec.TableCaption,
                Rec."No.",
                Rec.Name);
    end;
}
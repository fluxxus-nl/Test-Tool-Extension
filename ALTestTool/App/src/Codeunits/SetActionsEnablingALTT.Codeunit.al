codeunit 92100 "Set Actions Enabling ALTT FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    procedure SetActionsEnabling(var TestMethodLine: Record "Test Method Line"; var ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX")
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);

        TestMethodLine2.SetRange(Run, false);
        ActionEnablingArguments.SelectAllEnabled := not TestMethodLine2.IsEmpty();

        TestMethodLine2.SetRange(Run, true);
        ActionEnablingArguments.DeselectAllEnabled := not TestMethodLine2.IsEmpty();

        if not ActionEnablingArguments.SelectAllEnabled and not ActionEnablingArguments.DeselectAllEnabled then begin
            ActionEnablingArguments.SelectFailuresEnabled := false;
            ActionEnablingArguments.SelectNonFailuresEnabled := false;
            exit;
        end;

        TestMethodLine2.SetRange(Run);
        TestMethodLine2.SetRange(Result, TestMethodLine2.Result::Failure);
        if TestMethodLine2.IsEmpty() then begin
            ActionEnablingArguments.SelectFailuresEnabled := false;

            TestMethodLine2.SetFilter(Result, '<>%1', TestMethodLine2.Result::Failure);
            TestMethodLine2.SetRange(Run, false);
            ActionEnablingArguments.SelectNonFailuresEnabled := not TestMethodLine2.IsEmpty();
            exit;
        end;

        ActionEnablingArguments.SelectFailuresEnabled :=
            AreFailuresDeselected(TestMethodLine2);

        ActionEnablingArguments.SelectNonFailuresEnabled :=
            AreNonFailuresDeselected(TestMethodLine2);
    end;

    local procedure AreNonFailuresDeselected(var TestMethodLine: Record "Test Method Line"): Boolean
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);
        TestMethodLine2.SetRange("Line Type", TestMethodLine2."Line Type"::"Function");
        TestMethodLine2.SetFilter("Function", '<>%1', 'OnRun');
        TestMethodLine2.SetFilter(Result, '<>%1', TestMethodLine2.Result::Failure);
        TestMethodLine2.SetRange(Run, false);
        exit(not TestMethodLine2.IsEmpty());
    end;

    local procedure AreFailuresDeselected(var TestMethodLine: Record "Test Method Line"): Boolean
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);
        TestMethodLine2.SetRange("Line Type", TestMethodLine2."Line Type"::"Function");
        TestMethodLine2.SetFilter("Function", '<>%1', 'OnRun');
        TestMethodLine2.SetRange(Result, TestMethodLine2.Result::Failure);
        TestMethodLine2.SetRange(Run, false);
        exit(not TestMethodLine2.IsEmpty());
    end;
}
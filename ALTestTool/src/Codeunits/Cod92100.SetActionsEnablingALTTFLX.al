codeunit 92100 "Set Actions Enabling ALTT FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    procedure SetActionsEnabling(var TestMethodLine: Record "Test Method Line"; var ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX")
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);

        with TestMethodLine2 do begin
            SetRange(Run, false);
            ActionEnablingArguments.SelectAllEnabled := not IsEmpty();

            SetRange(Run, true);
            ActionEnablingArguments.DeselectAllEnabled := not IsEmpty();

            with ActionEnablingArguments do
                if not SelectAllEnabled and not DeselectAllEnabled then begin
                    SelectFailuresEnabled := false;
                    SelectNonFailuresEnabled := false;
                    exit;
                end;

            SetRange(Run);
            SetRange(Result, Result::Failure);
            if IsEmpty() then begin
                ActionEnablingArguments.SelectFailuresEnabled := false;

                SetFilter(Result, '<>%1', Result::Failure);
                SetRange(Run, false);
                ActionEnablingArguments.SelectNonFailuresEnabled := not IsEmpty();
                exit;
            end;

            ActionEnablingArguments.SelectFailuresEnabled :=
                AreFailuresDeselected(TestMethodLine2);

            ActionEnablingArguments.SelectNonFailuresEnabled :=
                AreNonFailuresDeselected(TestMethodLine2);
        end;
    end;

    local procedure AreNonFailuresDeselected(var TestMethodLine: Record "Test Method Line"): Boolean
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);
        with TestMethodLine2 do begin
            SetRange("Line Type", "Line Type"::"Function");
            SetFilter("Function", '<>%1', 'OnRun');
            SetFilter(Result, '<>%1', Result::Failure);
            SetRange(Run, false);
            exit(not IsEmpty());
        end;
    end;

    local procedure AreFailuresDeselected(var TestMethodLine: Record "Test Method Line"): Boolean
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);
        with TestMethodLine2 do begin
            SetRange("Line Type", "Line Type"::"Function");
            SetFilter("Function", '<>%1', 'OnRun');
            SetRange(Result, Result::Failure);
            SetRange(Run, false);
            exit(not IsEmpty());
        end;
    end;
}
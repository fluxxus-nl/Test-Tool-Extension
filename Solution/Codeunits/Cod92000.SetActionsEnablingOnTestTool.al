codeunit 92000 "Set Actions Enabling on TT FLX"
{
    procedure SetActionsEnabling(var CALTestLine: Record "CAL Test Line"; var ActionEnablingArguments: Record "Action Enabling Arguments FLX")
    var
        CALTestLine2: Record "CAL Test Line";
    begin
        CALTestLine2.CopyFilters(CALTestLine);

        with CALTestLine2 do begin
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
                AreFailuresDeselected(CALTestLine2);

            ActionEnablingArguments.SelectNonFailuresEnabled :=
                AreNonFailuresDeselected(CALTestLine2);
        end;
    end;

    local procedure AreNonFailuresDeselected(var CALTestLine: Record "CAL Test Line"): Boolean
    var
        CALTestLine2: Record "CAL Test Line";
    begin
        CALTestLine2.CopyFilters(CALTestLine);
        with CALTestLine2 do begin
            SetRange("Line Type", "Line Type"::"Function");
            SetFilter("Function", '<>%1', 'OnRun');
            SetFilter(Result, '<>%1', Result::Failure);
            SetRange(Run, false);
            exit(not IsEmpty());
        end;
    end;

    local procedure AreFailuresDeselected(var CALTestLine: Record "CAL Test Line"): Boolean
    var
        CALTestLine2: Record "CAL Test Line";
    begin
        CALTestLine2.CopyFilters(CALTestLine);
        with CALTestLine2 do begin
            SetRange("Line Type", "Line Type"::"Function");
            SetFilter("Function", '<>%1', 'OnRun');
            SetRange(Result, Result::Failure);
            SetRange(Run, false);
            exit(not IsEmpty());
        end;
    end;
}
codeunit 92001 "SetRunOnTestToolFLX"
{
    procedure SetRun(var CALTestLine: Record "CAL Test Line"; RunType: Option All,"None",Failures,NonFailures)
    var
        CALTestLine2: Record "CAL Test Line";
    begin
        CALTestLine2.CopyFilters(CALTestLine);

        if CALTestLine."Test Suite" <> '' then
            CALTestLine2.SetRange("Test Suite", CALTestLine."Test Suite");

        with CALTestLine2 do
            case RunType of
                RunType::"None":
                    SetRunOnNone(CALTestLine2);
                RunType::All:
                    SetRunOnAll(CALTestLine2);
                RunType::NonFailures:
                    SetRunOnNonFailures(CALTestLine2);
                RunType::Failures:
                    SetRunOnFailures(CALTestLine2);
            end;
    end;

    local procedure SetRunOnNone(var CALTestLine: Record "CAL Test Line")
    begin
        CALTestLine.ModifyAll(Run, false);
    end;

    local procedure SetRunOnAll(var CALTestLine: Record "CAL Test Line")
    begin
        CALTestLine.ModifyAll(Run, true);
    end;

    local procedure SetRunOnNonFailures(var CALTestLine: Record "CAL Test Line")
    begin
        SetRunOnAll(CALTestLine);
        TurnOffRunOnFailingFunctions(CALTestLine);
    end;

    local procedure SetRunOnFailures(var CALTestLine: Record "CAL Test Line")
    begin
        SetRunOnNone(CALTestLine);
        TurnOnRunOnFailingFunctions(CALTestLine);
    end;

    local procedure TurnOffRunOnFailingFunctions(var CALTestLine: Record "CAL Test Line")
    begin
        with CALTestLine do begin
            SetRange("Line Type", "Line Type"::"Function");
            SetRange(Result, Result::Failure);
            ModifyAll(Run, false);

            TurnOffRunOnOnRunOfFullyFailingCodeunit(CALTestLine);
        end;
    end;

    local procedure TurnOffRunOnOnRunOfFullyFailingCodeunit(var CALTestLine: Record "CAL Test Line")
    var
        CALTestLine2: Record "CAL Test Line";
    begin
        with CALTestLine do begin
            SetRange("Line Type", "Line Type"::"Codeunit");
            if FindSet() then
                repeat
                    CALTestLine2.SetRange("Test Codeunit", "Test Codeunit");
                    CALTestLine2.SetRange("Line Type", "Line Type"::"Function");
                    CALTestLine2.SetFilter("Function", '<>%1', 'OnRun');
                    CALTestLine2.SetRange(Run, true);
                    if CALTestLine2.IsEmpty() then begin
                        CALTestLine2.SetRange("Line Type");
                        CALTestLine2.SetRange("Function");
                        CALTestLine2.SetRange(Run);
                        CALTestLine2.ModifyAll(Run, false);
                    end;
                until Next() = 0;
        end;
    end;

    local procedure TurnOnRunOnFailingFunctions(var CALTestLine: Record "CAL Test Line")
    var
    begin
        with CALTestLine do begin
            SetFilter("Line Type", '%1|%2', "Line Type"::"Codeunit", "Line Type"::"Function");
            SetRange(Result, Result::Failure);
            ModifyAll(Run, true);

            TurnOnRunOnOnRunOfFullyFailingCodeunit(CALTestLine);
        end;
    end;

    local procedure TurnOnRunOnOnRunOfFullyFailingCodeunit(var CALTestLine: Record "CAL Test Line")
    var
        CALTestLine2: Record "CAL Test Line";
    begin
        with CALTestLine do begin
            SetRange("Line Type", "Line Type"::"Codeunit");
            if FindSet() then
                repeat
                    CALTestLine2.SetRange("Test Codeunit", "Test Codeunit");
                    CALTestLine2.SetRange("Function", 'OnRun');
                    CALTestLine2.ModifyAll(Run, true);
                until Next() = 0;
        end;
    end;
}
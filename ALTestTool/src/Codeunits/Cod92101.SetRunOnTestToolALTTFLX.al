codeunit 92101 "Set Run On Test Tool ALTT FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    procedure SetRun(var TestMethodLine: Record "Test Method Line"; RunType: Option All,"None",Failures,NonFailures)
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        TestMethodLine2.CopyFilters(TestMethodLine);

        if TestMethodLine."Test Suite" <> '' then
            TestMethodLine2.SetRange("Test Suite", TestMethodLine."Test Suite");

        with TestMethodLine2 do
            case RunType of
                RunType::"None":
                    SetRunOnNone(TestMethodLine2);
                RunType::All:
                    SetRunOnAll(TestMethodLine2);
                RunType::NonFailures:
                    SetRunOnNonFailures(TestMethodLine2);
                RunType::Failures:
                    SetRunOnFailures(TestMethodLine2);
            end;
    end;

    local procedure SetRunOnNone(var TestMethodLine: Record "Test Method Line")
    begin
        TestMethodLine.ModifyAll(Run, false);
    end;

    local procedure SetRunOnAll(var TestMethodLine: Record "Test Method Line")
    begin
        TestMethodLine.ModifyAll(Run, true);
    end;

    local procedure SetRunOnNonFailures(var TestMethodLine: Record "Test Method Line")
    begin
        SetRunOnAll(TestMethodLine);
        TurnOffRunOnFailingFunctions(TestMethodLine);
    end;

    local procedure SetRunOnFailures(var TestMethodLine: Record "Test Method Line")
    begin
        SetRunOnNone(TestMethodLine);
        TurnOnRunOnFailingFunctions(TestMethodLine);
    end;

    local procedure TurnOffRunOnFailingFunctions(var TestMethodLine: Record "Test Method Line")
    begin
        with TestMethodLine do begin
            SetRange("Line Type", "Line Type"::"Function");
            SetRange(Result, Result::Failure);
            ModifyAll(Run, false);

            TurnOffRunOnOnRunOfFullyFailingCodeunit(TestMethodLine);
        end;
    end;

    local procedure TurnOffRunOnOnRunOfFullyFailingCodeunit(var TestMethodLine: Record "Test Method Line")
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        with TestMethodLine do begin
            SetRange("Line Type", "Line Type"::"Codeunit");
            if FindSet() then
                repeat
                    TestMethodLine2.SetRange("Test Codeunit", "Test Codeunit");
                    TestMethodLine2.SetRange("Line Type", "Line Type"::"Function");
                    TestMethodLine2.SetFilter("Function", '<>%1', 'OnRun');
                    TestMethodLine2.SetRange(Run, true);
                    if TestMethodLine2.IsEmpty() then begin
                        TestMethodLine2.SetRange("Line Type");
                        TestMethodLine2.SetRange("Function");
                        TestMethodLine2.SetRange(Run);
                        TestMethodLine2.ModifyAll(Run, false);
                    end;
                until Next() = 0;
        end;
    end;

    local procedure TurnOnRunOnFailingFunctions(var TestMethodLine: Record "Test Method Line")
    var
    begin
        with TestMethodLine do begin
            SetFilter("Line Type", '%1|%2', "Line Type"::"Codeunit", "Line Type"::"Function");
            SetRange(Result, Result::Failure);
            ModifyAll(Run, true);

            TurnOnRunOnOnRunOfFullyFailingCodeunit(TestMethodLine);
        end;
    end;

    local procedure TurnOnRunOnOnRunOfFullyFailingCodeunit(var TestMethodLine: Record "Test Method Line")
    var
        TestMethodLine2: Record "Test Method Line";
    begin
        with TestMethodLine do begin
            SetRange("Line Type", "Line Type"::"Codeunit");
            if FindSet() then
                repeat
                    TestMethodLine2.SetRange("Test Codeunit", "Test Codeunit");
                    TestMethodLine2.SetRange("Function", 'OnRun');
                    TestMethodLine2.ModifyAll(Run, true);
                until Next() = 0;
        end;
    end;
}
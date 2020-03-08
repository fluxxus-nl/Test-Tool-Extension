codeunit 92062 "Library - Perform Select FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    procedure PerformSelectOnAll(TestSuiteName: Code[10]; CodeunitID: Integer)
    begin
        SetRun(TestSuiteName, CodeunitID, 0) // 0 = All
    end;

    procedure PerformDeselectOnAll(TestSuiteName: Code[10]; CodeunitID: Integer)
    begin
        SetRun(TestSuiteName, CodeunitID, 1) // 1 = None
    end;

    procedure PerformSelectOnFailures(TestSuiteName: Code[10]; CodeunitID: Integer)
    begin
        SetRun(TestSuiteName, CodeunitID, 2) // 2 = Failures
    end;

    procedure PerformSelectOnNonFailures(TestSuiteName: Code[10]; CodeunitID: Integer)
    begin
        SetRun(TestSuiteName, CodeunitID, 3) // 3 = NonFailures
    end;

    local procedure SetRun(TestSuiteName: Code[10]; CodeunitID: Integer; RunType: Option All,"Non",Failures,NonFailures)
    var
        CALTestLine: Record "CAL Test Line";
        SetRunOnTestTool: Codeunit "Set Run On Test Tool FLX";
    begin
        CALTestLine."Test Suite" := TestSuiteName;
        if CodeunitID <> 0 then
            CALTestLine.SetRange("Test Codeunit", CodeunitID);
        SetRunOnTestTool.SetRun(CALTestLine, RunType)
    end;

}
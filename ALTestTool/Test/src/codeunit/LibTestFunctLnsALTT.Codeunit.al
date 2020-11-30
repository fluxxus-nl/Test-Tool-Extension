codeunit 92160 "Lib. - Test Funct Lns ALTT FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    var
        BaseCodeunitID: Integer;
        CurrentCodeunitID: Integer;

    procedure CreateTestSuite(NewName: Code[10])
    var
        CALTestSuite: Record "CAL Test Suite";
    begin
        if not CALTestSuite.Get(NewName) then begin
            CALTestSuite.Name := NewName;
            CALTestSuite.Insert();
        end;
    end;

    procedure CreateTestCodeunit(TestSuiteName: Code[10]; TestCodeunitID: Integer; Enabled: Boolean)
    var
        TestMethodLine: Record "Test Method Line";
    begin
        CreateTestMethodLine(TestMethodLine, TestSuiteName, TestMethodLine."Line Type"::"Codeunit", TestCodeunitID, Enabled);
    end;

    procedure SetTestCodeunitResult(TestSuiteName: Code[10]; TestCodeunitID: Integer)
    var
        TestCodeunitLine: Record "Test Method Line";
        TestFunctionLine: Record "Test Method Line";
    begin
        GetTestCodeunitLine(TestCodeunitLine, TestSuiteName, TestCodeunitID);

        TestFunctionLine.SetRange("Test Suite", TestSuiteName);
        TestFunctionLine.SetRange("Test Codeunit", TestCodeunitID);
        TestFunctionLine.SetRange("Line Type", TestFunctionLine."Line Type"::Function);
        TestFunctionLine.SetRange(Result, TestFunctionLine.Result::Failure);
        if TestFunctionLine.FindFirst() then begin
            TestCodeunitLine.Result := TestFunctionLine.Result::Failure;
            TestCodeunitLine."Error Call Stack" := TestFunctionLine."Error Call Stack";
            TestCodeunitLine."Error Code" := TestFunctionLine."Error Code";
            TestCodeunitLine."Error Message" := TestFunctionLine."Error Message";
            TestCodeunitLine."Error Message Preview" := TestFunctionLine."Error Message Preview";
        end else begin
            TestFunctionLine.SetRange(Result);
            if TestFunctionLine.FindFirst() then begin
                TestCodeunitLine.Result := TestFunctionLine.Result;
                TestCodeunitLine."Error Call Stack" := TestFunctionLine."Error Call Stack";
                TestCodeunitLine."Error Code" := TestFunctionLine."Error Code";
                TestCodeunitLine."Error Message" := TestFunctionLine."Error Message";
                TestCodeunitLine."Error Message Preview" := TestFunctionLine."Error Message Preview";
            end;
        end;
        TestCodeunitLine.Modify();
    end;

    procedure GetTestCodeunitLine(var TestMethodLine: Record "Test Method Line"; TestSuiteName: Code[10]; TestCodeunitID: Integer)
    begin
        TestMethodLine.SetRange("Test Suite", TestSuiteName);
        TestMethodLine.SetRange("Test Codeunit", TestCodeunitID);
        TestMethodLine.SetRange("Line Type", TestMethodLine."Line Type"::Codeunit);
        TestMethodLine.FindFirst();
    end;

    procedure CreateTestFunction(TestSuiteName: Code[10]; TestCodeunitID: Integer; Enabled: Boolean; Succesfull: Boolean)
    var
        TestMethodLine: Record "Test Method Line";
    begin
        CreateTestMethodLine(TestMethodLine, TestSuiteName, TestMethodLine."Line Type"::"Function", TestCodeunitID, Enabled);
        if Succesfull then
            TestMethodLine.Result := TestMethodLine.Result::Success
        else
            TestMethodLine.Result := TestMethodLine.Result::Failure;
        TestMethodLine.Modify();
    end;

    procedure CreateTestFunctions(NewSuiteName: Code[10]; NewCodeunitID: Integer; NewEnabled: Boolean; NoOfSuccesfull: Integer; NoOfFailed: Integer)
    var
        i: Integer;
    begin
        for i := 1 to NoOfSuccesfull do
            CreateTestFunction(NewSuiteName, NewCodeunitID, NewEnabled, true);

        for i := 1 to NoOfFailed do
            CreateTestFunction(NewSuiteName, NewCodeunitID, NewEnabled, false);
    end;

    procedure CreateTestMethodLine(var TestMethodLine: Record "Test Method Line"; NewSuiteName: Code[10]; NewLineType: Option "Group","Codeunit","Function"; NewCodeunitID: Integer; NewEnabled: Boolean)
    var
        LineNo: Integer;
    begin
        LineNo := GetLastTestMethodLineNo(NewSuiteName) + 10000;
        TestMethodLine.InitRecord(NewSuiteName, LineNo, NewLineType, NewCodeunitID, NewEnabled);
        TestMethodLine.Name := CopyStr(StrSubstNo('%1 %2 %3', Format(NewLineType), NewCodeunitID, LineNo), 1, MaxStrLen(TestMethodLine.Name));
        TestMethodLine."Function" := TestMethodLine.Name;
        TestMethodLine.Insert();
    end;

    procedure SetCodeunitBaseID(CodeunitBaseID: Integer)
    begin
        BaseCodeunitID := CodeunitBaseID;
    end;

    procedure GetNextCodeunitID(): Integer
    begin
        if CurrentCodeunitID = 0 then
            CurrentCodeunitID := BaseCodeunitID;
        CurrentCodeunitID := CurrentCodeunitID + 1;
        exit(CurrentCodeunitID);
    end;

    procedure GetCurrentCodeunitID(): Integer
    begin
        exit(CurrentCodeunitID);
    end;

    local procedure GetLastTestMethodLineNo(TestSuiteName: Code[10]): Integer
    var
        TestMethodLine: Record "Test Method Line";
    begin
        TestMethodLine.SetRange("Test Suite", TestSuiteName);
        if TestMethodLine.FindLast() then;
        exit(TestMethodLine."Line No.");
    end;
}
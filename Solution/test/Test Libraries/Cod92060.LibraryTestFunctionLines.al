codeunit 92060 "Lib. - Test Function Lns FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    var
        BaseCodeunitID: Integer;
        CurrentCodeunitID: Integer;

    procedure CreateTestSuite(NewName: Code[10])
    var
        CALTestSuite: Record "CAL Test Suite";
    begin
        with CALTestSuite do
            if not Get(NewName) then begin
                Name := NewName;
                Insert();
            end;
    end;

    procedure CreateTestCodeunit(TestSuiteName: Code[10]; TestCodeunitID: Integer; Enabled: Boolean)
    var
        CALTestLine: Record "CAL Test Line";
    begin
        with CALTestLine do
            CreateCALTestLine(CALTestLine, TestSuiteName, "Line Type"::"Codeunit", TestCodeunitID, Enabled);
    end;

    procedure SetTestCodeunitResult(TestSuiteName: Code[10]; TestCodeunitID: Integer)
    var
        CALTestCodeunitLine: Record "CAL Test Line";
        CALTestFunctionLine: Record "CAL Test Line";
    begin
        GetTestCodeunitLine(CALTestCodeunitLine, TestSuiteName, TestCodeunitID);

        with CALTestFunctionLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange("Test Codeunit", TestCodeunitID);
            SetRange("Line Type", "Line Type"::Function);
            SetRange(Result, Result::Failure);
            if FindFirst() then begin
                CALTestCodeunitLine.Result := Result::Failure;
                CALTestCodeunitLine."First Error" := "First Error";
            end else begin
                SetRange(Result);
                if FindFirst() then begin
                    CALTestCodeunitLine.Result := CALTestFunctionLine.Result;
                    CALTestCodeunitLine."First Error" := "First Error";
                end;
            end;
            CALTestCodeunitLine.Modify();
        end;
    end;

    procedure GetTestCodeunitLine(var CALTestLine: Record "CAL Test Line"; TestSuiteName: Code[10]; TestCodeunitID: Integer)
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange("Test Codeunit", TestCodeunitID);
            SetRange("Line Type", "Line Type"::Codeunit);
            FindFirst();
        end;
    end;

    procedure CreateTestFunction(TestSuiteName: Code[10]; TestCodeunitID: Integer; Enabled: Boolean; Succesfull: Boolean)
    var
        CALTestLine: Record "CAL Test Line";
    begin
        with CALTestLine do begin
            CreateCALTestLine(CALTestLine, TestSuiteName, "Line Type"::"Function", TestCodeunitID, Enabled);
            if Succesfull then
                Result := Result::Success
            else
                Result := Result::Failure;
            Modify();
        end;
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

    procedure CreateCALTestLine(var CALTestLine: Record "CAL Test Line"; NewSuiteName: Code[10]; NewLineType: Option "Group","Codeunit","Function"; NewCodeunitID: Integer; NewEnabled: Boolean)
    var
        LineNo: Integer;
    begin
        with CALTestLine do begin
            LineNo := GetLastCALTestLineNo(NewSuiteName) + 10000;
            InitRecord(NewSuiteName, LineNo, NewLineType, NewCodeunitID, NewEnabled);
            Name := CopyStr(StrSubstNo('%1 %2 %3', Format(NewLineType), NewCodeunitID, LineNo), 1, MaxStrLen(Name));
            "Function" := Name;
            Insert();
        end;
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

    local procedure GetLastCALTestLineNo(TestSuiteName: Code[10]): Integer
    var
        CALTestLine: Record "CAL Test Line";
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            if FindLast() then;
            exit("Line No.");
        end;
    end;
}
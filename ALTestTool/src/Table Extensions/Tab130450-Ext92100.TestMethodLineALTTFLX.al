tableextension 92100 "Test Method Line ALTT FLX" extends "Test Method Line" //130450
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    procedure InitRecord(NewSuiteName: Code[10]; NewLineNo: Integer; NewLineType: Option "Group","Codeunit","Function"; NewCodeunitID: Integer; NewActive: Boolean)
    begin
        "Test Suite" := NewSuiteName;
        "Line No." := NewLineNo;
        "Test Codeunit" := NewCodeunitID;
        "Line Type" := NewLineType;
        Validate(Run, NewActive);
    end;
}
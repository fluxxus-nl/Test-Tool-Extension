tableextension 92000 "CAL Test Line Table Ext" extends "CAL Test Line" //130401
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
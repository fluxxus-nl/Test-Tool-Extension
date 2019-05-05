codeunit 92061 "Library - Verify Actions FLX"
{
    var
        Assert: Codeunit Assert;

    procedure VerifySelectOnAllIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.SelectAllEnabled, 'Select on All is not disabled');
    end;

    procedure VerifySelectOnAllIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.SelectAllEnabled, 'Select on All is not enabled');
    end;

    procedure VerifyDeselectOnAllIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.DeselectAllEnabled, 'Deselect on All is not disabled');
    end;

    procedure VerifyDeselectOnAllIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.DeselectAllEnabled, 'Deselect on All is not enabled');
    end;

    procedure VerifySelectOnFailuresIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.SelectFailuresEnabled, 'Select on Failures is not disabled');
    end;

    procedure VerifySelectOnFailuresIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.SelectFailuresEnabled, 'Select on Failures is not enabled');
    end;

    procedure VerifySelectOnNonFailuresIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.SelectNonFailuresEnabled, 'Select on Non Failures is not disabled');
    end;

    procedure VerifySelectOnNonFailuresIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(CALTestLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.SelectNonFailuresEnabled, 'Select on Non Failures is not denabled');
    end;

    procedure SetFilterOnCALTestLine(var CALTestLine: Record "CAL Test Line"; TestSuiteName: Code[10]; CodeunitID: Integer)
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            if CodeunitID <> 0 then
                SetRange("Test Codeunit", CodeunitID);
        end;
    end;

    procedure VerifyRunOnAll(TestSuiteName: Code[10]; CodeunitID: Integer; Enabled: Boolean)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfAllLinesInTestSuite: Integer;
        NoOfEnabledLinesInTestSuite: Integer;
    begin
        with CALTestLine do begin
            SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
            NoOfAllLinesInTestSuite := Count();
            SetRange(Run, Enabled);
            NoOfEnabledLinesInTestSuite := Count();
            Assert.AreEqual(NoOfAllLinesInTestSuite, NoOfEnabledLinesInTestSuite, 'NoOfAllLines <> NoOfEnabledLines');
        end;
    end;
}
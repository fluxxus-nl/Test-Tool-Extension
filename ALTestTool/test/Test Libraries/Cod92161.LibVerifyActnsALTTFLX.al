codeunit 92161 "Lib. - Verify Actns. ALTT FLX"
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    var
        Assert: Codeunit Assert;

    procedure VerifySelectOnAllIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.SelectAllEnabled, 'Select on All is not disabled');
    end;

    procedure VerifySelectOnAllIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.SelectAllEnabled, 'Select on All is not enabled');
    end;

    procedure VerifyDeselectOnAllIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.DeselectAllEnabled, 'Deselect on All is not disabled');
    end;

    procedure VerifyDeselectOnAllIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.DeselectAllEnabled, 'Deselect on All is not enabled');
    end;

    procedure VerifySelectOnFailuresIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.SelectFailuresEnabled, 'Select on Failures is not disabled');
    end;

    procedure VerifySelectOnFailuresIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.SelectFailuresEnabled, 'Select on Failures is not enabled');
    end;

    procedure VerifySelectOnNonFailuresIsDisabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsFalse(ActionEnablingArguments.SelectNonFailuresEnabled, 'Select on Non Failures is not disabled');
    end;

    procedure VerifySelectOnNonFailuresIsEnabled(TestSuiteName: Code[10]; CodeunitID: Integer)
    var
        TestMethodLine: Record "Test Method Line";
        ActionEnablingArguments: Record "Action Enabl. Args. ALTT FLX";
        SetActionsEnablingOnTestTool: Codeunit "Set Actions Enabling ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
        SetActionsEnablingOnTestTool.SetActionsEnabling(TestMethodLine, ActionEnablingArguments);
        Assert.IsTrue(ActionEnablingArguments.SelectNonFailuresEnabled, 'Select on Non Failures is not denabled');
    end;

    procedure SetFilterOnTestMethodLine(var TestMethodLine: Record "Test Method Line"; TestSuiteName: Code[10]; CodeunitID: Integer)
    begin
        with TestMethodLine do begin
            SetRange("Test Suite", TestSuiteName);
            if CodeunitID <> 0 then
                SetRange("Test Codeunit", CodeunitID);
        end;
    end;

    procedure VerifyRunOnAll(TestSuiteName: Code[10]; CodeunitID: Integer; Enabled: Boolean)
    var
        TestMethodLine: Record "Test Method Line";
        NoOfAllLinesInTestSuite: Integer;
        NoOfEnabledLinesInTestSuite: Integer;
    begin
        with TestMethodLine do begin
            SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
            NoOfAllLinesInTestSuite := Count();
            SetRange(Run, Enabled);
            NoOfEnabledLinesInTestSuite := Count();
            Assert.AreEqual(NoOfAllLinesInTestSuite, NoOfEnabledLinesInTestSuite, 'NoOfAllLines <> NoOfEnabledLines');
        end;
    end;
}
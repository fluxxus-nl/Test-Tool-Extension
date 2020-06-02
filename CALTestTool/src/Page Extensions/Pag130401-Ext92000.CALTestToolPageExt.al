pageextension 92000 "CAL Test Tool Page Ext" extends "CAL Test Tool" //130401
{
    // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

    layout
    {
        modify(RunColumn)
        {
            trigger OnAfterValidate()
            begin
                Modify();
                SetActionsEnabling();
            end;
        }
    }

    actions
    {
        modify(DeleteLines)
        {
            trigger OnAfterAction()
            begin
                SetActionsEnabling();
            end;
        }

        modify(GetTestCodeunits)
        {
            trigger OnAfterAction()
            begin
                SetActionsEnabling();
            end;
        }

        modify(Run)
        {
            trigger OnAfterAction()
            begin
                SetActionsEnabling();
            end;
        }

        modify(RunSelected)
        {
            ShortcutKey = 'Ctrl+F9';

            trigger OnAfterAction()
            begin
                SetActionsEnabling();
            end;
        }

        addafter("F&unctions")
        {
            group(Select)
            {
                Caption = '&Select Run';

                action(SelectAll)
                {
                    Caption = 'Select on All';
                    ToolTip = 'Select Run on all tests.';
                    ApplicationArea = All;
                    Image = AllLines;
                    Enabled = SelectAllEnabled;

                    trigger OnAction()
                    begin
                        SetRunOnTests(0) // 0 = All
                    end;
                }
                action(DeselectAll)
                {
                    Caption = 'Deselect on All';
                    ToolTip = 'Deselect Run on all tests.';
                    ApplicationArea = All;
                    Image = CancelAllLines;
                    Enabled = DeselectAllEnabled;

                    trigger OnAction()
                    begin
                        SetRunOnTests(1) // 1 = None
                    end;
                }
                action(SelectFailures)
                {
                    Caption = 'Select on Failures';
                    ToolTip = 'Select Run on all failing tests and deselect on all others.';
                    ApplicationArea = All;
                    Image = EnableAllBreakpoints;
                    Enabled = SelectFailuresEnabled;

                    trigger OnAction()
                    begin
                        SetRunOnTests(2) // 2 = Failures
                    end;
                }
                action(SelectNonFailures)
                {
                    Caption = 'Select on Non Failures';
                    ToolTip = 'Deselect Run on all failing tests and select on all others.';
                    ApplicationArea = All;
                    Image = DisableAllBreakpoints;
                    Enabled = SelectNonFailuresEnabled;

                    trigger OnAction()
                    begin
                        SetRunOnTests(3) // 3 = NonFailures
                    end;
                }
            }
        }
    }
    var
        SelectAllEnabled: Boolean;
        DeselectAllEnabled: Boolean;
        SelectFailuresEnabled: Boolean;
        SelectNonFailuresEnabled: Boolean;

    trigger OnOpenPage()
    begin
        SetActionsEnabling();
    end;

    local procedure SetRunOnTests(RunType: Option All,"Non",Failures,NonFailures)
    var
        SetRunOnTestTool: Codeunit "Set Run On Test Tool FLX";
    begin
        SetRunOnTestTool.SetRun(Rec, RunType);
        SetActionsEnabling();
    end;

    local procedure SetActionsEnabling()
    var
        ActionEnablingArguments: Record "Action Enabling Arguments FLX";
        SetActionsEnablingForTestTool: Codeunit "Set Actions Enabling On TT FLX";
    begin
        SetActionsEnablingForTestTool.SetActionsEnabling(Rec, ActionEnablingArguments);

        SelectAllEnabled := ActionEnablingArguments.SelectAllEnabled;
        DeselectAllEnabled := ActionEnablingArguments.DeselectAllEnabled;
        SelectFailuresEnabled := ActionEnablingArguments.SelectFailuresEnabled;
        SelectNonFailuresEnabled := ActionEnablingArguments.SelectNonFailuresEnabled;

        CurrPage.Update(false);
    end;
}
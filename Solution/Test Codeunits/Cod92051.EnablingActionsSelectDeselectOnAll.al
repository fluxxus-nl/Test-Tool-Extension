codeunit 92051 "Enabl. Actns Select On All FLX"
{
    // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
    // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    SubType = Test;

    [Test]
    procedure UnfilteredDisabledTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
    begin
        // [SCENARIO #0001] Unfiltered disabled test functions
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();

        // [WHEN] Do nothing
        DoNothing();

        // [THEN] Select on All is enabled
        VerifySelectOnAllIsEnabled(NoFilterOnCodeunit());
        // [THEN] Deselect on All is disabled
        VerifyDeselectOnAllIsDisabled(NoFilterOnCodeunit());
    end;

    [Test]
    procedure UnfilteredEnabledTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
    begin
        // [SCENARIO #0002] Unfiltered enabled test functions
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled test functions
        CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions();

        // [WHEN] Do nothing
        DoNothing();

        // [THEN] Select on All is disabled
        VerifySelectOnAllIsDisabled(NoFilterOnCodeunit());
        // [THEN] Deselect on All is enabled
        VerifyDeselectOnAllIsEnabled(NoFilterOnCodeunit());
    end;

    [Test]
    procedure UnfilteredEnabledAndDisbledTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
    begin
        // [SCENARIO #0003] Unfiltered enabled and disbled test functions
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();

        // [WHEN] Do nothing
        DoNothing();

        // [THEN] Select on All is enabled
        VerifySelectOnAllIsEnabled(NoFilterOnCodeunit());
        // [THEN] Deselect on All is enabled
        VerifyDeselectOnAllIsEnabled(NoFilterOnCodeunit());
    end;

    [Test]
    procedure EnableRunOnUnfilteredSuccessfulTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
    begin
        // [SCENARIO #0004] Enable Run on unfiltered successful test functions
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled successful test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledSuccessfulTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled successful test functions
        CreateOneDisabledTestCodeunitWithThreeDisabledSuccessfulTestFunctions();

        // [WHEN] Perform Select on All
        PerformSelectOnAll(NoFilterOnCodeunit());

        // [THEN] Run is set on all test codeunits and functions
        VerifyRunIsSetOnAllTestCodeunitsAndFunctions();
        // [THEN] Select on All is disabled
        VerifySelectOnAllIsDisabled(NoFilterOnCodeunit());
        // [THEN] Deselect on All is enabled
        VerifyDeselectOnAllIsEnabled(NoFilterOnCodeunit());
    end;

    [Test]
    procedure DisableRunOnUnfilteredSuccessfulTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
    begin
        // [SCENARIO #0005] Disable Run on unfiltered successful test functions
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled successful test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledSuccessfulTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled successful test functions
        CreateOneEnabledTestCodeunitWithThreeEnabledSuccessfulTestFunctions();

        // [WHEN] Perform Deselect on All
        PerformDeselectOnAll(NoFilterOnCodeunit());

        // [THEN] Run is not set on all test codeunits and functions
        VerifyRunIsNotSetOnAllTestCodeunitsAndFunctions();
        // [THEN] Select on All is enabled
        VerifySelectOnAllIsEnabled(NoFilterOnCodeunit());
        // [THEN] Deselect on All is disabled
        VerifyDeselectOnAllIsDisabled(NoFilterOnCodeunit());
    end;

    [Test]
    procedure FilteredDisabledTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0006] Filtered disabled test functions
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();

        // [WHEN] Set filter on second test codeunit
        // handled by Verify... task in [THEN] part based on SecondCodeunitID

        // [THEN] Select on All is enabled
        VerifySelectOnAllIsEnabled(SetFilterOn(SecondCodeunitID));
        // [THEN] Deselect on All is disabled
        VerifyDeselectOnAllIsDisabled(SetFilterOn(SecondCodeunitID));
    end;

    [Test]
    procedure FilteredEnabledTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0007] Filtered enabled test functions
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled test functions
        SecondCodeunitID := CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions();

        // [WHEN] Set filter on second test codeunit
        // handled by Verify... task in [THEN] part based on SecondCodeunitID

        // [THEN] Select on All is disabled
        VerifySelectOnAllIsDisabled(SetFilterOn(SecondCodeunitID));
        // [THEN] Deselect on All is enabled
        VerifyDeselectOnAllIsEnabled(SetFilterOn(SecondCodeunitID));
    end;

    [Test]
    procedure FilteredEnabledAndDisbledTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0008] Filtered enabled and disabled test functions
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();

        // [WHEN] Set filter on second test codeunit
        // handled by Verify... task in [THEN] part based on SecondCodeunitID


        // [THEN] Select on All is enabled
        VerifySelectOnAllIsEnabled(SetFilterOn(SecondCodeunitID));
        // [THEN] Deselect on All is enabled
        VerifyDeselectOnAllIsDisabled(SetFilterOn(SecondCodeunitID));
    end;

    [Test]
    procedure EnableRunOnFilteredSuccessfulTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0009] Enable Run on filtered successful test functions
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled successful test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledSuccessfulTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled successful test functions
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithThreeDisabledSuccessfulTestFunctions();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on All
        PerformSelectOnAll(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is set on second test codeunit and functions
        VerifyRunIsSetOnSecondTestCodeunitsAndFunctions(SetFilterOn(SecondCodeunitID));
        // [THEN] Select on All is disabled
        VerifySelectOnAllIsDisabled(SetFilterOn(SecondCodeunitID));
        // [THEN] Deselect on All is enabled
        VerifyDeselectOnAllIsEnabled(SetFilterOn(SecondCodeunitID));
    end;

    [Test]
    procedure DisableRunOnFilteredSuccessfulTestFunctions()
    // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0010] Disable Run on filtered successful test functions
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled successful test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledSuccessfulTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled successful test functions
        SecondCodeunitID := CreateOneEnabledTestCodeunitWithThreeEnabledSuccessfulTestFunctions();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Deselect on All
        PerformDeselectOnAll(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is not set on second test codeunit and functions
        VerifyRunIsNotSetOnSecondTestCodeunitsAndFunctions(SetFilterOn(SecondCodeunitID));
        // [THEN] Select on All is enabled
        VerifySelectOnAllIsEnabled(SetFilterOn(SecondCodeunitID));
        // [THEN] Deselect on All is disabled
        VerifyDeselectOnAllIsDisabled(SetFilterOn(SecondCodeunitID));
    end;

    var
        Assert: Codeunit Assert;
        LibraryTestFunctions: Codeunit "Lib. - Test Function Lns FLX";
        LibraryVerifyActions: Codeunit "Library - Verify Actions FLX";
        TestSuiteName: Code[10];

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
        LibraryUtility: Codeunit "Library - Utility";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Enabl. Actns Select On All FLX");

        TestSuiteName := LibraryUtility.GenerateGUID();
        LibraryTestFunctions.CreateTestSuite(TestSuiteName);
        LibraryTestFunctions.SetCodeunitBaseID(-Codeunit::"Enabl. Actns Select On All FLX");
    end;

    local procedure CreateFilterOnSecondTestCodeunit()
    begin
    end;

    local procedure CreateOneDisabledTestCodeunitWithFiveDisabledSuccessfulTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsDisabled(), 5, 0);
            exit(GetCurrentCodeunitID());
        end;
    end;

    local procedure CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions(): Integer
    begin
        CreateOneDisabledTestCodeunitWithFiveDisabledSuccessfulTestFunctions()
    end;

    local procedure CreateOneDisabledTestCodeunitWithThreeDisabledSuccessfulTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsDisabled(), 3, 0);
            exit(GetCurrentCodeunitID());
        end;
    end;

    local procedure CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions(): Integer
    begin
        exit(CreateOneDisabledTestCodeunitWithThreeDisabledSuccessfulTestFunctions())
    end;

    local procedure CreateOneEnabledTestCodeunitWithFiveEnabledSuccessfulTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsEnabled(), 5, 0);
            exit(GetCurrentCodeunitID());
        end;
    end;

    local procedure CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions(): Integer
    begin
        exit(CreateOneEnabledTestCodeunitWithFiveEnabledSuccessfulTestFunctions())
    end;

    local procedure CreateOneEnabledTestCodeunitWithThreeEnabledSuccessfulTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsEnabled(), 3, 0);
            exit(GetCurrentCodeunitID());
        end;
    end;

    local procedure CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions(): Integer
    begin
        exit(CreateOneEnabledTestCodeunitWithThreeEnabledSuccessfulTestFunctions())
    end;

    // local procedure CreateTestFunctions(NewSuiteName: Code[10]; NewCodeunitID: Integer; NewEnabled: Boolean; NoOfSuccesfull: Integer; NoOfFailed: Integer)
    // var
    //     i: Integer;
    // begin
    //     for i := 1 to NoOfSuccesfull do
    //         CreateTestFunction(NewSuiteName, NewCodeunitID, NewEnabled, true);

    //     for i := 1 to NoOfFailed do
    //         CreateTestFunction(NewSuiteName, NewCodeunitID, NewEnabled, false);
    // end;

    local procedure DoNothing()
    begin
    end;

    local procedure PerformDeselectOnAll(CodeunitID: Integer)
    begin
        SetRun(CodeunitID, 2) // 2 = Failures
    end;

    local procedure PerformSelectOnAll(CodeunitID: Integer)
    begin
        SetRun(CodeunitID, 0) // 0 = All
    end;

    local procedure SetRun(CodeunitID: Integer; RunType: Option All,"Non",Failures,NonFailures)
    var
        CALTestLine: Record "CAL Test Line";
        SetRunOnTestTool: Codeunit "SetRunOnTestToolFLX";
    begin
        SetFilterOnCALTestLine(CALTestLine, CodeunitID);
        SetRunOnTestTool.SetRun(CALTestLine, RunType)
    end;

    local procedure NoFilterOnCodeunit(): Integer
    begin
        exit(0)
    end;

    local procedure SetFilterOn(CodeunitID: Integer): Integer
    begin
        exit(CodeunitID)
    end;

    local procedure IsEnabled(): Boolean
    begin
        exit(true)
    end;

    local procedure IsDisabled(): Boolean
    begin
        exit(false)
    end;

    local procedure VerifySelectOnAllIsDisabled(CodeunitID: Integer)
    begin
        LibraryVerifyActions.VerifySelectOnAllIsDisabled(TestSuiteName, CodeunitID);
    end;

    local procedure VerifySelectOnAllIsEnabled(CodeunitID: Integer)
    begin
        LibraryVerifyActions.VerifySelectOnAllIsEnabled(TestSuiteName, CodeunitID);
    end;

    local procedure VerifyDeselectOnAllIsDisabled(CodeunitID: Integer)
    begin
        LibraryVerifyActions.VerifyDeselectOnAllIsDisabled(TestSuiteName, CodeunitID);
    end;

    local procedure VerifyDeselectOnAllIsEnabled(CodeunitID: Integer)
    begin
        LibraryVerifyActions.VerifyDeselectOnAllIsEnabled(TestSuiteName, CodeunitID);
    end;

    local procedure VerifyRunIsNotSetOnAllTestCodeunitsAndFunctions()
    begin
        VerifyRunOn(NoFilterOnCodeunit(), IsDisabled())
    end;

    local procedure VerifyRunIsSetOnAllTestCodeunitsAndFunctions()
    begin
        VerifyRunOn(NoFilterOnCodeunit(), IsEnabled())
    end;

    local procedure VerifyRunIsNotSetOnSecondTestCodeunitsAndFunctions(CodeunitID: Integer)
    begin
        VerifyRunOn(CodeunitID, IsDisabled())
    end;

    local procedure VerifyRunIsSetOnSecondTestCodeunitsAndFunctions(CodeunitID: Integer)
    begin
        VerifyRunOn(CodeunitID, IsEnabled())
    end;

    local procedure VerifyRunOn(CodeunitID: Integer; Enabled: Boolean)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfAllLinesInTestSuite: Integer;
        NoOfEnabledLinesInTestSuite: Integer;
    begin
        with CALTestLine do begin
            SetFilterOnCALTestLine(CALTestLine, CodeunitID);
            NoOfAllLinesInTestSuite := Count();
            SetRange(Run, Enabled);
            NoOfEnabledLinesInTestSuite := Count();
            Assert.AreEqual(NoOfAllLinesInTestSuite, NoOfEnabledLinesInTestSuite, 'NoOfAllLines <> NoOfEnabledLines');
        end;
    end;

    local procedure SetFilterOnCALTestLine(var CALTestLine: Record "CAL Test Line"; CodeunitID: Integer)
    begin
        LibraryVerifyActions.SetFilterOnCALTestLine(CALTestLine, TestSuiteName, CodeunitID);
    end;
}
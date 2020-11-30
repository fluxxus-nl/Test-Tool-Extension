codeunit 92151 "Enabl. Actns. Select ALTT FLX"
{
    SubType = Test;

    trigger OnRun()
    begin
        // (c) fluxxus.nl - https://github.com/fluxxus-nl/Test-Tool-Extension

        // [FEATURE] Enabling Actions Select/Deselect on All Unfiltered
        // [FEATURE] Enabling Actions Select/Deselect on All Filtered
    end;

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
        LibraryTestFunctions: Codeunit "Lib. - Test Funct Lns ALTT FLX";
        LibraryVerifyActions: Codeunit "Lib. - Verify Actns. ALTT FLX";
        TestSuiteName: Code[10];

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
        LibraryUtility: Codeunit "Library - Utility";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Enabl. Actns. Select ALTT FLX");

        TestSuiteName := LibraryUtility.GenerateGUID();
        LibraryTestFunctions.CreateTestSuite(TestSuiteName);
        LibraryTestFunctions.SetCodeunitBaseID(-Codeunit::"Enabl. Actns. Select ALTT FLX");
    end;

    local procedure CreateFilterOnSecondTestCodeunit()
    begin
    end;

    local procedure CreateOneDisabledTestCodeunitWithFiveDisabledSuccessfulTestFunctions(): Integer
    begin
        LibraryTestFunctions.CreateTestCodeunit(TestSuiteName, LibraryTestFunctions.GetNextCodeunitID(), IsDisabled());
        LibraryTestFunctions.CreateTestFunctions(TestSuiteName, LibraryTestFunctions.GetCurrentCodeunitID(), IsDisabled(), 5, 0);
        exit(LibraryTestFunctions.GetCurrentCodeunitID());
    end;

    local procedure CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions(): Integer
    begin
        CreateOneDisabledTestCodeunitWithFiveDisabledSuccessfulTestFunctions()
    end;

    local procedure CreateOneDisabledTestCodeunitWithThreeDisabledSuccessfulTestFunctions(): Integer
    begin
        LibraryTestFunctions.CreateTestCodeunit(TestSuiteName, LibraryTestFunctions.GetNextCodeunitID(), IsDisabled());
        LibraryTestFunctions.CreateTestFunctions(TestSuiteName, LibraryTestFunctions.GetCurrentCodeunitID(), IsDisabled(), 3, 0);
        exit(LibraryTestFunctions.GetCurrentCodeunitID());
    end;

    local procedure CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions(): Integer
    begin
        exit(CreateOneDisabledTestCodeunitWithThreeDisabledSuccessfulTestFunctions())
    end;

    local procedure CreateOneEnabledTestCodeunitWithFiveEnabledSuccessfulTestFunctions(): Integer
    begin
        LibraryTestFunctions.CreateTestCodeunit(TestSuiteName, LibraryTestFunctions.GetNextCodeunitID(), IsDisabled());
        LibraryTestFunctions.CreateTestFunctions(TestSuiteName, LibraryTestFunctions.GetCurrentCodeunitID(), IsEnabled(), 5, 0);
        exit(LibraryTestFunctions.GetCurrentCodeunitID());
    end;

    local procedure CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions(): Integer
    begin
        exit(CreateOneEnabledTestCodeunitWithFiveEnabledSuccessfulTestFunctions())
    end;

    local procedure CreateOneEnabledTestCodeunitWithThreeEnabledSuccessfulTestFunctions(): Integer
    begin
        LibraryTestFunctions.CreateTestCodeunit(TestSuiteName, LibraryTestFunctions.GetNextCodeunitID(), IsDisabled());
        LibraryTestFunctions.CreateTestFunctions(TestSuiteName, LibraryTestFunctions.GetCurrentCodeunitID(), IsEnabled(), 3, 0);
        exit(LibraryTestFunctions.GetCurrentCodeunitID());
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
        TestMethodLine: Record "Test Method Line";
        SetRunOnTestTool: Codeunit "Set Run On Test Tool ALTT FLX";
    begin
        SetFilterOnTestMethodLine(TestMethodLine, CodeunitID);
        SetRunOnTestTool.SetRun(TestMethodLine, RunType)
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
        TestMethodLine: Record "Test Method Line";
        NoOfAllLinesInTestSuite: Integer;
        NoOfEnabledLinesInTestSuite: Integer;
    begin
        SetFilterOnTestMethodLine(TestMethodLine, CodeunitID);
        NoOfAllLinesInTestSuite := TestMethodLine.Count();
        TestMethodLine.SetRange(Run, Enabled);
        NoOfEnabledLinesInTestSuite := TestMethodLine.Count();
        Assert.AreEqual(NoOfAllLinesInTestSuite, NoOfEnabledLinesInTestSuite, 'NoOfAllLines <> NoOfEnabledLines');
    end;

    local procedure SetFilterOnTestMethodLine(var TestMethodLine: Record "Test Method Line"; CodeunitID: Integer)
    begin
        LibraryVerifyActions.SetFilterOnTestMethodLine(TestMethodLine, TestSuiteName, CodeunitID);
    end;
}
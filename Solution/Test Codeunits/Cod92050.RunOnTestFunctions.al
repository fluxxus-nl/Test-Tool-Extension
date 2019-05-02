codeunit 92050 "Run on Test Functions FLX"
{
    // [FEATURE] Run on Unfiltered Test Functions
    // [FEATURE] Run on Filtered Test Functions
    SubType = Test;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnUnfilteredTestFunctionsAllDisabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0001] Enable Run on unfiltered test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();

        // [WHEN] Perform Select on All
        PerformSelectOnAll(NoFilterOnCodeunit());

        // [THEN] Run is set on all test codeunits and functions
        VerifyRunIsSetOnAllTestCodeunitsAndFunctions(NoFilterOnCodeunit());
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnUnfilteredTestFunctionsAllEnabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0002] Enable Run on unfiltered test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled test functions
        CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions();

        // [WHEN] Perform Select on All
        PerformSelectOnAll(NoFilterOnCodeunit());

        // [THEN] Run is set on all test codeunits and functions
        VerifyRunIsSetOnAllTestCodeunitsAndFunctions(NoFilterOnCodeunit());
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DisableRunOnUnfilteredTestFunctionsAllEnabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0003] Disable Run on unfiltered test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled test functions
        CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions();

        // [WHEN] Perform Deselect on All
        PerformDeselectOnAll(NoFilterOnCodeunit());

        // [THEN] Run is not set on all test codeunits and functions
        VerifyRunIsNotSetOnAllTestCodeunitsAndFunctions(NoFilterOnCodeunit());
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DisableRunOnUnfilteredTestFunctionsAllDisabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0004] Disable Run on unfiltered test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();

        // [WHEN] Perform Deselect on All
        PerformDeselectOnAll(NoFilterOnCodeunit());

        // [THEN] Run is not set on all test codeunits and functions
        VerifyRunIsNotSetOnAllTestCodeunitsAndFunctions(NoFilterOnCodeunit());
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnUnfilteredFailedTestFunctionsAllEnabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0005] Enable Run only on unfiltered failed test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with enabled test functions five successful
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsFiveSuccessful();
        // [GIVEN] One enabled test codeunit with enabled test functions one successful and two failed
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One enabled test codeunit with enabled test functions two successful and one failed
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();

        // [WHEN] Perform Select on Failures
        PerformSelectOnFailures(NoFilterOnCodeunit());

        // [THEN] Run is set only on failed test codeunits and functions
        VerifyRunIsSetOnlyOnFailedTestCodeunitsAndFunctions();
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnUnfilteredFailedTestFunctionsAllDisabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0006] Enable Run only on unfiltered failed test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with disabled test functions five successful
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsFiveSuccessful();
        // [GIVEN] One disabled test codeunit with disabled test functions one successful and two failed
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One disabled test codeunit with disabled test functions two successful and one failed
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();

        // [WHEN] Perform Select on Failures
        PerformSelectOnFailures(NoFilterOnCodeunit());

        // [THEN] Run is set only on failed test codeunits and functions
        VerifyRunIsSetOnlyOnFailedTestCodeunitsAndFunctions();
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnUnfilteredNonFailedTestFunctionsAllEnabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0007] Enable Run only on unfiltered non failed test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with enabled test functions five successful
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsFiveSuccessful();
        // [GIVEN] One enabled test codeunit with enabled test functions one successful and two failed
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One enabled test codeunit with enabled test functions two successful and one failed
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();

        // [WHEN] Perform Select on Non Failures
        PerformSelectOnNonFailures(NoFilterOnCodeunit());

        // [THEN] Run is set only on non failed test codeunits and functions
        VerifyRunIsSetOnlyOnNonFailedTestCodeunitsAndFunctions();
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnUnfilteredNonFailedTestFunctionsAllDisabled()
    // [FEATURE] Run on Unfiltered Test Functions
    begin
        // [SCENARIO #0008] Enable Run only on unfiltered non failed test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with disabled test functions five successful
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsFiveSuccessful();
        // [GIVEN] One disabled test codeunit with disabled test functions one successful and two failed
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One disabled test codeunit with disabled test functions two successful and one failed
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();

        // [WHEN] Perform Select on Non Failures
        PerformSelectOnNonFailures(NoFilterOnCodeunit());

        // [THEN] Run is set only on non failed test codeunits and functions
        VerifyRunIsSetOnlyOnNonFailedTestCodeunitsAndFunctions();
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnFilteredTestFunctionsAllDisabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0009] Enable Run on filtered test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on All
        PerformSelectOnAll(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is set only on second test codeunit and its functions
        VerifyRunIsSetOnlyOnSecondTestCodeunitAndItsFunctions(SecondCodeunitID);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnFilteredTestFunctionsAllEnabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0010] Enable Run on filtered test functions (all enabled)
        Initialize();
        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled test functions
        SecondCodeunitID := CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on All
        PerformSelectOnAll(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is set on all test codeunits and functions
        VerifyRunIsSetOnAllTestCodeunitsAndFunctions(SetFilterOn(SecondCodeunitID));
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DisableRunOnFilteredTestFunctionsAllEnabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0011] Disable Run on filtered test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with five enabled test functions
        CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions();
        // [GIVEN] One enabled test codeunit with three enabled test functions
        SecondCodeunitID := CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Deselect on All
        PerformDeselectOnAll(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is not set on second test codeunit and its functions
        VerifyRunIsNotSetOnSecondTestCodeunitAndItsFunctions(SecondCodeunitID);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure DisableRunOnFilteredTestFunctionsAllDisabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0012] Disable Run on filtered test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with five disabled test functions
        CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions();
        // [GIVEN] One disabled test codeunit with three disabled test functions
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Deselect on All
        PerformDeselectOnAll(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is not set on all test codeunits and functions
        VerifyRunIsNotSetOnAllTestCodeunitsAndFunctions(SetFilterOn(SecondCodeunitID));
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnFilteredFailedTestFunctionsAllEnabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0013] Enable Run only on filtered failed test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with enabled test functions five successful
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsFiveSuccessful();
        // [GIVEN] One enabled test codeunit with enabled test functions two successful and two failed
        SecondCodeunitID := CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One enabled test codeunit with enabled test functions two successful and two failed
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on Failures
        PerformSelectOnFailures(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is not set only on non failed functions of second test codeunit
        VerifyRunIsNotSetOnlyOnNonFailedFunctionsOfSecondTestCodeunit(SecondCodeunitID);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnFilteredFailedTestFunctionsAllDisabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0014] Enable Run only on filtered failed test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with disabled test functions five successful
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsFiveSuccessful();
        // [GIVEN] One disabled test codeunit with disabled test functions two successful and two failed
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One disabled test codeunit with disabled test functions two successful and two failed
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on Failures
        PerformSelectOnFailures(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is set only on second test codeunit and its failed functions
        VerifyRunIsSetOnlyOnSecondTestCodeunitAndItsFailedFunctions(SecondCodeunitID);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnFilteredNonFailedTestFunctionsAllEnabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0015] Enable Run only on filtered non failed test functions (all enabled)
        Initialize();

        // [GIVEN] One enabled test codeunit with enabled test functions five successful
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsFiveSuccessful();
        // [GIVEN] One enabled test codeunit with enabled test functions two successful and two failed
        SecondCodeunitID := CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One enabled test codeunit with enabled test functions two successful and two failed
        CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on Non Failures
        PerformSelectOnNonFailures(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is not set only on failed functions of second test codeunit
        VerifyRunIsNotSetOnlyOnFailedFunctionsOfSecondTestCodeunit(SecondCodeunitID);
    end;

    [Test]
    [TransactionModel(TransactionModel::AutoRollback)]
    procedure EnableRunOnlyOnFilteredNonFailedTestFunctionsAllDisabled()
    // [FEATURE] Run on Filtered Test Functions
    var
        SecondCodeunitID: Integer;
    begin
        // [SCENARIO #0016] Enable Run only on filtered non failed test functions (all disabled)
        Initialize();

        // [GIVEN] One disabled test codeunit with disabled test functions five successful
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsFiveSuccessful();
        // [GIVEN] One disabled test codeunit with disabled test functions two successful and two failed
        SecondCodeunitID := CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] One disabled test codeunit with disabled test functions two successful and two failed
        CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed();
        // [GIVEN] Filter on second test codeunit
        // handled by Perform... task in [WHEN] part based on SecondCodeunitID

        // [WHEN] Perform Select on Non Failures
        PerformSelectOnNonFailures(SetFilterOn(SecondCodeunitID));

        // [THEN] Run is set only on second test codeunit and its non failed functions
        VerifyRunIsSetOnlyOnSecondTestCodeunitAndItsNonFailedFunctions(SecondCodeunitID);
    end;

    var
        Assert: Codeunit Assert;
        LibraryTestFunctions: Codeunit "Lib. - Test Function Lns FLX";
        LibraryVerifyActions: Codeunit "Library - Verify Actions FLX";
        LibraryPerformSelect: Codeunit "Library - Perform Select FLX";

        TestSuiteName: Code[10];

    local procedure Initialize()
    var
        LibraryTestInitialize: Codeunit "Library - Test Initialize";
        LibraryUtility: Codeunit "Library - Utility";
    begin
        LibraryTestInitialize.OnTestInitialize(Codeunit::"Run on Test Functions FLX");

        TestSuiteName := LibraryUtility.GenerateGUID();
        LibraryTestFunctions.CreateTestSuite(TestSuiteName);
        LibraryTestFunctions.SetCodeunitBaseID(-92000);
    end;

    local procedure CreateOneDisabledTestCodeunitWithDisabledTestFunctionsFiveSuccessful(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsDisabled(), 5, 0);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneDisabledTestCodeunitWithDisabledTestFunctionsTwoSuccessfulAndTwoFailed(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsDisabled(), 2, 2);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneDisabledTestCodeunitWithFiveDisabledTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsDisabled(), 5, 0);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneDisabledTestCodeunitWithThreeDisabledTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsDisabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsDisabled(), 3, 0);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneEnabledTestCodeunitWithEnabledTestFunctionsFiveSuccessful(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsEnabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsEnabled(), 5, 0);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneEnabledTestCodeunitWithEnabledTestFunctionsTwoSuccessfulAndTwoFailed(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsEnabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsEnabled(), 2, 2);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneEnabledTestCodeunitWithFiveEnabledTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsEnabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsEnabled(), 5, 0);
            exit(GetCurrentCodeunitID())
        end;
    end;

    local procedure CreateOneEnabledTestCodeunitWithThreeEnabledTestFunctions(): Integer
    begin
        with LibraryTestFunctions do begin
            CreateTestCodeunit(TestSuiteName, GetNextCodeunitID(), IsEnabled());
            CreateTestFunctions(TestSuiteName, GetCurrentCodeunitID(), IsEnabled(), 3, 0);
            exit(GetCurrentCodeunitID());
        end;
    end;

    local procedure PerformSelectOnAll(CodeunitID: Integer)
    begin
        LibraryPerformSelect.PerformSelectOnAll(TestSuiteName, CodeunitID)
    end;

    local procedure PerformDeselectOnAll(CodeunitID: Integer)
    begin
        LibraryPerformSelect.PerformDeselectOnAll(TestSuiteName, CodeunitID)
    end;

    local procedure PerformSelectOnFailures(CodeunitID: Integer)
    begin
        LibraryPerformSelect.PerformSelectOnFailures(TestSuiteName, CodeunitID)
    end;

    local procedure PerformSelectOnNonFailures(CodeunitID: Integer)
    begin
        LibraryPerformSelect.PerformSelectOnNonFailures(TestSuiteName, CodeunitID)
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

    local procedure VerifyRunIsSetOnAllTestCodeunitsAndFunctions(CodeunitID: Integer)
    begin
        LibraryVerifyActions.VerifyRunOnAll(TestSuiteName, CodeunitID, IsEnabled())
    end;

    local procedure VerifyRunIsNotSetOnAllTestCodeunitsAndFunctions(CodeunitID: Integer)
    begin
        LibraryVerifyActions.VerifyRunOnAll(TestSuiteName, CodeunitID, IsDisabled())
    end;

    local procedure VerifyRunIsSetOnlyOnFailedTestCodeunitsAndFunctions()
    var
        CALTestLine: Record "CAL Test Line";
        NoOfEnabledLinesInTestSuite: Integer;
        NoOfFailedLinesInTestSuite: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, true);
            NoOfEnabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange(Result, Result::Failure);
            NoOfFailedLinesInTestSuite := Count();
            Assert.AreEqual(NoOfFailedLinesInTestSuite, NoOfEnabledLinesInTestSuite, 'NoOfFailedLines <> NoOfEnabledLines');
        end;
    end;

    local procedure VerifyRunIsSetOnlyOnNonFailedTestCodeunitsAndFunctions()
    var
        CALTestLine: Record "CAL Test Line";
        NoOfEnabledLinesInTestSuite: Integer;
        NoOfNonFailedLinesInTestSuite: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, true);
            NoOfEnabledLinesInTestSuite := Count();
            SetRange(Run);
            SetFilter(Result, '<>%1', Result::Failure);
            NoOfNonFailedLinesInTestSuite := Count();
            Assert.AreEqual(NoOfNonFailedLinesInTestSuite, NoOfEnabledLinesInTestSuite, 'NoOfNonFailedLines <> NoOfEnabledLines');
        end;
    end;

    local procedure VerifyRunIsNotSetOnlyOnFailedFunctionsOfSecondTestCodeunit(CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfDisabledLinesInTestSuite: Integer;
        NoOfFailedLinesInTestCodeunit: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, false);
            NoOfDisabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange("Test Codeunit", CodeunitID);
            SetRange(Result, Result::Failure);
            SetRange("Line Type", "Line Type"::Function);
            NoOfFailedLinesInTestCodeunit := Count();
            Assert.AreEqual(NoOfFailedLinesInTestCodeunit, NoOfDisabledLinesInTestSuite, 'NoOfFailedLines <> NoOfDisabledLines');
        end;
    end;

    local procedure VerifyRunIsNotSetOnlyOnNonFailedFunctionsOfSecondTestCodeunit(CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfDisabledLinesInTestSuite: Integer;
        NoOfNonFailedLinesInTestCodeunit: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, false);
            NoOfDisabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange("Test Codeunit", CodeunitID);
            SetFilter(Result, '<>%1', Result::Failure);
            NoOfNonFailedLinesInTestCodeunit := Count();
            Assert.AreEqual(NoOfNonFailedLinesInTestCodeunit, NoOfDisabledLinesInTestSuite, 'NoOfNonFailedLines <> NoOfDisabledLines');
        end;
    end;

    local procedure VerifyRunIsNotSetOnSecondTestCodeunitAndItsFunctions(CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfDisabledLinesInTestSuite: Integer;
        NoOfLinesInTestCodeunit: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, false);
            NoOfDisabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange("Test Codeunit", CodeunitID);
            NoOfLinesInTestCodeunit := Count();
            Assert.AreEqual(NoOfLinesInTestCodeunit, NoOfDisabledLinesInTestSuite, 'NoOfLinesInTestCodeunit <> NoOfDisabledLines');
        end;
    end;

    local procedure VerifyRunIsSetOnlyOnSecondTestCodeunitAndItsFailedFunctions(CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfEnabledLinesInTestSuite: Integer;
        NoOfFailedLinesInTestCodeunit: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, true);
            NoOfEnabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange("Test Codeunit", CodeunitID);
            SetRange(Result, Result::Failure);
            NoOfFailedLinesInTestCodeunit := Count();
            Assert.AreEqual(NoOfFailedLinesInTestCodeunit, NoOfEnabledLinesInTestSuite, 'NoOfFailedLines <> NoOfEnabledLines');
        end;
    end;

    local procedure VerifyRunIsSetOnlyOnSecondTestCodeunitAndItsFunctions(CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfEnabledLinesInTestSuite: Integer;
        NoOfEnabledLinesInTestCodeunit: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, true);
            NoOfEnabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange("Test Codeunit", CodeunitID);
            NoOfEnabledLinesInTestCodeunit := Count();
            Assert.AreEqual(NoOfEnabledLinesInTestCodeunit, NoOfEnabledLinesInTestSuite, 'NoOfEnabledLinesInTestCodeunit <> NoOfEnabledLines');
        end;
    end;

    local procedure VerifyRunIsSetOnlyOnSecondTestCodeunitAndItsNonFailedFunctions(CodeunitID: Integer)
    var
        CALTestLine: Record "CAL Test Line";
        NoOfEnabledLinesInTestSuite: Integer;
        NoOfNonFailedLinesInTestCodeunit: Integer;
    begin
        with CALTestLine do begin
            SetRange("Test Suite", TestSuiteName);
            SetRange(Run, true);
            NoOfEnabledLinesInTestSuite := Count();
            SetRange(Run);
            SetRange("Test Codeunit", CodeunitID);
            SetFilter(Result, '<>%1', Result::Failure);
            NoOfNonFailedLinesInTestCodeunit := Count();
            Assert.AreEqual(NoOfNonFailedLinesInTestCodeunit, NoOfEnabledLinesInTestSuite, 'NoOfNonFailedLines <> NoOfEnabledLines');
        end;
    end;
}
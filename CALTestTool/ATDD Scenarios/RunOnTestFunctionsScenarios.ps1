$Features = @()

$Features +=
Feature 'Run on Unfiltered Test Functions' {
    Scenario 1 'Enable Run on unfiltered test functions (all disabled)' {
	    Given	'One disabled test codeunit with five disabled test functions'
	    Given	'One disabled test codeunit with three disabled test functions'
	    When	'Perform Select on All'
	    Then	'Run is set on all test codeunits and functions'
    }

    Scenario 2 'Enable Run on unfiltered test functions (all enabled)' {
	    Given	'One enabled test codeunit with five enabled test functions'
	    Given	'One enabled test codeunit with three enabled test functions'
	    When	'Perform Select on All'
	    Then	'Run is set on all test codeunits and functions'
    }

    Scenario 3 'Disable Run on unfiltered test functions (all enabled)' {
	    Given	'One enabled test codeunit with five enabled test functions'
	    Given	'One enabled test codeunit with three enabled test functions'
	    When	'Perform Deselect on All'
	    Then	'Run is not set on all test codeunits and functions'
    }

    Scenario 4 'Disable Run on unfiltered test functions (all disabled)' {
	    Given	'One disabled test codeunit with five disabled test functions'
	    Given	'One disabled test codeunit with three disabled test functions'
	    When	'Perform Deselect on All'
	    Then	'Run is not set on all test codeunits and functions'
    }

    Scenario 5 'Enable Run only on unfiltered failed test functions (all enabled)' {
	    Given	'One enabled test codeunit with enabled test functions five successful'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    When	'Perform Select on Failures'
	    Then	'Run is set only on failed test codeunits and functions'
    }

    Scenario 6 'Enable Run only on unfiltered failed test functions (all disabled)' {
	    Given	'One disabled test codeunit with disabled test functions five successful'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    When	'Perform Select on Failures'
	    Then	'Run is set only on failed test codeunits and functions'
    }

    Scenario 7 'Enable Run only on unfiltered non failed test functions (all enabled)' {
	    Given	'One enabled test codeunit with enabled test functions five successful'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    When	'Perform Select on Non Failures'
	    Then	'Run is set only on non failed test codeunits and functions'
    }

    Scenario 8 'Enable Run only on unfiltered non failed test functions (all disabled)' {
	    Given	'One disabled test codeunit with disabled test functions five successful'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    When	'Perform Select on Non Failures'
	    Then	'Run is set only on non failed test codeunits and functions'
    }
}

$Features +=
Feature 'Run on Filtered Test Functions' {
    Scenario 9 'Enable Run on filtered test functions (all disabled)' {
	    Given	'One disabled test codeunit with five disabled test functions'
	    Given	'One disabled test codeunit with three disabled test functions'
	    Given	'Filter on second test codeunit'
	    When	'Perform Select on All'
	    Then	'Run is set only on second test codeunit and its functions'
    }

    Scenario 10 'Enable Run on filtered test functions (all enabled)' {
	    Given	'One enabled test codeunit with five enabled test functions'
	    Given	'One enabled test codeunit with three enabled test functions'
	    Given	'Filter on second test codeunit'
	    When	'Perform Select on All'
	    Then	'Run is set on all test codeunits and functions'
    }

    Scenario 11 'Disable Run on filtered test functions (all enabled)' {
	    Given	'One enabled test codeunit with five enabled test functions'
	    Given	'One enabled test codeunit with three enabled test functions'
	    Given	'Filter on second test codeunit'
	    When	'Perform Deselect on All'
	    Then	'Run is not set on second test codeunit and its functions'
    }

    Scenario 12 'Disable Run on filtered test functions (all disabled)' {
	    Given	'One disabled test codeunit with five disabled test functions'
	    Given	'One disabled test codeunit with three disabled test functions'
	    Given	'Filter on second test codeunit'
	    When	'Perform Deselect on All'
	    Then	'Run is not set on all test codeunits and functions'
    }

    Scenario 13 'Enable Run only on filtered failed test functions (all enabled)' {
	    Given	'One enabled test codeunit with enabled test functions five successful'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    Given	'Filter on second test codeunit'
	    When	'Perform Select on Failures'
	    Then	'Run is not set only on non failed functions of second test codeunit'
    }

    Scenario 14 'Enable Run only on filtered failed test functions (all disabled)' {
	    Given	'One disabled test codeunit with disabled test functions five successful'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    Given	'Filter on second test codeunit'
	    When	'Perform Select on Failures'
	    Then	'Run is set only on second test codeunit and its failed functions'
    }

    Scenario 15 'Enable Run only on filtered non failed test functions (all enabled)' {
	    Given	'One enabled test codeunit with enabled test functions five successful'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    Given	'One enabled test codeunit with enabled test functions two successful and two failed'
	    Given	'Filter on second test codeunit'
	    When	'Perform Select on Non Failures'
	    Then	'Run is not set only on failed functions of second test codeunit'
    }

    Scenario 16 'Enable Run only on filtered non failed test functions (all disabled)' {
	    Given	'One disabled test codeunit with disabled test functions five successful'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    Given	'One disabled test codeunit with disabled test functions two successful and two failed'
	    Given	'Filter on second test codeunit'
	    When	'Perform Select on Non Failures'
	    Then	'Run is set only on second test codeunit and its non failed functions'
    }
}

$Features | `
    ConvertTo-ALTestCodeunit `
        -CodeunitID 92050 `
        -CodeunitName 'Run on Test Functions FLX' `
        -InitializeFunction `
        -GivenFunctionName "Create {0}" `
        -ThenFunctionName "Verify {0}" `
        # | Out-File '.\Test Codeunits\Cod92050.RunOnTestFunctions.al'
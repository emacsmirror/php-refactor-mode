Feature: Optimize Use

  Scenario: A fully qualified namespace should be optimized
    When I open temp file "optimize-use"
    And I insert:
    """
    <?php

    namespace Testing;


    class ExtractAMethod
    {
        public function internalMethod()
        {
            $localVariable = new \Top\Level\Domain\Name();
            return $localVariable;
        }
    }
    """
    And I save the buffer
    And I turn on php-refactor-mode
    And I press "C-c r ou"
    Then I should see "use Top\Level\Domain\Name"
    And I should see "$localVariable = new Name();"
    And I should not see "new \Top\Level\Domain\Name();"

# GToolkit Contribution Typer

Adds a type checker to the RB AST, used to augment GtCoder.
To install run:

```
Metacello new
    baseline: 'Typer';
    repository: 'github://maenu/gtoolkit-contribution-typer/src/pharo';
    load.
```

For an example usage, run the example in `TypDynExamples`, then inspect the resulted test methods.

Currently based on instrumented invocations under test.

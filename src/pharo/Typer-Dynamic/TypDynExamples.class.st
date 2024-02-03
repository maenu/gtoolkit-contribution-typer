Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #accessing }
TypDynExamples >> blocLayout [
	<gtExample>
	^ TypDynCollector new
		instrument: #'Bloc-Layout' asPackage methods
		doing: [ (GtExampleGroup
				withAll: #'Bloc-Layout-Examples' asPackage gtExamplesAllContained) runAll ]
]

{ #category : #accessing }
TypDynExamples >> blocLayoutDynVsInf [
	<gtExample>
	^ TypDynReportDiff
		dynamic: self blocLayout asIdentityDictionary
		inference: self blocLayoutInference
]

{ #category : #accessing }
TypDynExamples >> blocLayoutInference [
	<gtExample>
	| result package |
	result := Dictionary new.
	package := #'Bloc-Layout' asPackage.
	package methods
		do: [ :m | result at: m methodClass -> m selector put: m typInfMethodLookup result ].
	package definedClasses
		do: [ :c | 
			{c.
				c classSide}
				do: [ :b | 
					(TypInfIndex instance cache
						typAt: {#variables.
								b})
						do: [ :v | 
							result
								at: v
								put: (v typInfAssignedTypeSelf: b typAsType super: b typAsType superOrNil) ] ] ].
	^ result
]

{ #category : #accessing }
TypDynExamples >> blocLayoutOne [
	<gtExample>
	^ TypDynCollector new
		instrument: {BlFlowLayoutChild >> #weight:.
				BlLinearLayoutMeasurer >> #limitedMeasure.
				BlFitChildrenLayout >> #computeAlignmentTranslation:.
				BlFitChildrenLayout >> #layout:}
		doing: [ BlFitChildrenLayoutExamples new atMost_one_child_at_50x50_negated.
			BlLinearLayoutUsageExamples new
				oneChildWithFitContentLimitedExceedsAndThreeChildlren ]
]

{ #category : #accessing }
TypDynExamples >> ifTrueIfFalse [

	<gtExample>
	| i d |
	1 isInteger
		ifTrue: [ 
			i := 1.
			d := 1 ]
		ifFalse: [ d := #d ].
	^ i -> d
]

{ #category : #accessing }
TypDynExamples >> ifTrueIfFalse: aBoolean [

	<gtExample>
	| i d |
	aBoolean
		ifTrue: [ 
			i := 1.
			d := 1 ]
		ifFalse: [ d := 1.2 ].
	^ i -> d
]

{ #category : #accessing }
TypDynExamples >> neoJsonCore [
	<gtExample>
	<typPraResult: 'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| testResult report |
	testResult := TestResult new.
	report := TypDynCollector new
			instrument: #'Neo-JSON-Core' asPackage methods
			doing: [ (#'Neo-JSON-Tests' asPackage definedClasses
					select: [ :e | e isTestCase and: e isAbstract not ])
					do: [ :e "typCastAs TestCase class" | e suite run: testResult ]
					displayingProgress: 'Running test case' ].
	^ testResult -> report -> #'Neo-JSON-Core' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoring [
	<gtExample>
	<typPraResult: 'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| methods collector testResult association |
	methods := self refactoringNonTestPackages flatCollect: #methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
			instrument: methods
			doing: [ ((self refactoringTestPackages flatCollect: #definedClasses)
					select: [ :e | e isTestCase and: e isAbstract not ])
					do: [ :e "typCastAs TestCase class" | e suite run: testResult ]
					displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
		-> (self refactoringNonTestPackages flatCollect: #methods)
]

{ #category : #accessing }
TypDynExamples >> refactoring2Transformations [
	<gtExample>
	<typPraResult: 'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| testResult report |
	testResult := TestResult new.
	report := TypDynCollector new
			instrument: #'Refactoring2-Transformations' asPackage methods
			doing: [ (#'Refactoring2-Transformations-Tests' asPackage definedClasses
					select: [ :e | e isTestCase and: e isAbstract not ])
					do: [ :e "typCastAs TestCase class" | e suite run: testResult ]
					displayingProgress: 'Running test case' ].
	^ testResult -> report -> #'Refactoring2-Transformations' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoringCore [
	<gtExample>
	| testResult report |
	report := TypDynCollector new
			instrument: #'Refactoring-Core' asPackage methods
			doing: [ testResult := self refactoringCoreRun ].
	^ testResult -> report
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreRun [
	^ #'Refactoring-Tests-Core' asPackage testSuite run
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreSmall [
	<gtExample>
	<typPraResult: 'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| testResult report |
	report := TypDynCollector new
			instrument: #'Refactoring-Core' asPackage methods
			doing: [ testResult := RBAddReturnStatementTransformationTest suite run ].
	^ testResult -> report
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreSmallRun [
	<gtExample>
	^ RBAddReturnStatementTransformationTest suite run
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreVerySmall [
	<gtExample>
	<typPraResult: 'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| testResult report |
	report := TypDynCollector new
			instrument: #'Refactoring-Core' asPackage methods
			doing: [ testResult := RBMethodNameTest suite run ].
	^ testResult -> report
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreVeryVerySmall [
	<gtExample>
	| testResult report |
	report := TypDynCollector new
			instrument: #'Refactoring-Core' asPackage methods
			doing: [ testResult := (RBMethodNameTest selector: #testCreation) debug ].
	^ testResult -> report
]

{ #category : #'as yet unclassified' }
TypDynExamples >> refactoringNonTestPackages [
	^ (RPackage organizer packages
		select: [ :e | 
			e class = RPackage
				and: [ e name ~= 'RefactoringNew'
						and: [ (e name beginsWith: 'Refactoring')
								and: [ (e name includesSubstring: 'Test') not ] ] ] ])
		asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #'as yet unclassified' }
TypDynExamples >> refactoringTestPackages [
	^ (RPackage organizer packages
		select: [ :e | 
			e class = RPackage
				and: [ e name ~= 'RefactoringNew'
						and: [ (e name beginsWith: 'Refactoring')
								and: [ e name includesSubstring: 'Test' ] ] ] ])
		asSortedCollection: [ :a :b | a name <= b name ]
]

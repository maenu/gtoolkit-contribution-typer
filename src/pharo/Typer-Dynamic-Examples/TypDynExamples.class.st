Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #accessing }
TypDynExamples >> neoJsonCore [

	<gtExample>
	<typPraResult:
	'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| methods collector testResult association |
	methods := #'Neo-JSON-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector collectIn: methods doing: [ 
		               (#'Neo-JSON-Tests' asPackage definedClasses select: [ 
			                :e | e isTestCase and: e isAbstract not ])
			               do: [ :e "typCastAs TestCase class" | 
			               e suite run: testResult ]
			               displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
	  -> #'Neo-JSON-Core' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoring [

	<gtExample>
	<typPraResult:
	'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| methods collector testResult association |
	methods := self refactoringNonTestPackages flatCollect: #methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector collectIn: methods doing: [ 
		               ((self refactoringTestPackages flatCollect:
			                 #definedClasses) select: [ :e | 
			                e isTestCase and: e isAbstract not ])
			               do: [ :e "typCastAs TestCase class" | 
			               e suite run: testResult ]
			               displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
	  -> (self refactoringNonTestPackages flatCollect: #methods)
]

{ #category : #accessing }
TypDynExamples >> refactoring2Transformations [

	<gtExample>
	<typPraResult:
	'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| methods collector testResult association |
	methods := #'Refactoring2-Transformations' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector collectIn: methods doing: [ 
		               (#'Refactoring2-Transformations-Tests' asPackage
			                definedClasses select: [ :e | 
			                e isTestCase and: e isAbstract not ])
			               do: [ :e "typCastAs TestCase class" | 
			               e suite run: testResult ]
			               displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
	  -> #'Refactoring2-Transformations' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoringCore [

	<gtExample>
	<typPraResult:
	'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| methods collector testResult association |
	methods := #'Refactoring-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector collectIn: methods doing: [ 
		               (#'Refactoring-Tests-Core' asPackage definedClasses 
			                select: [ :e | e isTestCase and: e isAbstract not ])
			               do: [ :e "typCastAs TestCase class" | 
			               e suite run: testResult ]
			               displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
	  -> #'Refactoring-Core' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreSmall [

	<gtExample>
	<typPraResult:
	'Association<TestResult,Collection<CompiledMethod()->Object>>'>
	| methods collector testResult association |
	methods := #'Refactoring-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector collectIn: methods doing: [ 
		               ({ RBRenameMethodTest } select: [ :e | 
			                e isTestCase and: e isAbstract not ])
			               do: [ :e "typCastAs TestCase class" | 
			               e suite run: testResult ]
			               displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
	  -> #'Refactoring-Core' asPackage methods
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

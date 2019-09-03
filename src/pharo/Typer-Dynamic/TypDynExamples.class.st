Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #accessing }
TypDynExamples >> neoJsonCore [
	<gtExample>
	<typTypeResultAs: 'Association<TestResult,Collection<CompiledMethod<Integer>>>'>
	| methods collector testResult association |
	methods := #'Neo-JSON-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ (#'Neo-JSON-Tests' asPackage definedClasses
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e"typCastAs TestCase class"
					 | e suite run: testResult ]
				displayingProgress: 'Running test case' ].
	^ testResult -> association key value -> association value
		-> #'Neo-JSON-Core' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoringCore [
	<gtExample>
	<typTypeResultAs: 'Association<TestResult,Collection<CompiledMethod<Integer>>>'>
	| methods collector testResult association |
	methods := #'Refactoring-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ (#'Refactoring-Tests-Core' asPackage definedClasses
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e"typCastAs TestCase class"
					 | e suite run: testResult ]
				displayingProgress: 'Running test case'  ].
	^ testResult -> association key value -> association value
		-> #'Refactoring-Core' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoringCoreSmall [
	<gtExample>
	<typTypeResultAs: 'Association<TestResult,Collection<CompiledMethod<Integer>>>'>
	| methods collector testResult association |
	methods := #'Refactoring-Core' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ ({RBAddClassTest}
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e"typCastAs TestCase class"
					 | e suite run: testResult ]
				displayingProgress: 'Running test case'  ].
	^ testResult -> association key value -> association value
		-> #'Refactoring-Core' asPackage methods
]

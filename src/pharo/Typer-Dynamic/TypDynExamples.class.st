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
	(TypMethodLookupIndex instance resolver resolver resolvers first resolver resolvers last
		isKindOf: TypDynLookupResolver)
		ifTrue: [ TypMethodLookupIndex instance resolver resolver resolvers first resolver resolvers removeLast ].
	(TypVariableLookupIndex instance resolver resolver resolvers first resolver resolvers last
		isKindOf: TypDynLookupResolver)
		ifTrue: [ TypVariableLookupIndex instance resolver resolver resolvers first resolver resolvers removeLast ].
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
	TypVariableLookupIndex instance resolver resolver resolvers first resolver resolvers add: association key value.
	TypVariableLookupIndex instance resolver resolver resolvers first resolver resolvers add: association value.
	^ testResult -> association key value -> association value
		-> #'Neo-JSON-Core' asPackage methods
]

{ #category : #accessing }
TypDynExamples >> refactoring [
	<gtExample>
	<typTypeResultAs: 'Association<TestResult,Collection<CompiledMethod<Integer>>>'>
	| methods collector testResult association |
	(TypMethodLookupIndex instance resolvers last
		isKindOf: TypDynLookupResolver)
		ifTrue: [ TypMethodLookupIndex instance resolvers removeLast ].
	(TypVariableLookupIndex instance resolvers last
		isKindOf: TypDynLookupResolver)
		ifTrue: [ TypVariableLookupIndex instance resolvers removeLast ].
	methods := self refactoringNonTestPackages flatCollect: #methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ ((self refactoringTestPackages flatCollect: #definedClasses)
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e"typCastAs TestCase class"
					 | e suite run: testResult ]
				displayingProgress: 'Running test case' ].
	TypMethodLookupIndex instance add: association key value.
	TypVariableLookupIndex instance add: association value.
	^ testResult -> association key value -> association value
		-> (self refactoringNonTestPackages flatCollect: #methods)
]

{ #category : #accessing }
TypDynExamples >> refactoring2Transformations [
	<gtExample>
	<typTypeResultAs: 'Association<TestResult,Collection<CompiledMethod<Integer>>>'>
	| methods collector testResult association |
	(TypMethodLookupIndex instance resolvers last
		isKindOf: TypDynLookupResolver)
		ifTrue: [ TypMethodLookupIndex instance resolvers removeLast ].
	(TypVariableLookupIndex instance resolvers last
		isKindOf: TypDynLookupResolver)
		ifTrue: [ TypVariableLookupIndex instance resolvers removeLast ].
	methods := #'Refactoring2-Transformations' asPackage methods.
	collector := TypDynCollector new.
	testResult := TestResult new.
	association := collector
		collectIn: methods
		doing: [ (#'Refactoring2-Transformations-Tests' asPackage definedClasses
				select: [ :e | e isTestCase and: e isAbstract not ])
				do: [ :e"typCastAs TestCase class"
					 | e suite run: testResult ]
				displayingProgress: 'Running test case' ].
	TypMethodLookupIndex instance add: association key value.
	TypVariableLookupIndex instance add: association value.
	^ testResult -> association key value -> association value
		-> #'Refactoring2-Transformations' asPackage methods
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

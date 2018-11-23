Class {
	#name : #TypDynExamples,
	#superclass : #Object,
	#category : #'Typer-Dynamic-Examples'
}

{ #category : #'as yet unclassified' }
TypDynExamples >> installOnNeoJsonCore [
	<gtExample>
	| package |
	package := #'Neo-JSON-Core' asPackage.
	self uninstallFromAll.
	TypDynTypeCollector installOnPackage: package.
	^ package
]

{ #category : #accessing }
TypDynExamples >> neoJsonCore [
	<gtExample>
	| package testResult |
	self uninstallFromAll.
	package := self installOnNeoJsonCore.
	testResult := self runTestsInNeoJsonTests.
	^ package -> testResult
]

{ #category : #'as yet unclassified' }
TypDynExamples >> runTestsInNeoJsonTests [
	<gtExample>
	| testResult |
	testResult := self runTestsInPackage: #'Neo-JSON-Tests' asPackage.
	^ testResult
]

{ #category : #'as yet unclassified' }
TypDynExamples >> runTestsInPackage: aPackage [
	| result |
	result := TestResult new.
	(aPackage definedClasses select: [ :e | e isTestCase and: e isAbstract not ])
		do: [ :e | e suite run: result ].
	^ result
]

{ #category : #'as yet unclassified' }
TypDynExamples >> uninstallFromAll [
	<gtExample>
	| installedMethods |
	TypDynTypeCollector uninstallFromAll.
	installedMethods := TypDynTypeCollector asts.
	self assert: installedMethods isEmpty.
	^ installedMethods
]

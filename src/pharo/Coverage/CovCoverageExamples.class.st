Class {
	#name : #CovCoverageExamples,
	#superclass : #Object,
	#category : #'Coverage-Examples'
}

{ #category : #'as yet unclassified' }
CovCoverageExamples >> installOnNeoJsonCore [
	<gtExample>
	| package |
	package := #'Neo-JSON-Core' asPackage.
	self uninstallFromAllInstalledMethods.
	CovCoverage installOnPackage: package.
	^ package
]

{ #category : #'as yet unclassified' }
CovCoverageExamples >> neoJsonCore [
	<gtExample>
	| package testResult |
	self uninstallFromAllInstalledMethods.
	package := self installOnNeoJsonCore.
	testResult := self runTestsInNeoJsonTests.
	^ package -> testResult
]

{ #category : #'as yet unclassified' }
CovCoverageExamples >> runTestsInNeoJsonTests [
	<gtExample>
	| testResult |
	testResult := self runTestsInPackage: #'Neo-JSON-Tests' asPackage.
	^ testResult
]

{ #category : #'as yet unclassified' }
CovCoverageExamples >> runTestsInPackage: aPackage [
	| result |
	result := TestResult new.
	(aPackage definedClasses select: [ :e | e isTestCase and: e isAbstract not ])
		do: [ :e | e suite run: result ].
	^ result
]

{ #category : #'as yet unclassified' }
CovCoverageExamples >> uninstallFromAllInstalledMethods [
	<gtExample>
	| installedMethods |
	CovCoverage uninstallFromAllInstalledMethods.
	installedMethods := CovCoverage installedMethods.
	self assert: installedMethods isEmpty.
	^ installedMethods
]

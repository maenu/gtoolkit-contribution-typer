Class {
	#name : #CovCoverageExamples,
	#superclass : #Object,
	#category : #Coverage
}

{ #category : #'as yet unclassified' }
CovCoverageExamples >> installOnZincHttp [
	<gtExample>
	| testResult |
	testResult := self runTestsInPackage: #'Zinc-Tests' asPackage.
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
CovCoverageExamples >> runTestsInZinc [
	<gtExample>
	| package |
	package := #'Zinc-HTTP' asPackage.
	CovCoverage installOnPackage: package.
	^ package
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

{ #category : #'as yet unclassified' }
CovCoverageExamples >> zincHttp [
	<gtExample>
	| package testResult |
	self uninstallFromAllInstalledMethods.
	package := self installOnZincHttp.
	testResult := self runTestsInZinc.
	^ package -> testResult
]

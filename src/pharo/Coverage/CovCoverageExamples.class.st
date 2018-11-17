Class {
	#name : #CovCoverageExamples,
	#superclass : #Object,
	#category : #Coverage
}

{ #category : #'as yet unclassified' }
CovCoverageExamples >> runTestsInPackage: aPackage [
	| result |
	result := TestResult new.
	(aPackage definedClasses select: [ :e | e isTestCase and: e isAbstract not ])
		do: [ :e | e suite run: result ].
	^ result
]

{ #category : #'as yet unclassified' }
CovCoverageExamples >> zincHttp [
	<gtExample>
	| package |
	package := #'Zinc-HTTP' asPackage.
	CovCoverage uninstallFromAllInstalledMethods.
	CovCoverage installOnPackage: package.
	^ package -> (self runTestsInPackage: #'Zinc-Tests' asPackage)
]

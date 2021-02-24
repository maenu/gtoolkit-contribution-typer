Class {
	#name : #TypShaPhaTestSuite,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaTestSuite class >> shadowedClass [
	^ TestSuite class
]

{ #category : #shadow }
TypShaPhaTestSuite >> mRun: aLookup [
	<typShaMethod: 'run:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {TestResult typAsType}
]

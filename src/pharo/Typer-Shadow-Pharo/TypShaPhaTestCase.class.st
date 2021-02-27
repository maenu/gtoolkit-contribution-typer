Class {
	#name : #TypShaPhaTestCase,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaTestCase class >> mSuite: aLookup [
	<typShaMethod: 'suite'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: TestSuite typAsType
]

{ #category : #'as yet unclassified' }
TypShaPhaTestCase class >> shadowedClass [
	^ TestCase class
]

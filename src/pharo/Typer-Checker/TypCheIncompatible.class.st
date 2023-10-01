Class {
	#name : #TypCheIncompatible,
	#superclass : #TypCheWarning,
	#instVars : [
		'expected'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheIncompatible class >> signal: aNode expected: aType [
	^ self new
		node: aNode;
		expected: aType;
		signal
]

{ #category : #accessing }
TypCheIncompatible class >> signal: aNode message: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypCheIncompatible >> expected [
	<typPraResult: 'TypType'>
	^ expected
]

{ #category : #accessing }
TypCheIncompatible >> expected: anObject [
	<typPraArguments: 'TypType'>
	expected := anObject
]

{ #category : #accessing }
TypCheIncompatible >> messageText [
	messageText ifNotNil: [ ^ super messageText ].
	^ messageText := 'expected {1}, but was {2}'
			format: {expected.
					node type}
]

{ #category : #accessing }
TypCheIncompatible >> priority [
	^ 1
]

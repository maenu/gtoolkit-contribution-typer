Class {
	#name : #TypCheNoMethod,
	#superclass : #TypCheWarning,
	#instVars : [
		'selector'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheNoMethod class >> signal: aNode message: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypCheNoMethod class >> signal: aNode selector: aSymbol [
	^ self new
		node: aNode;
		selector: aSymbol;
		signal
]

{ #category : #accessing }
TypCheNoMethod >> messageText [
	messageText ifNotNil: [ ^ super messageText ].
	^ messageText := '{1} cannot lookup {2}'
			format: {node type.
					selector}
]

{ #category : #accessing }
TypCheNoMethod >> priority [
	^ 0
]

{ #category : #accessing }
TypCheNoMethod >> selector [
	<typPraResult: 'Symbol'>
	^ selector
]

{ #category : #accessing }
TypCheNoMethod >> selector: anObject [
	<typPraArguments: 'Symbol'>
	selector := anObject
]

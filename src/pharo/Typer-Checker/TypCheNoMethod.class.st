Class {
	#name : #TypCheNoMethod,
	#superclass : #TypCheWarning,
	#instVars : [
		'selector'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheNoMethod class >> node: aNode message: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypCheNoMethod class >> node: aNode selector: aSymbol [
	^ self new
		node: aNode;
		selector: aSymbol;
		yourself
]

{ #category : #accessing }
TypCheNoMethod >> messageText [
	messageText ifNotNil: [ ^ super messageText ].
	^ messageText := '{1} cannot lookup {2}'
			format: {node receiver.
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
Class {
	#name : #TypVariableLookup,
	#superclass : #TypObjectLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookup class >> origin: anOrigin receiverType: aType selector: aSymbol [
	^ self new
		initializeOrigin: anOrigin;
		initializeReceiverType: aType selector: aSymbol;
		yourself
]

{ #category : #accessing }
TypVariableLookup >> asSuperType [
	self assert: [ self hasSuperType ].
	^ self class
		origin: self asOrigin
		receiverType: receiverType superType
		selector: selector
]

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

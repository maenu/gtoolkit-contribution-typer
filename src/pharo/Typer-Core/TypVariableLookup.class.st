Class {
	#name : #TypVariableLookup,
	#superclass : #TypPropertyLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookup class >> origin: anOrigin receiverType: aType selector: aSymbol [
	^ self new
		initializeOrigin: anOrigin;
		initializeReceiverType: aType selector: aSymbol;
		yourself
]

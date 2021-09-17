Class {
	#name : 'TypVariableLookup',
	#superclass : 'TypPropertyLookup',
	#category : 'Typer-Core-Lookup'
}

{ #category : 'accessing' }
TypVariableLookup class >> receiver: aType selector: aSymbol [
	^ self new
		initializeReceiver: aType selector: aSymbol;
		yourself
]

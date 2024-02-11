Class {
	#name : #TypDynVariable,
	#superclass : #TypDynItem,
	#instVars : [
		'variable'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynVariable >> printOn: aStream [
	aStream
		nextPutAll: name asString;
		nextPutAll: ' i:';
		nextPutAll: inf asString;
		nextPutAll: ' d:';
		nextPutAll: dyn asString
]

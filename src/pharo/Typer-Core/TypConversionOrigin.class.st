Class {
	#name : #TypConversionOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'type',
		'selector',
		'arguments'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypConversionOrigin class >> type: aType selector: aSymbol arguments: aCollection [
	^ self new
		initializeType: aType selector: aSymbol arguments: aCollection;
		yourself
]

{ #category : #accessing }
TypConversionOrigin >> initializeType: aType selector: aSymbol arguments: aCollection [
	type := type.
	selector := aSymbol.
	arguments := aCollection
]

{ #category : #accessing }
TypConversionOrigin >> printOn: aStream [
	type printOn: aStream.
	aStream nextPutAll: ' '.
	selector printOn: aStream.
	aStream nextPutAll: ' '.
	arguments printOn: aStream
]

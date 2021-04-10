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
TypConversionOrigin >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	anObject type = type
		ifFalse: [ ^ false ].
	anObject selector = selector
		ifFalse: [ ^ false ].
	^ anObject arguments = arguments
]

{ #category : #accessing }
TypConversionOrigin >> arguments [
	^ arguments
]

{ #category : #accessing }
TypConversionOrigin >> hash [
	^ ((super hash bitXor: type hash) bitXor: selector hash)
		bitXor: arguments hash
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
	aStream
		nextPut: $ ;
		nextPutAll: selector;
		nextPutAll: $ .
	arguments printOn: aStream
]

{ #category : #accessing }
TypConversionOrigin >> selector [
	^ selector
]

{ #category : #accessing }
TypConversionOrigin >> type [
	^ type
]

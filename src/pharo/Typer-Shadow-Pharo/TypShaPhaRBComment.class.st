Class {
	#name : #TypShaPhaRBComment,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBComment class >> shadowedClass [
	^ RBComment class
]

{ #category : #shadow }
TypShaPhaRBComment >> mContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaRBComment >> mStart: aLookup [
	<typShaMethod: 'start'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBComment >> mStop: aLookup [
	<typShaMethod: 'stop'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

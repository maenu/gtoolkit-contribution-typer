Class {
	#name : #TypShaGtGtDocument,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtDocument class >> shadowedClass [
	^ GtDocument class
]

{ #category : #shadow }
TypShaGtGtDocument >> mAsElement: aLookup [
	<typShaMethod: 'asElement'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlElement typAsType
]

{ #category : #shadow }
TypShaGtGtDocument >> mStrategy: aLookup [
	<typShaMethod: 'strategy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {GtStorageStrategy typAsType}
]

{ #category : #shadow }
TypShaGtGtDocument >> mText: aLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{String typAsType.
			BlRope typAsType} typAsType}
]

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
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: BlElement typAsType
]

{ #category : #shadow }
TypShaGtGtDocument >> mStrategy: aLookup [
	<typShaMethod: 'strategy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Gt2StorageStrategy typAsType}
]

{ #category : #shadow }
TypShaGtGtDocument >> mText: aLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{String typAsType.
			BlRope typAsType} typAsType}
]
